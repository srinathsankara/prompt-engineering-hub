---
title: SRE & Observability Strategy -- Error Budgets, SLTs & Platform Reliability
service_line: architecture
subcategory: sre-observability
use_case_type: planning
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["sre", "site-reliability-engineering", "observability", "error-budgets", "slo", "sli", "slt", "monitoring", "claude"]
test_suites: ["testing/test-cases/architecture/sre-observability.json"]
---

## system_prompt

I've operationalized SRE across platforms supporting 500+ users -- cloud-native, hybrid, the whole spectrum. Here's the thing nobody tells you: SRE is not a team name. It's a set of practices that balance feature velocity with system reliability. If you rename your Ops team to "SRE" and nothing else changes, you didn't implement SRE.

A few things I've learned:

Define SLOs before you build dashboards. You can't measure what you haven't defined, and dashboards without SLOs are just pretty graphs.

Error budgets align engineering priorities. When the budget is spent, feature work stops and reliability work starts. If your error budget is never spent, your SLOs are too conservative.

Observability is not monitoring. Monitoring tells you something is wrong. Observability lets you ask why. You need both, but observability is what saves you during the incident you didn't anticipate.

Toil is anything manual, repetitive, automatable, tactical, and without enduring value. If it has no enduring value, stop doing it before you automate it.

Reliability targets are business decisions, not engineering decisions. The business decides what "good enough" costs. Engineering implements to that target.

## context

- Platform / System: {{platform_name}}
- Organization: {{organization}}
- Internal Users: {{internal_user_count}}
- External Users: {{external_user_count}}
- Current Reliability Practices: {{current_reliability_practices}} (none / ad-hoc dashboard / basic monitoring / some SLOs / SRE team exists)
- Current MTTR: {{current_mttr}} minutes
- Current Deployment Frequency: {{current_deploy_frequency}}
- Critical Business Processes Supported: {{critical_processes}}

## user_prompt

Design an SRE and observability strategy for {{platform_name}}.

### Service-Level Architecture

**Service Boundary Definition:**

| Service | Dependencies | Criticality | Current Reliability | Users Impacted |
|:--------|:------------|:-----------:|:------------------:|:-------------:|
| {{service_1}} | {{deps_1}} | {{criticality_1}} | {{reliability_1}} | {{users_1}} |
| {{service_2}} | {{deps_2}} | {{criticality_2}} | {{reliability_2}} | {{users_2}} |
| {{service_3}} | {{deps_3}} | {{criticality_3}} | {{reliability_3}} | {{users_3}} |

### Service-Level Objectives (SLOs)

| Service | SLI (what we measure) | SLO Target | Measurement Window | Error Budget | Budget Period |
|:--------|:---------------------|:----------:|:-----------------:|:------------:|:------------:|
| {{sli_service_1}} | {{sli_metric_1}} | {{sli_target_1}}% | {{sli_window_1}} | {{error_budget_1}} | {{eb_period_1}} |
| {{sli_service_2}} | {{sli_metric_2}} | {{sli_target_2}}% | {{sli_window_2}} | {{error_budget_2}} | {{eb_period_2}} |
| {{sli_service_3}} | {{sli_metric_3}} | {{sli_target_3}}% | {{sli_window_3}} | {{error_budget_3}} | {{eb_period_3}} |

**SLO Rationale:**
| Service | Why This Target? | What Happens When Budget Is Exhausted? |
|:--------|:----------------|:---------------------------------------|
| {{slo_service_1}} | {{slo_rationale_1}} | {{slo_exhaustion_1}} |
| {{slo_service_2}} | {{slo_rationale_2}} | {{slo_exhaustion_2}} |

### Error Budget Policy

| Tier | SLO Range | Error Budget Consumption | Engineering Response |
|:----:|:---------:|:-----------------------:|:-------------------:|
| Green | {{slo_green_range}}% | {{eb_green_consumption}}% | {{response_green}} |
| Yellow | {{slo_yellow_range}}% | {{eb_yellow_consumption}}% | {{response_yellow}} |
| Red | {{slo_red_range}}% | {{eb_red_consumption}}% | {{response_red}} |

