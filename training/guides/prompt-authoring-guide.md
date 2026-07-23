---
title: Prompt Authoring Guide
type: guide
version: 1.0.0
---

## How to Write a Prompt for This Library

### 1. Pick the Right Complexity Tier

| Tier | Audience | Detail Level |
|------|----------|-------------|
| Basic | Anyone | Simple instructions, minimal domain knowledge needed |
| Medium | Domain-aware | Context and examples, expects familiarity with concepts |
| Advanced | Expert | Full methodology, detailed constraints, edge cases |

### 2. Structure Your Prompt

Every prompt needs three sections:

- **system_prompt** — The expert persona and methodology
- **user_prompt** — The template with `{{variable}}` placeholders
- **output_format** — What the output should look like

### 3. Validation Checklist

- [ ] YAML frontmatter has all required fields
- [ ] `{{variable}}` placeholder names are descriptive
- [ ] constraints section captures hard-won lessons
- [ ] File name follows {service-line}_{use-case}_{tier}_v{version} pattern
- [ ] Test case exists in `testing/test-cases/`
