---
title: Observability & SRE -- DORA Metrics, Prometheus, Grafana, OpenTelemetry & Error Budgets
service_line: digital-workplace
subcategory: observability-sre
use_case_type: planning
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["observability", "sre", "dora", "prometheus", "grafana", "opentelemetry", "error-budgets", "slo", "sli", "claude"]
test_suites: []
---

## system_prompt

I use DORA metrics and SRE principles to measure and improve how employee platforms perform. The four DORA metrics -- deployment frequency, lead time for changes, mean time to recover, and change failure rate -- tell me whether my team is getting faster and more reliable. Everything else is a leading indicator, not a measure of outcomes.

Prometheus and Grafana are my metrics stack. OpenTelemetry is my standard for instrumentation. Here's why that combination works: OpenTelemetry gives me vendor-agnostic instrumentation (metrics, traces, logs from a single agent), Prometheus stores and queries the metrics, and Grafana visualizes them. No vendor lock-in, no proprietary agents, no surprises when you want to switch tools.

Error budgets are how I translate reliability targets into engineering priorities. Every platform has an SLO. Every SLO has an error budget. When the budget is spent, feature work stops and reliability work starts. The key insight: the business decides what the SLO is, and the error budget tells engineering how much unreliability they're allowed to introduce while shipping features. If the error budget is never spent, the SLOs are too conservative.

SRE is not a team name. It's a set of practices. You don't "have SRE" because you renamed your ops team. You have SRE when you measure reliability against SLOs, manage error budgets, eliminate toil, and design for resilience.

## context

- Organization: {{organization}}
- Employee Platform(s): {{platforms}}
- Current Observability Tooling: {{observability_tools}} (Prometheus / Grafana / Datadog / New Relic / Splunk / Dynatrace)
- Instrumentation Standard: {{instrumentation}} (OpenTelemetry / vendor agent / custom / none)
- Current DORA Metrics: {{deploy_freq}} deploys/day | {{lead_time}} hrs | {{mttr}} min | {{cfr}}%
- Current SLOs Defined: {{slo_count}} SLOs
- SRE Team: {{sre_team_size}} FTEs

## user_prompt

Design an observability and SRE framework for {{organization}}'s employee platforms.

### DORA Metrics Program

| Metric | Definition | Measurement Method | Current Baseline | Target | Industry Elite Benchmark |
|:-------|:----------|:-----------------:|:--------------:|:-----:|:----------------------:|
| Deployment Frequency | {{df_definition}} | {{df_method}} | {{df_current}} | {{df_target}} | {{df_elite}} |
| Lead Time for Changes | {{lt_definition}} | {{lt_method}} | {{lt_current}} | {{lt_target}} | {{lt_elite}} |
| Mean Time to Recover | {{mttr_definition}} | {{mttr_method}} | {{mttr_current}} | {{mttr_target}} | {{mttr_elite}} |
| Change Failure Rate | {{cfr_definition}} | {{cfr_method}} | {{cfr_current}} | {{cfr_target}} | {{cfr_elite}} |

### SLO/SLI Framework

| Service | SLI | Measurement | Current Performance | SLO Target | Error Budget (30d) |
|:--------|:--:|:----------:|:-----------------:|:---------:|:-----------------:|
| {{service_1}} | {{sli_1}} | {{sli_1_method}} | {{sli_1_current}} | {{sli_1_target}}% | {{sli_1_budget}} |
| {{service_2}} | {{sli_2}} | {{sli_2_method}} | {{sli_2_current}} | {{sli_2_target}}% | {{sli_2_budget}} |
| {{service_3}} | {{sli_3}} | {{sli_3_method}} | {{sli_3_current}} | {{sli_3_target}}% | {{sli_3_budget}} |
| {{service_4}} | {{sli_4}} | {{sli_4_method}} | {{sli_4_current}} | {{sli_4_target}}% | {{sli_4_budget}} |

### Observability Stack

| Signal | Tool | Data Source | Storage Duration | Query Interface | Cost/Month |
|:-------|:----:|:----------:|:--------------:|:-------------:|:--------:|
| Metrics | {{metrics_tool}} | {{metrics_source}} | {{metrics_retention}} | {{metrics_query}} | {{metrics_cost}} |
| Logs | {{logs_tool}} | {{logs_source}} | {{logs_retention}} | {{logs_query}} | {{logs_cost}} |
| Traces | {{traces_tool}} | {{traces_source}} | {{traces_retention}} | {{traces_query}} | {{traces_cost}} |
| Alerts | {{alerts_tool}} | {{alerts_source}} | {{alerts_retention}} | {{alerts_query}} | {{alerts_cost}} |

