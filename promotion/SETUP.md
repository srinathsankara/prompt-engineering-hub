# Setting up announcement shipping

The `ship.py` agent posts announcements in this folder to Reddit and X.
Credentials are read from environment variables — never commit them.

## Local usage

```bash
# Show what would be posted (no network calls)
python promotion/ship.py preview

# Preview one file
python promotion/ship.py preview launch-001-twitter.md

# Publish (dry-run first to validate without posting)
python promotion/ship.py publish --dry-run

# Publish for real
python promotion/ship.py publish
```

## Reddit credentials

1. Go to https://www.reddit.com/prefs/apps and create a **script** app.
2. Note the `client_id` (under the app name) and `client_secret`.
3. Set env vars:

```bash
export REDDIT_CLIENT_ID="..."
export REDDIT_CLIENT_SECRET="..."
export REDDIT_USERNAME="your_username"
export REDDIT_PASSWORD="your_password"
```

Windows (PowerShell):

```powershell
$env:REDDIT_CLIENT_ID = "..."
$env:REDDIT_CLIENT_SECRET = "..."
$env:REDDIT_USERNAME = "your_username"
$env:REDDIT_PASSWORD = "your_password"
```

> Note: brand-new accounts often get posts auto-removed. Build some karma first, and check `https://www.reddit.com/user/<you>/submitted/` after posting.

## X (Twitter) credentials

1. Go to https://developer.twitter.com — you need a paid API tier for posting.
2. Create an app, generate API key/secret and access token/secret with **read/write** permission.
3. Set env vars:

```bash
export TWITTER_API_KEY="..."
export TWITTER_API_SECRET="..."
export TWITTER_ACCESS_TOKEN="..."
export TWITTER_ACCESS_SECRET="..."
```

## Automated posting (GitHub Actions)

The `promotion-ship.yml` workflow runs on a schedule (Mon/Wed/Fri 09:30 UTC)
and on manual dispatch (`Actions` tab → Promotion Ship → Run workflow).

Add these **repository secrets** (Settings → Secrets and variables → Actions):

| Secret | Value |
|---|---|
| `REDDIT_CLIENT_ID` | Reddit script app client id |
| `REDDIT_CLIENT_SECRET` | Reddit script app secret |
| `REDDIT_USERNAME` | Your Reddit username |
| `REDDIT_PASSWORD` | Your Reddit password |
| `TWITTER_API_KEY` | X API key |
| `TWITTER_API_SECRET` | X API secret |
| `TWITTER_ACCESS_TOKEN` | X access token |
| `TWITTER_ACCESS_SECRET` | X access token secret |

## How it avoids double-posting

Each announcement has an `id` in its frontmatter. After a successful post,
`promotion/.ship-state.json` records the platform + post id + timestamp.
`ship.py` skips any announcement/platform combination already recorded,
so re-running (including scheduled runs) never posts the same thing twice.

## Announcement format

Each file is Markdown with simple frontmatter:

```markdown
---
id: launch-001
title: "Post title"
status: draft   # draft | ready | shipped | skipped
platforms:
  reddit:
    subreddit: PromptEngineering
    title: "[Showcase] ..."
  twitter:
    hashtags: "#prompts #ai"
---

Body text goes here.
```

- `status: draft` announcements are still previewed but the workflow skips them unless status is `ready` or `shipped`.
- Set `status: ready` to include the file in scheduled publishing.
