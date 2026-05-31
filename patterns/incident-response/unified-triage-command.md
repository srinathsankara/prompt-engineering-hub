---
pattern_name: Unified Incident Triage Command
pattern_type: structured-diagnosis
complexity_tier: advanced
version: 1.0.0
---

## Pattern Overview

A structured, phased approach to production incident triage. This pattern combines the RED and USE monitoring methodologies with a guided decision tree. It ensures junior engineers follow the same systematic process as senior engineers.

## When to Use

- Any production incident (Sev1-Sev4)
- On-call triage for unfamiliar services
- Training new engineers in incident response
- Documenting incident response procedures

## Pattern Structure

### Phase 1: Triage (first 5 minutes)

```
[ALERT TYPE]──→[BLAST RADIUS]──→[MITIGATION ACTION]
                   │
                   └──→[SINGLE SERVICE] → Check deploy, code, config
                   └──→[MULTIPLE SERVICES] → Check infra, network, dependency
                   └──→[ALL SERVICES] → Check region, cloud provider, DNS
```

### Phase 2: Evidence Collection (5-15 minutes)

```
GATHER:
├── Logs (last 30 min, error/correlation patterns)
├── Metrics (rate, errors, latency, saturation)
├── Traces (slow paths, error paths)
├── Changes (deployments, config changes, feature flags)
└── Dependencies (upstream, downstream, third-party)
```

### Phase 3: Root Cause Hypothesis (15-30 minutes)

```
For each hypothesis, ask:
1. Does the evidence support this? How?
2. Does the evidence contradict this? How?
3. What additional evidence would prove or disprove it?
4. Can we verify with a test or experiment?
```

### Phase 4: Mitigation

```
Choose remediation path:
├── ROLLBACK (deploy, config, feature flag)
├── SCALE (add capacity, adjust limits)
├── REDIRECT (traffic shifting, failover)
├── ISOLATE (circuit breaker, rate limit, block)
└── REPAIR (fix forward, hot patch)
```

## Command Template Variables

| Variable | Description | Source |
|----------|-------------|--------|
| `{{severity}}` | Sev1-Sev4 | Alert/PagerDuty |
| `{{service_name}}` | Affected service | Monitoring |
| `{{environment}}` | prod/staging/dev | Alert context |
| `{{cloud_provider}}` | AWS/Azure | Service catalog |
| `{{error_rate}}` | Current error % | Monitoring |
| `{{error_rate_baseline}}` | Normal error % | Historical |
| `{{latency_p99}}` | Current p99 latency | Monitoring |
| `{{latency_baseline}}` | Normal p99 latency | Historical |
| `{{recent_changes}}` | Changes in last 2h | Deploy pipeline |
| `{{log_snippet}}` | Relevant log lines | Log aggregation |

## Provider-Specific Triage Checklists

### AWS Triage Checklist

```
[ ] CloudWatch alarms firing?
[ ] ALB/NLB target health?
[ ] ECS/EKS service events?
[ ] RDS performance insights?
[ ] WAF blocked requests?
[ ] Route 53 health checks?
[ ] KMS key status?
[ ] Certificate expiry?
```

### Azure Triage Checklist

```
[ ] Azure Monitor alerts?
[ ] Traffic Manager/Front Door health?
[ ] AKS cluster events?
[ ] Azure SQL performance?
[ ] Azure WAF blocked requests?
[ ] DNS zone health?
[ ] Key Vault status?
[ ] App Service health?
```

## Validation

- Test with 5 different incident scenarios (network, deploy, dependency, data, resource)
- Verify each phase produces actionable output
- Ensure the pattern works for both AWS and Azure environments
- Test with junior engineers -- can they follow it without senior guidance?
