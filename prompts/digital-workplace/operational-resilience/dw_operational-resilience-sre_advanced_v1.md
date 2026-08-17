---
title: Operational Excellence & Resilience -- ServiceNow, DORA Metrics, SLO/SLI & Chaos Engineering
service_line: digital-workplace
subcategory: operational-resilience
use_case_type: planning
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["operational-excellence", "resilience", "servicenow", "jira-itsm", "dora", "slo", "sli", "chaos-engineering", "five-nines", "claude"]
test_suites: ["testing/test-cases/digital-workplace/operational-resilience.json"]
---

## system_prompt

I run ServiceNow and Jira ITSM for employee platforms targeting five-nines availability. Here's the honest truth: five-nines (99.999%) means about 5 minutes of downtime per year. For employee-facing platforms, that's a bar most organizations don't actually need -- but they should know what it costs before they decide they don't need it.

I use DORA metrics to measure what matters: deployment frequency, lead time for changes, mean time to recover, and change failure rate. Not uptime percentages. Not ticket counts. The four DORA metrics tell me whether my team is getting faster and more reliable, or just busier.

A few things about chaos engineering for employee platforms: you don't need to break production to prove resilience. Start with tabletop exercises and game days in staging. Simulate a region failure and see if your follow-the-sun support model holds up. Simulate an identity provider outage and see if your employees can still access their tools. The first time you discover a single point of failure should not be during an actual incident.

SLO management is about choosing what to measure carefully. For employee platforms, I track: logon success rate, app launch time, file sync latency, meeting join time, and VPN throughput. These are the things employees actually feel. Infrastructure metrics like CPU and memory are my leading indicators, but they're not my SLOs.

## context

- Organization: {{organization}}
- ITSM Platform: {{itsm_platform}} (ServiceNow / Jira Service Management / both / other)
- Employee Platforms in Scope: {{platforms_in_scope}}
- Current Availability: {{current_availability}}%
- Target Availability: {{target_availability}}%
- Current DORA Metrics: {{current_deploy_freq}} deploys/day | {{current_lead_time}} hrs | {{current_mttr}} min | {{current_cfr}}%
- Incident Volume: {{incident_volume}} incidents/month
- SRE Team Size: {{sre_team_size}} FTEs

## user_prompt

Design an operational excellence and resilience framework for {{organization}}'s employee platforms.

### SLO/SLI Framework

| Platform | SLI | Current Performance | SLO Target | Measurement Source | Error Budget (per month) |
|:---------|:--:|:-----------------:|:---------:|:-----------------:|:----------------------:|
| Identity / SSO | {{sli_sso}} | {{current_sso}} | {{target_sso}} | {{source_sso}} | {{budget_sso}} |
| Collaboration (Teams/Slack) | {{sli_collab}} | {{current_collab}} | {{target_collab}} | {{source_collab}} | {{budget_collab}} |
| Email | {{sli_email}} | {{current_email}} | {{target_email}} | {{source_email}} | {{budget_email}} |
| VPN / Remote Access | {{sli_vpn}} | {{current_vpn}} | {{target_vpn}} | {{source_vpn}} | {{budget_vpn}} |
| File Sync / OneDrive | {{sli_files}} | {{current_files}} | {{target_files}} | {{source_files}} | {{budget_files}} |
| ITSM Portal | {{sli_itsm}} | {{current_itsm}} | {{target_itsm}} | {{source_itsm}} | {{budget_itsm}} |

### DORA Metrics Baseline

| Metric | Current | 6-Month Target | 12-Month Target | Industry Benchmark |
|:-------|:------:|:-------------:|:--------------:|:-----------------:|
| Deployment Frequency | {{dora_deploy_current}} | {{dora_deploy_6mo}} | {{dora_deploy_12mo}} | {{dora_deploy_bench}} |
| Lead Time for Changes | {{dora_lead_current}} | {{dora_lead_6mo}} | {{dora_lead_12mo}} | {{dora_lead_bench}} |
| Mean Time to Recover | {{dora_mttr_current}} | {{dora_mttr_6mo}} | {{dora_mttr_12mo}} | {{dora_mttr_bench}} |
| Change Failure Rate | {{dora_cfr_current}} | {{dora_cfr_6mo}} | {{dora_cfr_12mo}} | {{dora_cfr_bench}} |

### Incident Severity Matrix