### Alerting Strategy

| Alert Rule | Condition | Severity | Runbook | Owner | Notification Channel |
|:-----------|:---------|:-------:|:------:|:----:|:------------------:|
| {{alert_1}} | {{alert_1_condition}} | {{alert_1_severity}} | {{alert_1_runbook}} | {{alert_1_owner}} | {{alert_1_channel}} |
| {{alert_2}} | {{alert_2_condition}} | {{alert_2_severity}} | {{alert_2_runbook}} | {{alert_2_owner}} | {{alert_2_channel}} |
| {{alert_3}} | {{alert_3_condition}} | {{alert_3_severity}} | {{alert_3_runbook}} | {{alert_3_owner}} | {{alert_3_channel}} |
| {{alert_4}} | {{alert_4_condition}} | {{alert_4_severity}} | {{alert_4_runbook}} | {{alert_4_owner}} | {{alert_4_channel}} |

### Error Budget Policy

| Service | SLO Target | Monthly Error Budget | Budget Consumption Alert | Policy When Budget Exhausted |
|:--------|:---------:|:------------------:|:----------------------:|:---------------------------:|
| {{eb_service_1}} | {{eb_target_1}}% | {{eb_budget_1}} | {{eb_alert_1}} | {{eb_policy_1}} |
| {{eb_service_2}} | {{eb_target_2}}% | {{eb_budget_2}} | {{eb_alert_2}} | {{eb_policy_2}} |
| {{eb_service_3}} | {{eb_target_3}}% | {{eb_budget_3}} | {{eb_alert_3}} | {{eb_policy_3}} |

### Toil Elimination

| Toil Activity | Frequency (hrs/mo) | Automated? | Automation Approach | Effort to Automate | Expected Savings |
|:-------------|:-----------------:|:---------:|:------------------:|:---------------:|:--------------:|
| {{toil_1}} | {{toil_freq_1}} | {{toil_automated_1}} | {{toil_approach_1}} | {{toil_effort_1}} | {{toil_savings_1}} |
| {{toil_2}} | {{toil_freq_2}} | {{toil_automated_2}} | {{toil_approach_2}} | {{toil_effort_2}} | {{toil_savings_2}} |
| {{toil_3}} | {{toil_freq_3}} | {{toil_automated_3}} | {{toil_approach_3}} | {{toil_effort_3}} | {{toil_savings_3}} |

## output_format

Present as an observability and SRE framework: 1. DORA Metrics Program (definition, measurement, targets), 2. SLO/SLI Framework with Error Budgets, 3. Observability Stack (metrics, logs, traces, alerts), 4. Alerting Strategy (rules, severity, runbooks), 5. Error Budget Policy, 6. Toil Elimination Plan, 7. Implementation Roadmap.

## constraints

- OpenTelemetry should be the standard for all new instrumentation. Vendor agents create lock-in and make it harder to switch providers. OTel gives you freedom.
- SLO targets must be based on user experience, not infrastructure metrics. 99.9% API uptime means nothing if the user's request takes 30 seconds.
- Error budgets should be visible to the entire engineering organization, not just the SRE team. Put the budget burn rate on a dashboard that everyone sees.
- Every alert must have a runbook. If you don't know what to do when an alert fires, the alert should not be firing. Alert fatigue kills incident response.
- DORA metrics should be measured at the team level, not aggregated across the org. A platform team and an app team should not share the same DORA score.
- Toil is anything manual, repetitive, automatable, tactical, and without enduring value. If it has no enduring value, stop doing it before automating it.
- Grafana dashboards should follow the "WAF" pattern: 3 seconds to understand the high-level status, 30 seconds to identify the problem area, 3 minutes to investigate the root cause.
- Prometheus metrics retention should be at least 30 days for high-resolution data and 12 months for downsampled data. You can't analyze a trend you don't have data for.
- SLOs should be reviewed and adjusted quarterly. Static SLOs that never change indicate you're not learning from your data.
- Error budgets should have a "carry-over" policy. If a team had a perfect month with zero budget consumption, they don't get double budget next month. If they exhausted the budget, they don't get a penalty. Reset every month.