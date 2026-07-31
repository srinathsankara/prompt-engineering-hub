#!/usr/bin/env python3
"""Ship promotion announcements to Reddit and X.

Usage:
    python promotion/ship.py preview [FILE...]
    python promotion/ship.py publish [FILE...]

Credentials come from environment variables (never committed):
    REDDIT_CLIENT_ID, REDDIT_CLIENT_SECRET, REDDIT_USERNAME, REDDIT_PASSWORD
    TWITTER_API_KEY, TWITTER_API_SECRET, TWITTER_ACCESS_TOKEN, TWITTER_ACCESS_SECRET

State is tracked in promotion/.ship-state.json so nothing posts twice.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
    sys.stderr.reconfigure(encoding="utf-8")

PROMOTION_DIR = Path(__file__).resolve().parent
STATE_FILE = PROMOTION_DIR / ".ship-state.json"
DEFAULT_STATUS = "draft"
TWITTER_LIMIT = 280


def parse_frontmatter(text: str) -> tuple[dict, str]:
    """Extract YAML-ish frontmatter (simple indentation-based parser)."""
    text = text.lstrip("\ufeff")
    if not text.startswith("---"):
        return {}, text.strip()
    parts = text.split("---", 2)
    if len(parts) < 3:
        return {}, text.strip()
    fm_raw, body = parts[1], parts[2]

    def _parse_block(lines: list[str], index: int, indent: int) -> tuple[dict, int]:
        result: dict = {}
        while index < len(lines):
            line = lines[index]
            if not line.strip() or line.lstrip().startswith("#"):
                index += 1
                continue
            cur_indent = len(line) - len(line.lstrip())
            if cur_indent < indent:
                break
            if cur_indent > indent:
                index += 1
                continue
            stripped = line.strip()
            if ":" not in stripped:
                index += 1
                continue
            key, _, value = stripped.partition(":")
            key = key.strip()
            value = value.strip().strip('"').strip("'")
            index += 1
            if value == "":
                child, index = _parse_block(lines, index, cur_indent + 2)
                result[key] = child if child else ""
            elif value.lower() in ("true", "false"):
                result[key] = value.lower() == "true"
            elif re.fullmatch(r"-?\d+", value):
                result[key] = int(value)
            else:
                result[key] = value
        return result, index

    lines = fm_raw.splitlines()
    meta, _ = _parse_block(lines, 0, 0)
    return meta, body.strip()


def load_announcements(paths: list[str]) -> list[dict]:
    if paths:
        files = [PROMOTION_DIR / p for p in paths]
    else:
        files = sorted(PROMOTION_DIR.glob("*.md"))
    announcements = []
    for path in files:
        if not path.exists():
            print(f"[warn] not found: {path}")
            continue
        meta, body = parse_frontmatter(path.read_text(encoding="utf-8"))
        if not meta.get("id") or not meta.get("platforms"):
            # Documentation or non-announcement file — skip.
            continue
        meta.setdefault("id", path.stem)
        meta.setdefault("status", DEFAULT_STATUS)
        meta.setdefault("file", path.name)
        meta.setdefault("body", body)
        announcements.append(meta)
    return announcements


def load_state() -> dict:
    if STATE_FILE.exists():
        return json.loads(STATE_FILE.read_text(encoding="utf-8"))
    return {}


def save_state(state: dict) -> None:
    STATE_FILE.write_text(json.dumps(state, indent=2), encoding="utf-8")


def build_tweet(meta: dict) -> str:
    hashtags = (meta.get("platforms", {}).get("twitter", {}) or {}).get("hashtags", "")
    text = meta.get("body", "").strip()
    if hashtags and hashtags not in text:
        if len(text) + 1 + len(hashtags) <= TWITTER_LIMIT:
            text = f"{text} {hashtags}"
    return text


def build_reddit_post(meta: dict) -> tuple[str, str]:
    platforms = meta.get("platforms", {}) or {}
    reddit = platforms.get("reddit", {}) or {}
    title = reddit.get("title") or meta.get("title", meta.get("id", ""))
    return title, meta.get("body", "").strip()


def preview(announcements: list[dict]) -> None:
    for meta in announcements:
        print(f"\n{'=' * 70}")
        print(f"[{meta['status']}] {meta['file']}  ({meta.get('id')})")
        print(f"{'=' * 70}")
        if "reddit" in (meta.get("platforms") or {}):
            title, body = build_reddit_post(meta)
            print("\n  REDDIT")
            print(f"  title : {title}")
            print(f"  sub   : {(meta['platforms']['reddit'] or {}).get('subreddit', '?')}")
            print(f"  body  : {body[:300]}{'...' if len(body) > 300 else ''}")
        if "twitter" in (meta.get("platforms") or {}):
            tweet = build_tweet(meta)
            print("\n  TWITTER")
            print(f"  tweet : {tweet}")
            print(f"  chars : {len(tweet)}/{TWITTER_LIMIT} {'OK' if len(tweet) <= TWITTER_LIMIT else 'TOO LONG'}")
        print()


def publish(announcements: list[dict], dry_run: bool = False) -> int:
    state = load_state()
    exit_code = 0

    for meta in announcements:
        ann_id = meta.get("id")
        shipped = state.get(ann_id, {})

        status = meta.get("status", DEFAULT_STATUS)
        if status not in ("ready", "shipped"):
            print(f"[skip] {ann_id}: status is '{status}', set 'ready' to publish")
            continue

        platforms = meta.get("platforms", {}) or {}

        if "reddit" in platforms:
            if shipped.get("reddit"):
                print(f"[skip] {ann_id}: reddit already posted ({shipped['reddit'].get('url')})")
            else:
                title, body = build_reddit_post(meta)
                subreddit = (platforms["reddit"] or {}).get("subreddit", "")
                if dry_run:
                    print(f"[dry-run] reddit r/{subreddit}: {title}")
                else:
                    post_url = _post_reddit(subreddit, title, body)
                    if post_url:
                        state.setdefault(ann_id, {})["reddit"] = {
                            "url": post_url,
                            "posted_at": datetime.now(timezone.utc).isoformat(),
                        }
                        print(f"[posted] reddit: {post_url}")
                    else:
                        exit_code = 1

        if "twitter" in platforms:
            if shipped.get("twitter"):
                print(f"[skip] {ann_id}: twitter already posted ({shipped['twitter'].get('id')})")
            else:
                tweet = build_tweet(meta)
                if len(tweet) > TWITTER_LIMIT:
                    print(f"[error] {ann_id}: tweet {len(tweet)} chars exceeds {TWITTER_LIMIT}")
                    exit_code = 1
                    continue
                if dry_run:
                    print(f"[dry-run] twitter: {tweet}")
                else:
                    tweet_id = _post_twitter(tweet)
                    if tweet_id:
                        state.setdefault(ann_id, {})["twitter"] = {
                            "id": tweet_id,
                            "posted_at": datetime.now(timezone.utc).isoformat(),
                        }
                        print(f"[posted] twitter id={tweet_id}")
                    else:
                        exit_code = 1

    save_state(state)
    return exit_code


def _post_reddit(subreddit: str, title: str, body: str) -> str | None:
    try:
        import praw
    except ImportError:
        print("[error] praw not installed. Run: pip install -r promotion/requirements.txt")
        return None
    required = ["REDDIT_CLIENT_ID", "REDDIT_CLIENT_SECRET", "REDDIT_USERNAME", "REDDIT_PASSWORD"]
    if any(os.environ.get(k) is None for k in required):
        print(f"[error] missing env: {', '.join(k for k in required if os.environ.get(k) is None)}")
        return None
    reddit = praw.Reddit(
        client_id=os.environ["REDDIT_CLIENT_ID"],
        client_secret=os.environ["REDDIT_CLIENT_SECRET"],
        user_agent=f"promotion-shipper/1.0 by {os.environ['REDDIT_USERNAME']}",
        username=os.environ["REDDIT_USERNAME"],
        password=os.environ["REDDIT_PASSWORD"],
    )
    try:
        submission = reddit.subreddit(subreddit).submit(title=title, selftext=body)
        return f"https://www.reddit.com{submission.permalink}"
    except Exception as exc:  # noqa: BLE001
        print(f"[error] reddit submit failed: {exc}")
        return None


def _post_twitter(text: str) -> str | None:
    try:
        import tweepy
    except ImportError:
        print("[error] tweepy not installed. Run: pip install -r promotion/requirements.txt")
        return None
    required = ["TWITTER_API_KEY", "TWITTER_API_SECRET", "TWITTER_ACCESS_TOKEN", "TWITTER_ACCESS_SECRET"]
    if any(os.environ.get(k) is None for k in required):
        print(f"[error] missing env: {', '.join(k for k in required if os.environ.get(k) is None)}")
        return None
    client = tweepy.Client(
        consumer_key=os.environ["TWITTER_API_KEY"],
        consumer_secret=os.environ["TWITTER_API_SECRET"],
        access_token=os.environ["TWITTER_ACCESS_TOKEN"],
        access_token_secret=os.environ["TWITTER_ACCESS_SECRET"],
    )
    try:
        response = client.create_tweet(text=text)
        return response.data["id"]
    except Exception as exc:  # noqa: BLE001
        print(f"[error] twitter post failed: {exc}")
        return None


def main() -> int:
    parser = argparse.ArgumentParser(description="Ship announcements to Reddit and X.")
    sub = parser.add_subparsers(dest="command", required=True)

    p_preview = sub.add_parser("preview", help="Show what would be posted (no network).")
    p_preview.add_argument("files", nargs="*", help="Specific announcement files (default: all).")

    p_publish = sub.add_parser("publish", help="Post announcements to configured platforms.")
    p_publish.add_argument("files", nargs="*", help="Specific announcement files (default: all).")
    p_publish.add_argument("--dry-run", action="store_true", help="Validate without posting.")

    args = parser.parse_args()
    announcements = load_announcements(args.files)

    if args.command == "preview":
        preview(announcements)
        return 0

    return publish(announcements, dry_run=args.dry_run)


if __name__ == "__main__":
    sys.exit(main())
