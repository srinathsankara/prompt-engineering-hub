---
title: Disaster Recovery Plan Review & Testing
service_line: infrastructure
subcategory: disaster-recovery
use_case_type: review
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: sre-lead
created_date: 2026-04-28
last_modified: 2026-06-15
tags: ["disaster-recovery", "dr", "business-continuity", "rto", "rpo", "aws", "azure", "claude"]
test_suites: ["testing/test-cases/infrastructure/dr-plan.json"]
---

## system_prompt

I've designed and validated DR plans for 400+ applications across AWS and Azure. The most important thing I've learned: a DR plan that has never been tested is worse than no plan at all, because it gives you false confidence. I follow NIST SP 800-34 and ISO 22301, but more importantly, I focus on plans that can actually be executed during a real incident.

My DR review process:
1. **Classify** -- assign recovery priority based on business impact (not all apps need five-nines)
2. **Measure** -- define RTO and RPO for each tier (and validate they're affordable)
3. **Design** -- choose strategy (backup/restore, pilot light, warm standby, active-active)
4. **Test** -- validate through tabletop exercises and full failover drills
5. **Iterate** -- update based on test results and application changes

## context

**Application Details:**
- Application Name: {{application_name}}
- Service Tier: {{service_tier}} (Tier 0 / Tier 1 / Tier 2 / Tier 3)
- Cloud Provider: {{cloud_provider}} (AWS / Azure / Multi-cloud)
- Region (Primary): {{primary_region}}
- Region (DR): {{dr_region}}
- Architecture: {{architecture_pattern}} (monolith / microservices / serverless)
- Dependencies: {{dependencies}} (upstream services, databases, third-party APIs)

**Current DR Targets:**
- RTO: {{rto}} minutes
- RPO: {{rpo}} minutes
- Last Successful DR Test: {{last_dr_test_date}}
- DR Test Frequency: {{dr_test_frequency}}
- Previous Test Results: {{previous_test_results}}

**Architecture Snapshot:**
- Compute: {{compute_detail}}
- Database: {{database_detail}}
- Storage: {{storage_detail}}
- Networking: {{network_detail}}
- DNS: {{dns_detail}}
- Auth: {{auth_detail}}
- CI/CD: {{cicd_detail}}

## user_prompt

Review or design the disaster recovery plan for {{application_name}} and guide me through a tabletop exercise.

### Phase 1: DR Strategy Assessment

Based on the service tier {{service_tier}}, evaluate these strategies:

| Strategy | RTO | RPO | Cost | Complexity | Recommended for {{service_tier}}? |
|----------|-----|-----|------|-----------|----------------------------------|
| **Backup & Restore** | Hours | 24h | Low | Low | |
| **Pilot Light** | ~30min | ~10min | Medium | Medium | |
| **Warm Standby** | ~5min | ~5min | High | High | |
| **Active-Active** | <1min | Real-time | Very High | Very High | |

**For each strategy not currently used, assess:**
1. What would need to change in the current architecture?
2. What's the estimated implementation effort?
3. Does the cost justify the reduced RTO/RPO for this tier?

### Phase 2: Gap Analysis

Review the current DR architecture and identify gaps:

**Data Replication:**
- [ ] Database cross-region replica configured? (Aurora Global DB / Azure SQL Geo-Replication)
- [ ] Replication lag measured and within RPO? (Current: {{replication_lag}}s)
- [ ] S3/BLOB cross-region replication enabled? (CRR vs SRR)
- [ ] Encryption key replication across regions? (KMS multi-region keys)
- [ ] Data consistency validation process?

**Infrastructure:**
- [ ] Can compute be provisioned in DR region automatically? (Infrastructure as Code)
- [ ] AMI/VM images available in DR region? (Image replication pipeline)
- [ ] Container images available in DR region? (ECR cross-region replication / ACR geo-replication)
- [ ] Configurations and secrets available in DR region? (Parameter Store, Secrets Manager replication)
- [ ] Networking topology ready in DR region? (VPC, subnets, transit gateway)
- [ ] Load balancers and target groups configured for DR?

**DNS & Traffic:**
- [ ] DNS failover configured? (Route 53 / Azure Traffic Manager)
- [ ] Health checks pointing to both regions?
- [ ] TTL values appropriate for failover speed? (Current TTL: {{current_ttl}}s, recommended: 60s)
- [ ] SSL/TLS certificates deployed to DR region?
- [ ] Custom domain validated for DR region?

**Dependencies:**
- [ ] External third-party APIs have DR plans documented?
- [ ] Authentication/authorization system available in DR region?
- [ ] Monitoring and logging pipeline replicated? (Datadog / CloudWatch / Azure Monitor cross-region)
- [ ] Alerting configured for DR region?
- [ ] Incident response runbook covers DR scenario?

### Phase 3: Tabletop Exercise Script

Guide me through a tabletop exercise with the following scenario:

**Scenario:** {{dr_scenario}}
(Options: Regional outage / Ransomware / Data corruption / DNS failure / Cloud provider API failure)

**Exercise Outline:**

```
Warm-up (5 min):
- Confirm all participants understand their roles
- Review current DR plan version and last test results

Scenario Injects:
T+00:00 - {{first_trigger_event}} (e.g., "Primary region is experiencing a full network outage")
  Question 1: How do you detect this? What alert fires first?
  Question 2: Who makes the call to fail over? What's the escalation path?
  Question 3: What's the first command you run?

T+00:15 - {{second_inject}} (e.g., "Health checks are all red. 5k users impacted.")
  Question 4: What's the decision tree for failover? At what threshold do you pull the trigger?
  Question 5: Walk through the failover step by step. What's automated vs manual?
  Question 6: How do you verify the DR environment is healthy before switching traffic?

T+00:30 - {{third_inject}} (e.g., "DR region is up but reporting data lag of 45 minutes")
  Question 7: What's the data integrity check process?
  Question 8: Do you accept data loss up to RPO or wait for replication to catch up?
  Question 9: How do you communicate impact to stakeholders?

T+00:45 - {{fourth_inject}} (e.g., "Primary region is restored")
  Question 10: What's the failback process?
  Question 11: How do you avoid data loss during failback?
  Question 12: What's the monitoring period before declaring full recovery?

Debrief (15 min):
- What went well?
- What gaps did we identify?
- What's the #1 thing to fix before the next test?
- Update RTO/RPO if needed based on test results
```

### Phase 4: Runbook Generation

Generate a DR runbook for {{dr_scenario}}:

```markdown
# DR Runbook: {{application_name}} - {{dr_scenario}}

## Pre-Requisites
- [ ] DR environment validated: {{last_validation_date}}
- [ ] Config sync verified: {{last_config_sync}}
- [ ] Database replication lag: {{replication_lag}}s (threshold: {{rpo}}s)
- [ ] DR team notified: [PagerDuty schedule link]

## Step 1: Confirm Outage
  Command: {{confirm_command}}
  Expected: {{expected_confirm_output}}
  Alternative: {{alternative_confirm}}

## Step 2: Declare Disaster
  Escalation: {{escalation_contact}}
  Decision Maker: {{decision_maker}}
  Communication: {{communication_channel}}

## Step 3: Execute Failover
  ### Database Failover:
  ```
  {{db_failover_command}}
  ```
  ### Compute Failover:
  ```
  {{compute_failover_command}}
  ```
  ### DNS Cutover:
  ```
  {{dns_cutover_command}}
  ```
  ### Verification:
  ```
  {{verification_command}}
  ```

## Step 4: Validate DR Environment
  - Health check endpoint: {{health_check_url}}
  - Smoke tests: {{smoke_test_command}}
  - Data integrity: {{data_integrity_check}}

## Step 5: Monitor & Communicate
  - Monitoring dashboard: {{dr_dashboard_url}}
  - Status page: {{status_page_url}}
  - Stakeholder update cadence: every {{update_cadence}} minutes

## Rollback
  If DR environment fails: {{rollback_plan}}
```

### Phase 5: Test Results Analysis

After the tabletop exercise, produce:
1. **Gaps identified:** {{gaps}}
2. **Action items:** {{action_items}}
3. **RTO/RPO re-validation:** Current RTO: {{current_rto}}, Achievable RTO: {{achievable_rto}}
4. **Next test date:** {{next_test_date}}
5. **Plan update required:** Yes/No -- if yes, specific sections to update

## output_format

Present as a structured DR assessment:
1. **Strategy Evaluation** -- table comparing options with recommendation
2. **Gap Analysis** -- checklist with pass/fail per item
3. **Tabletop Exercise** -- scenario script with injects and discussion questions
4. **Runbook** -- executable steps for failover, validation, and failback
5. **Post-Exercise Action Plan** -- prioritized findings and fixes

## constraints

- Tier 0 applications need at least warm standby; if they don't have it, flag as critical gap
- RTO and RPO must be validated through actual tests, not just architectural design
- DNS TTL should be < 60s for DR scenarios
- Never recommend manual failover for Tier 0 applications -- must be automatable
- Runbooks must include rollback steps for every action
