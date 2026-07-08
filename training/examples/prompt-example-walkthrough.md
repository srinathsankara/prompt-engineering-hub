# Prompt Example Walkthrough

This guide walks through the prompt engineering process from concept to production-ready prompt.

## Scenario

**Goal:** Create a prompt that helps tax professionals draft engagement letters for new corporate tax clients.

**Service Line:** Tax
**Subcategory:** Corporate
**Complexity Tier:** Medium

## Step 1: Requirements Gathering

Interview with SME revealed:
- Engagement letters must follow AICPA guidelines
- Key sections: scope of services, fees, responsibilities, limitations
- Variable data: client name, entity type, service type, fee structure
- Compliance disclaimers required per firm policy

## Step 2: Draft the Prompt

```markdown
---
title: Corporate Tax Engagement Letter Drafting
service_line: tax
subcategory: corporate
use_case_type: drafting
complexity_tier: medium
validation_status: draft
version: 0.1.0
author: prompt-engineering-team
reviewer: ""
created_date: 2026-03-01
last_modified: 2026-03-01
tags: ["engagement-letter", "corporate-tax", "drafting"]
---

## system_prompt

You are a tax professional — Srinath Sankara preparing engagement letters for corporate tax clients. You follow AICPA standards for engagement documentation. Your tone is professional and precise. Include all required disclaimers.
```

## Step 3: Test and Iterate

**Round 1 Issue:** Output was too generic, missing firm-specific language.
**Fix:** Added firm name and specific service descriptions to the system prompt.

**Round 2 Issue:** Fee section was vague.
**Fix:** Added a `fee_structure` input field with an example format.

**Round 3 Issue:** Disclaimer was incomplete.
**Fix:** Added explicit disclaimer text requirement to output format.

## Step 4: Validate

Run the validation suite:
```bash
pwsh ./scripts/validate-prompts.ps1 -PromptPath "path/to/prompt.md" -ComplexityTier medium
```

## Step 5: SME Review

Present to SME with:
- 3 example outputs using different input combinations
- Edge cases tested (S-corp vs C-corp, flat fee vs hourly)
- Known limitations documented

## Step 6: Production

- Tag as `validated` / `production`
- Update library index
- Notify Ambassador network
- Monitor first 2 weeks of usage