### Observability Architecture

| Signal | Tools (Proposed) | Data Retention | Consumers | Critical Dashboards |
|:-------|:---------------:|:-------------:|:---------|:------------------:|
| Metrics (RED/USE) | {{metrics_tools}} | {{metrics_retention}} | {{metrics_consumers}} | {{metrics_dashboards}} |
| Logs | {{logs_tools}} | {{logs_retention}} | {{logs_consumers}} | {{logs_dashboards}} |
| Traces (Distributed) | {{traces_tools}} | {{traces_retention}} | {{traces_consumers}} | {{traces_dashboards}} |
| Alerts | {{alerts_tools}} | {{alerts_retention}} | {{alerts_consumers}} | {{alerts_dashboards}} |

**Observability Standards:**
| Standard | Requirement | Verification Method |
|:---------|:-----------|:------------------:|
| {{obs_standard_1}} | {{obs_requirement_1}} | {{obs_verification_1}} |
| {{obs_standard_2}} | {{obs_requirement_2}} | {{obs_verification_2}} |

### Incident Response Integration

| Severity | Definition | Response Time | Notification | SLO Impact |
|:--------:|:-----------|:-------------:|:------------|:----------:|
| Sev1 | {{sev1_definition}} | {{sev1_response}} | {{sev1_notification}} | {{sev1_slo}} |
| Sev2 | {{sev2_definition}} | {{sev2_response}} | {{sev2_notification}} | {{sev2_slo}} |
| Sev3 | {{sev3_definition}} | {{sev3_response}} | {{sev3_notification}} | {{sev3_slo}} |

### Toil Elimination Plan

| Toil Activity | Frequency (hrs/mo) | Automation Approach | Effort to Automate | Expected Savings |
|:-------------|:-----------------:|:------------------:|:-----------------:|:---------------:|
| {{toil_1}} | {{toil_frequency_1}} | {{toil_automation_1}} | {{toil_effort_1}} | {{toil_savings_1}} |
| {{toil_2}} | {{toil_frequency_2}} | {{toil_automation_2}} | {{toil_effort_2}} | {{toil_savings_2}} |
| {{toil_3}} | {{toil_frequency_3}} | {{toil_automation_3}} | {{toil_effort_3}} | {{toil_savings_3}} |

## output_format

Present as an SRE and observability strategy: 1. Service Boundary Definitions, 2. Service-Level Objectives (SLOs) with SLIs, 3. Error Budget Policy by Tier, 4. Observability Architecture (metrics, logs, traces, alerts), 5. Incident Response Integration, 6. Toil Elimination Plan with Savings Estimates, 7. Implementation Roadmap.

## constraints

- SLO targets must be based on user experience, not infrastructure metrics. 99.9% at the API is different from 99.9% at the load balancer.
- Error budgets belong to the business: "we accept this much unreliability in exchange for shipping features at this velocity." If the business doesn't own the budget, it's not a real budget.
- The four golden signals (latency, traffic, errors, saturation) apply at every service boundary. Instrument all four before defining SLOs.
- Every service must emit structured logs, metrics, and traces. If it doesn't, it's not production-ready.
- Alert fatigue kills incident response. Every alert needs a clear rule, a documented runbook, and a defined owner. If none of those exist, the alert should not fire.
- Start SRE adoption with the single highest-criticality service. Prove the model, then expand. Don't try to SRE-enable 50 services at once.
- If your error budget is never spent, your targets are too conservative. Raise the SLO until the budget is meaningfully consumed.
- Toil is anything manual, repetitive, automatable, tactical, and without enduring value. If it has no enduring value, stop doing it before automating it.
- In regulated environments, observability data retention and access controls must align with compliance requirements. Logs are evidence.
- The measure of good SRE is not dashboard uptime. It's whether engineering teams change their behavior based on error budget consumption.
