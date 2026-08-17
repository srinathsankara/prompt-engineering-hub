# SRE / DevOps Onboarding Guide

Welcome to the Infrastructure & SRE team. You're joining a team managing 400+ production applications across AWS and Azure. This guide covers the core skills, runbooks, and tools every junior engineer needs.

## The 5 Core Responsibilities

```
┌─────────────────────────────────────────────┐
│           SRE CORE RESPONSIBILITIES          │
├─────────────────────────────────────────────┤
│ 1. Keep production running (availability)    │
│ 2. Maintain safe deployment pipelines        │
│ 3. Monitor and alert on system health        │
│ 4. Respond to and learn from incidents       │
│ 5. Optimize for cost, performance, security  │
└─────────────────────────────────────────────┘
```

## Platform Access (Week 1)

Complete these access requests:

| System | Purpose | Access Required |
|--------|---------|----------------|
| AWS Organization | Cloud infrastructure | Read-only → Power User |
| Azure Subscription | Cloud infrastructure | Reader → Contributor |
| PagerDuty | On-call incident response | Responder role |
| Datadog / Grafana | Monitoring dashboards | Read-only |
| GitHub / Azure DevOps | CI/CD pipelines and code | Read → Write |
| 1Password / Vault | Secrets management | Read-only |
| Slack | Communication | #ops channel access |

## Incident Response Quick Reference

### When You're Paged

```
1. ACKNOWLEDGE the alert (within 2 min)
2. JOIN the incident channel (#inc-{id})
3. STATE what you're investigating
4. FOLLOW the runbook for the alert type
5. ESCALATE if not resolved within 15 min
```

### Severity Levels

| Sev | Definition | Response Time | Notify |
|-----|------------|--------------|--------|
| **Sev1** | Full outage, all users impacted | 5 min | VP+ |
| **Sev2** | Partial degradation, some users | 15 min | Director |
| **Sev3** | Non-critical issue, workaround exists | 1 hour | Team lead |
| **Sev4** | Minor issue, cosmetic, no user impact | Next business day | None |

## Troubleshooting Approach (USE → RED)

Always start with the **USE** method for infrastructure, then **RED** for services:

```
┌─────────────────────┐
│   USE Method        │  For infrastructure (CPU, memory, disk, network)
│   - Utilization     │  % of resource being consumed
│   - Saturation      │  Queue depth, wait time
│   - Errors          │  Failure counts
└─────────────────────┘

┌─────────────────────┐
│   RED Method        │  For services (APIs, workers, databases)
│   - Rate            │  Requests per second
│   - Errors          │  Failed requests (4xx, 5xx)
│   - Duration        │  Response time (p50, p95, p99)
└─────────────────────┘
```

## Essential Commands Cheat Sheet

### AWS Diagnostics
```bash
# Check ECS service status
aws ecs describe-services --cluster <cluster> --services <service>

# Check ALB target group health
aws elbv2 describe-target-health --target-group-arn <arn>

# Check RDS performance
aws rds describe-db-instances --db-instance-identifier <id>

# CloudWatch Logs Insight (last 30min error count)
aws logs start-query --log-group-name <group> --query-string 'filter @message like /ERROR/ | stats count() by bin(5m)' --start-time <30min_ago_epoch> --end-time <now_epoch>
```

### Azure Diagnostics
```bash
# Check AKS pod status
az aks get-credentials --resource-group <rg> --name <cluster>
kubectl get pods --all-namespaces | grep -v Running

# Check Azure SQL performance
az sql db list-metrics --resource-group <rg> --server <server> --database <db>

# Application Insights query
az monitor app-insights query --app <app-id> --analytics-query 'requests | where timestamp > ago(30m) | summarize failures=countif(success==false), total=count() by bin(timestamp, 5m) | extend errorRate = (failures * 100.0) / total'
```

### Kubernetes Diagnostics
```bash
# Everything you need in an incident
kubectl get pods -n <ns> -o wide
kubectl describe pod <pod> -n <ns>
kubectl logs <pod> -n <ns> --tail=50 --previous
kubectl exec -it <pod> -n <ns> -- sh
kubectl get events -n <ns> --sort-by='.lastTimestamp'
kubectl top pods -n <ns>
kubectl top nodes
kubectl get networkpolicies -n <ns>
```

## Runbooks You Should Read First

1. **Sev1 Incident Triage** -- `prompts/infrastructure/incident-response/infra_incident-triage_advanced_v1.md`
2. **Kubernetes Debugging** -- `prompts/infrastructure/kubernetes/infra_k8s-debugging_medium_v1.md`
3. **CI/CD Pipeline Debug** -- `prompts/infrastructure/ci-cd/infra_cicd-pipeline-debug_v1.md`
4. **Root Cause Analysis** -- `prompts/infrastructure/incident-response/infra_root-cause-analysis_v1.md`
5. **Post-Mortem Writing** -- `prompts/infrastructure/incident-response/infra_post-mortem-blameless_v1.md`

## Training Path

| Week | Focus | Prompts to Study |
|------|-------|-----------------|
| 1 | Access & Observability | Monitoring guide, dashboard navigation |
| 2 | Incident Response | Triage, K8s debugging |
| 3 | CI/CD & Deployments | Pipeline debugging |
| 4 | Infrastructure as Code | Terraform review |
| 5 | Security & Compliance | Vulnerability triage |
| 6 | Database Operations | Performance tuning |
| 7 | Cost & DR | Cost analysis, DR planning |
| 8 | Post-Mortem & Documentation | Blameless post-mortem writing |

## On-Call Survival Tips

- **Always acknowledge** -- even if you can't fix it, someone else can
- **Follow the runbook** -- don't skip steps, don't assume
- **Ask for help** -- 15 min rule: if stuck, escalate
- **Document as you go** -- every command, every observation
- **Sleep is important** -- hand off if you've been awake > 16 hours

## Key Contacts

- **SRE Lead:** Infrastructure architecture and escalation
- **Platform Lead:** Kubernetes, Terraform, CI/CD
- **Security Lead:** Vulnerability management and incident response
- **DBA Lead:** Database performance and migrations
- **FinOps Lead:** Cost optimization and budgeting
- **Observability Lead:** Monitoring, alerting, dashboard design
