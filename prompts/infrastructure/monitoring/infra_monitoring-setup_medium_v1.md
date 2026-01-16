---
title: Monitoring & Alerting Setup Guide
service_line: infrastructure
subcategory: monitoring
use_case_type: drafting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: observability-lead
created_date: 2026-04-20
last_modified: 2026-06-12
tags: ["monitoring", "alerting", "datadog", "grafana", "prometheus", "cloudwatch", "azure-monitor", "claude"]
test_suites: ["testing/test-cases/infrastructure/monitoring-setup.json"]
---

## system_prompt

I design monitoring and alerting for 400+ production services. I follow the USE method (Utilization, Saturation, Errors) for infrastructure and RED (Rate, Errors, Duration) for services. The most important thing I've learned: good alerting is actionable, timely, and rarely noisy. If an alert doesn't tell you what to do, don't fire it.

## context

**Service Details:**
- Service Name: {{service_name}}
- Application Type: {{app_type}} (web API / worker / batch / serverless)
- Language/Runtime: {{runtime}}
- Deployment: {{deployment_type}} (Kubernetes / VM / Lambda / Azure Functions)
- Cloud Provider: {{cloud_provider}}
- Criticality: {{criticality}} (Tier 0 / Tier 1 / Tier 2)
- Current Monitoring Tool: {{current_tool}} (Datadog / Grafana+Prometheus / CloudWatch / Azure Monitor)
- Current Coverage: {{current_coverage}} (none / basic / partial)

**SLOs/SLIs:**
- Availability SLO: {{availability_slo}}%
- Latency SLO (p99): {{latency_slo}}ms
- Error Budget: {{error_budget}}%
- Current Performance: {{current_performance}}

## user_prompt

I need to set up monitoring for {{service_name}}. Walk me through what to monitor, what alerts to create, and how to build a dashboard.

### Step 1: Define Golden Signals (RED Method)

For {{app_type}}, define the four golden signals:

| Signal | Metric | Measurement | Target | Alert When |
|--------|--------|-------------|--------|------------|
| **Rate** | Requests per second | `{{rate_metric}}` | {{rate_target}} | {{rate_alert_condition}} |
| **Errors** | Error rate % | `{{error_metric}}` | {{error_target}} | {{error_alert_condition}} |
| **Duration** | Latency p50/p95/p99 | `{{duration_metric}}` | {{duration_target}} | {{duration_alert_condition}} |
| **Saturation** | CPU/Memory/Connections | `{{saturation_metric}}` | {{saturation_target}} | {{saturation_alert_condition}} |

Provide the exact query to create each metric:

**Datadog:**
```
# Example: Error rate query
sum:{{service_name}}.errors.total{env:{{environment}}}.as_rate() / sum:{{service_name}}.requests.total{env:{{environment}}}.as_rate() * 100
```

**Prometheus/PromQL:**
```promql
# Example: Error rate query
sum(rate(http_requests_total{service="{{service_name}}", status=~"5.."}[5m])) / sum(rate(http_requests_total{service="{{service_name}}"}[5m])) * 100
```

**CloudWatch Logs Insights:**
```
# Example: Error rate query
fields @timestamp, @message
| filter @message like /ERROR|Exception/
| stats count() as errorCount by bin(5m)
```

**Azure Log Analytics/KQL:**
```
// Example: Error rate query
requests
| where name == "{{service_name}}"
| summarize totalCount=count(), errorCount=countif(success == false) by bin(timestamp, 5m)
| extend errorRate = (errorCount * 100.0) / totalCount
```

### Step 2: Infrastructure Monitoring (USE Method)

For each infrastructure component, define Utilization, Saturation, and Errors metrics:

**Compute (Container/VM):**
| Metric | What it measures | Warning | Critical | Query |
|--------|-----------------|---------|----------|-------|
| CPU Utilization | % of CPU used | > 80% | > 95% | `{{cpu_query}}` |
| Memory Utilization | % of memory used | > 80% | > 90% | `{{memory_query}}` |
| Disk IOPS | I/O operations | > 80% of provisioned | > 95% | `{{disk_query}}` |
| Network | Bytes in/out | Anomaly detection | > 2x baseline | `{{network_query}}` |