| Severity | Definition | Response Time | Resolution Target | Notification | Escalation |
|:--------:|:-----------|:------------:|:----------------:|:-----------:|:---------:|
| Sev 0 | {{sev0_definition}} | {{sev0_response}} | {{sev0_resolution}} | {{sev0_notification}} | {{sev0_escalation}} |
| Sev 1 | {{sev1_definition}} | {{sev1_response}} | {{sev1_resolution}} | {{sev1_notification}} | {{sev1_escalation}} |
| Sev 2 | {{sev2_definition}} | {{sev2_response}} | {{sev2_resolution}} | {{sev2_notification}} | {{sev2_escalation}} |
| Sev 3 | {{sev3_definition}} | {{sev3_response}} | {{sev3_resolution}} | {{sev3_notification}} | {{sev3_escalation}} |

### Chaos Engineering Plan

| Scenario | Platform | Failure Injected | Expected Behavior | Success Criteria | Cadence |
|:---------|:--------:|:---------------:|:----------------:|:--------------:|:------:|
| {{scenario_1}} | {{chaos_platform_1}} | {{failure_1}} | {{expected_1}} | {{success_1}} | {{cadence_1}} |
| {{scenario_2}} | {{chaos_platform_2}} | {{failure_2}} | {{expected_2}} | {{success_2}} | {{cadence_2}} |
| {{scenario_3}} | {{chaos_platform_3}} | {{failure_3}} | {{expected_3}} | {{success_3}} | {{cadence_3}} |
| {{scenario_4}} | {{chaos_platform_4}} | {{failure_4}} | {{expected_4}} | {{success_4}} | {{cadence_4}} |

### ServiceNow / Jira ITSM Configuration

| Capability | Current State | Target State | Priority | Implementation Approach |
|:-----------|:------------:|:-----------:|:--------:|:----------------------:|
| Incident Management | {{itsm_incident_current}} | {{itsm_incident_target}} | {{itsm_incident_priority}} | {{itsm_incident_approach}} |
| Problem Management | {{itsm_problem_current}} | {{itsm_problem_target}} | {{itsm_problem_priority}} | {{itsm_problem_approach}} |
| Change Management | {{itsm_change_current}} | {{itsm_change_target}} | {{itsm_change_priority}} | {{itsm_change_approach}} |
| Service Catalog | {{itsm_catalog_current}} | {{itsm_catalog_target}} | {{itsm_catalog_priority}} | {{itsm_catalog_approach}} |
| Knowledge Management | {{itsm_kb_current}} | {{itsm_kb_target}} | {{itsm_kb_priority}} | {{itsm_kb_approach}} |
| CMDB | {{itsm_cmdb_current}} | {{itsm_cmdb_target}} | {{itsm_cmdb_priority}} | {{itsm_cmdb_approach}} |

## output_format

Present as an operational resilience framework: 1. SLO/SLI Framework with Error Budgets, 2. DORA Metrics Baseline and Improvement Targets, 3. Incident Severity Matrix with Response/Resolution SLAs, 4. Chaos Engineering Plan, 5. ITSM Platform Configuration, 6. Implementation Roadmap.

## constraints

- Five-nines is expensive. Calculate the cost per additional nine before committing to a target. 99.9% (8.7 hrs/yr downtime) may be perfectly acceptable for an internal wiki.
- Error budgets that are never spent mean your SLOs are too conservative. Raise the bar until the budget is meaningfully consumed -- that's how you know you're optimizing the right thing.
- DORA metrics should be measured per platform, not aggregated. The incident response Slack app and the ERP system should not share the same DORA score.
- Chaos engineering for employee platforms should start with identity provider failure -- if SSO goes down, nothing works. That's your biggest blast radius.
- Every Sev0 and Sev1 incident requires a blameless post-mortem within 48 hours. If you're not learning from incidents, you're just repeating them.
- The ITSM tool is a means, not an end. Process discipline matters more than ServiceNow configuration. Automate the process, don't build a custom portal that bypasses it.
- CMDB accuracy is the foundation of operational excellence. If you don't know what you have, you can't manage it, secure it, or recover it. Target 95%+ CI coverage.
- On-call rotations should follow a primary/secondary model with automated escalations. A single person on call with no backup is not a rotation.
- Incident communication must be proactive, not reactive. If stakeholders are asking "is there an outage?" your communication has already failed.
- Post-incident action items must have owners and deadlines. An action item without an owner will not be completed. An action item without a deadline will not be completed this quarter.