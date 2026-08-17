---
id: launch-001
created: 2026-07-30
title: "111 production-ready prompts from a 20-year solution architect"
summary: "Battle-tested enterprise prompts — tax, audit, risk, SRE — now open source."
status: ready
platforms:
  reddit:
    subreddit: PromptEngineering
    title: "[Showcase] 111 production prompts from an enterprise architect — tax, SRE, K8s, risk, AI governance"
---

**[Showcase] 111 production prompts from an enterprise architect — tax, SRE, K8s, risk, AI governance**

I've spent 20+ years in solution architecture (federal, cloud, SRE, AI platforms). I got tired of watching teams prompt from zero every engagement, so I built a library of 111 battle-tested prompts that encode real domain expertise.

What's inside:
- 13 service lines: tax, assurance, advisory, infrastructure/SRE (19 prompts), risk & cybersecurity (17), AI governance, digital workplace, transactions, and more
- Structured: YAML frontmatter → CI validation, system_prompt + context + user_prompt + output_format + constraints
- Every prompt has 1+ test suite (36 total) checking accuracy, hallucination, format
- Works with any LLM — just fill in the {{variables}}

Examples: triage a Sev1 incident, debug a CrashLoopBackOff pod, draft a transfer pricing study, build an AI governance operating model.

Would love feedback from this community — especially on prompt structure and what gaps you'd want covered next.

Repo: https://github.com/srinathsankara/prompt-engineering-hub