**Database:**
| Metric | What it measures | Warning | Critical |
|--------|-----------------|---------|----------|
| Connections | Active connections | > 80% of max | > 95% of max |
| Replication Lag | Seconds behind | > 10s | > 60s |
| Slow Queries | Queries > 1s | > 5/min | > 20/min |
| Deadlocks | Per minute | > 0 | > 5 |

**Load Balancer / Gateway:**
| Metric | What it measures | Warning | Critical |
|--------|-----------------|---------|----------|
| 5xx Rate | Server errors | > 1% | > 5% |
| 4xx Rate | Client errors | > 5% | > 10% |
| Target Health | Unhealthy targets | > 1 | > 5 |
| Latency | p99 response time | > {{latency_slo}}ms | > 2x {{latency_slo}}ms |

### Step 3: Alert Configuration

For each alert, provide:
1. **Alert name** (convention: `{{service_name}}-{{metric}}-{{severity}}`)
2. **Condition** (the exact query/expression)
3. **Severity** (Critical / Warning / Info)
4. **Evaluation interval** (e.g., every 1m for 5m)
5. **Notification target** (PagerDuty / Slack / Email)
6. **Runbook link** (what the on-call should do)

**Example Alert: High Error Rate**
```yaml
alert: {{service_name}}-high-error-rate
condition: error_rate > {{error_threshold}}% for 5m
severity: Critical
interval: 1m
notify:
  - pagerduty: {{pagerduty_service_id}}
  - slack: #ops-{{service_name}}
runbook: docs/runbooks/{{service_name}}-errors.md
```

### Step 4: Dashboard Design

Design a single-pane-of-glass dashboard with these panels:

1. **SLO Panel** -- current compliance vs monthly target (sparkline + %, colored green/yellow/red)
2. **Request Rate & Latency** -- line chart with p50, p95, p99 overlays
3. **Error Rate** -- stacked area chart by status code (2xx, 4xx, 5xx)
4. **Top 5 Error Endpoints** -- table sorted by error count
5. **CPU & Memory** -- time series per pod/instance
6. **Database** -- connections, slow queries, replication lag
7. **Deployment Events** -- annotations for each deployment (vertical lines on all charts)
8. **Dependency Health** -- upstream/downstream service status (green/red indicators)

Provide the JSON/YAML configuration for panels 1-3 at minimum.

### Step 5: Runbook Template

Generate a minimal runbook for the most critical alert ({{primary_alert}}):

```markdown
# Runbook: {{service_name}} - {{primary_alert}}

## Severity: Critical
## Response Time: 5 minutes

### Step 1: Assess Impact
- Check current error rate: [link to dashboard]
- Check if this is a deployment-related: [link to deploy history]
- Check PagerDuty for concurrent incidents

### Step 2: Immediate Mitigation
[2-3 actionable steps to reduce impact]

### Step 3: Root Cause Investigation
[3-5 diagnostic commands/queries]

### Step 4: Resolution
[Steps to fix the issue]

### Step 5: Verification
[How to confirm the issue is resolved]

### Escalation
- Primary: {{primary_oncall}}
- Secondary: {{secondary_oncall}}
- Engineering Lead: {{eng_lead}}
```

## output_format

Present as a structured implementation guide:
1. **Service-Level Signals** (RED metrics with exact queries)
2. **Infrastructure Signals** (USE metrics per component)
3. **Alert Rules** (YAML config for each alert)
4. **Dashboard Layout** (panel descriptions and config)
5. **Runbook** (for the most critical alert)

## constraints

- Do not suggest alerts that would fire during normal operations (test against 2 weeks of historical data)
- Prefer `for: 5m` over `for: 1m` to reduce noise
- All dashboards must have a link back to the service's runbook
- Use existing monitoring tools -- don't recommend new tool purchases
