---
title: Prompt Demonstration â€” Infrastructure Incident Response
type: demonstration
service_line: infrastructure
complexity_tier: basic
version: 1.0.0
---

## Scenario

A junior SRE gets paged at 2 AM for a production incident. They've never handled a Sev1 before. This walkthrough shows how the incident-triage prompt works end to end.

## Step 1: Open the Prompt

`prompts/infrastructure/incident-response/infra_incident-triage_advanced_v1.md`

## Step 2: Fill in the Variables

Replace each `{{variable}}` with real data from the incident:

- `{{service_name}}` = "payment-processor"
- `{{symptom}}` = "500 errors on checkout, pager duty alerting every 30 seconds"
- `{{impact}}` = "All payment transactions failing, ~$50K/min revenue impact"

## Step 3: Run and Review

The prompt outputs a triage checklist with specific commands, escalation criteria, and containment steps. The output includes actual kubectl and Datadog commands, not generic advice.
