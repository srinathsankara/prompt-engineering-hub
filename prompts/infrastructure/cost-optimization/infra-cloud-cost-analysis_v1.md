---
title: Cloud Cost Optimization Analysis
service_line: infrastructure
subcategory: cost-optimization
use_case_type: optimization
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: finops-lead
created_date: 2026-04-25
last_modified: 2026-06-10
tags: ["cost-optimization", "finops", "aws", "azure", "claude"]
test_suites: ["testing/test-cases/infrastructure/cost-analysis.json"]
---

## system_prompt

I'm a . You have deep knowledge of AWS Cost Explorer, Azure Cost Management, reserved instances, savings plans, rightsizing, and workload optimization. You understand that cost optimization is a balance between performance, reliability, and spend.

## context

**Cloud Account/Subscription:**
- Provider: {{cloud_provider}}
- Account/Subscription ID: {{account_id}}
- Environment: {{environment}} (Prod / Staging / Dev / Test)
- Monthly Spend: {{monthly_spend}}
- Trend (3mo): {{spend_trend}} (increasing 15% / stable / decreasing)
- Services with highest spend:
  | Service | Monthly Cost | % of Total | Trend |
  |---------|-------------|------------|-------|
  | {{service_1}} | {{cost_1}} | {{pct_1}} | {{trend_1}} |
  | {{service_2}} | {{cost_2}} | {{pct_2}} | {{trend_2}} |
  | {{service_3}} | {{cost_3}} | {{pct_3}} | {{trend_3}} |

**Top Resources by Cost:**
| Resource ID | Type | Monthly Cost | Utilization | Recommendation |
|------------|------|-------------|-------------|---------------|
| {{resource_1}} | {{type_1}} | {{cost_1}} | {{util_1}} | |
| {{resource_2}} | {{type_2}} | {{cost_2}} | {{util_2}} | |

## user_prompt

I need to reduce cloud costs for our {{account_id}} account. Analyze the spend and recommend optimization opportunities.

### Analysis Areas

**1. Compute Rightsizing (EC2 / VM / AKS / EKS)**

For each compute instance, evaluate:

- **CPU Utilization:** Average {{avg_cpu}}%, Peak {{peak_cpu}}%, Idle periods {{idle_periods}}
- **Memory Utilization:** Average {{avg_memory}}%, Peak {{peak_memory}}%
- **Network Throughput:** Average {{avg_network}} Mbps, Peak {{peak_network}} Mbps
- **Right-size recommendation:**
  - If avg CPU < 20% and peak < 40%: downsize to {{recommended_instance}}
  - If avg CPU < 10%: consider stopping or scheduling
  - If workload is variable: consider Spot instances for {{eligible_workloads}}

Provide the exact AWS CLI / Azure CLI command to:
```bash
# AWS: Get EC2 utilization metrics
aws cloudwatch get-metric-statistics \
  --namespace AWS/EC2 \
  --metric-name CPUUtilization \
  --dimensions Name=InstanceId,Value={{instance_id}} \
  --start-time $(date -d '14 days ago' -u +%Y-%m-%dT%H:%M:%SZ) \
  --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
  --period 3600 \
  --statistics Average

# Azure: Get VM utilization
az monitor metrics list \
  --resource {{vm_id}} \
  --metric "Percentage CPU" \
  --interval PT1H \
  --aggregation average \
  --start-time {{14_days_ago}}
```

**2. Reserved Instances & Savings Plans**

Analyze commitment discounts:
- Current RI/SP coverage: {{current_coverage}}% of eligible spend
- Recommended coverage: {{target_coverage}}% (generally 60-80%)
- If under 40%, recommend specific RIs/SPs:
  | Service | Current On-Demand | RI/SP 1yr | RI/SP 3yr | Savings |
  |---------|-----------------|-----------|-----------|---------|
  | {{service}} | {{on_demand_cost}} | {{one_year_cost}} | {{three_year_cost}} | {{savings}} |

**3. Storage Optimization**

- **EBS / Managed Disks:**
  - Unattached volumes: {{unattached_count}} (cost: {{unattached_cost}})
  - GP3 vs IO1/IO2 cost comparison: {{gp3_savings}}
  - Snapshot age and cleanup: {{old_snapshots}} snapshots > 90 days
- **S3 / Blob Storage:**
  - Lifecycle policy gaps: {{data_not_tiered}} GB not in lifecycle
  - Storage class analysis: {{infrequent_access_candidates}} GB candidates for IA
  - Delete stale multipart uploads: {{stale_uploads_count}}

**4. Data Transfer**

- Check for expensive inter-region/INTERNET data transfer: {{data_transfer_cost}}
- NAT Gateway / Transit Gateway costs: {{nat_gateway_cost}}
- CDN optimization: CloudFront / Azure CDN cost vs direct origin access

**5. Idle Resources**

Auto-discovered idle resources costing {{idle_cost}}/month:
| Resource Type | Count | Monthly Cost | Action |
|--------------|-------|-------------|--------|
| Idle Load Balancers | {{idle_lb_count}} | {{idle_lb_cost}} | Delete |
| Unattached IPs | {{unattached_ip_count}} | {{unattached_ip_cost}} | Release |
| Orphaned Snapshots | {{orphan_snapshot_count}} | {{orphan_snapshot_cost}} | Cleanup |
| Stopped Instances | {{stopped_instance_count}} | {{stopped_instance_cost}} | Consolidate |

### Implementation Plan

For each recommendation, provide:
1. **Savings estimate:** {{savings_amount}}/month ({{savings_pct}}% of total)
2. **Implementation effort:** (Minimal / Moderate / Significant)
3. **Risk level:** (Low / Medium / High)
4. **Steps to implement:**
   ```
   Step 1: {{step_1}}
   Step 2: {{step_2}}
   Step 3: {{step_3}}
   ```
5. **Verification:** How to confirm the savings are realized

### Priority Matrix

Rank recommendations in a prioritization matrix:

| Quick Win (Low Effort, High Savings) | Strategic (High Effort, High Savings) |
|--------------------------------------|--------------------------------------|
| {{quick_wins}} | {{strategic_initiatives}} |
| **Housekeeping (Low Effort, Low Savings)** | **Evaluate (High Effort, Low Savings)** |
| {{housekeeping}} | {{evaluate}} |

## output_format

Present as a structured FinOps report:
1. **Executive Summary** -- top 5 savings opportunities with total projected savings
2. **Cost Breakdown** -- pie chart data by service
3. **Recommendation Details** -- by category with evidence
4. **Implementation Roadmap** -- what to do this week, month, quarter
5. **Savings Tracker** -- month-over-month comparison template

## constraints

- Never recommend RI/SP for workloads that are not stable (e.g., ephemeral environments, short-term projects)
- Rightsizing production instances requires performance baseline and approval
- Deleting resources requires ownership verification and backup plan
- Reserved Instances should only cover 60-80% of baseline usage -- leave headroom for growth
