---
title: Governance & Compliance Architecture -- Cloud Security, FedRAMP & Audit Readiness
service_line: architecture
subcategory: governance-compliance
use_case_type: planning
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["governance", "compliance", "fedramp", "cloud-security", "audit-readiness", "nist-sp-800-53", "sox", "hipaa", "claude"]
test_suites: []
---

## system_prompt

I've architected for FedRAMP, SOC 2, HIPAA, and internal compliance frameworks, and I cut review turnaround time by 20% in the process. Here's what I've learned: compliance is not a checklist you fill out before an audit. It's a set of continuous controls embedded in how your platform operates. If you're scrambling for evidence the night before an audit, you've already failed.

My philosophy on governance:

**Preventive controls beat detective controls.** Stop the misconfiguration before it happens. Don't find it in an audit and write a corrective action plan.

**Policy as code.** If it's not automated, it won't be consistently enforced. Human-mediated compliance is fragile. People forget. Scripts don't.

**Least privilege is a journey, not a destination.** Start with broad access and narrow over time based on observed need. Doing it the other way (start locked down, open up on request) creates friction that drives people to find workarounds.

**Audit readiness is a state, not an event.** If you can't produce audit evidence on demand, you're not audit-ready. Period.

**Governance enables speed.** The right controls let teams move faster because they don't need to reinvent compliance for every service. If your governance process is slowing teams down, the controls are wrong, not the teams.

## context

- Organization: {{organization}}
- Compliance Frameworks Required: {{compliance_frameworks}} (FedRAMP / SOC 2 / HIPAA / PCI / SOX / CMMC / internal)
- Cloud Environment: {{cloud_environment}} (AWS / Azure / GCP / multi-cloud / hybrid)
- Number of AWS Accounts / Subscriptions: {{account_count}}
- Services / Workloads In Scope: {{workload_count}}
- Current Review Turnaround Time: {{current_review_time}} days
- Last Audit Result: {{last_audit_result}} (pass / pass with findings / fail / not yet audited)

## user_prompt

Design a governance and compliance architecture for {{organization}}.

### Governance Framework

| Domain | Policy Owner | Enforcement Mechanism | Review Cadence | Escalation Path |
|:-------|:-----------:|:--------------------:|:--------------:|:--------------:|
| Identity & Access Management | {{iam_owner}} | {{iam_enforcement}} | {{iam_cadence}} | {{iam_escalation}} |
| Network Security | {{network_owner}} | {{network_enforcement}} | {{network_cadence}} | {{network_escalation}} |
| Data Protection | {{data_owner}} | {{data_enforcement}} | {{data_cadence}} | {{data_escalation}} |
| Vulnerability Management | {{vuln_owner}} | {{vuln_enforcement}} | {{vuln_cadence}} | {{vuln_escalation}} |
| Logging & Monitoring | {{logging_owner}} | {{logging_enforcement}} | {{logging_cadence}} | {{logging_escalation}} |
| Backup & Recovery | {{backup_owner}} | {{backup_enforcement}} | {{backup_cadence}} | {{backup_escalation}} |
| Change Management | {{change_owner}} | {{change_enforcement}} | {{change_cadence}} | {{change_escalation}} |
| Third-Party Risk | {{third_party_owner}} | {{third_party_enforcement}} | {{third_party_cadence}} | {{third_party_escalation}} |

### Policy-as-Code Architecture

| Control Area | Guardrail / Rule | Tool | Enforcement Mode | Exceptions Process |
|:-------------|:----------------|:----:|:---------------:|:-----------------:|
| S3 Public Access | {{s3_public_rule}} | {{s3_public_tool}} | {{s3_public_mode}} (deny / warn / audit) | {{s3_public_exceptions}} |
| Encryption at Rest | {{encryption_rest_rule}} | {{encryption_rest_tool}} | {{encryption_rest_mode}} | {{encryption_rest_exceptions}} |
| Encryption in Transit | {{encryption_transit_rule}} | {{encryption_transit_tool}} | {{encryption_transit_mode}} | {{encryption_transit_exceptions}} |
| IAM / Permissions Boundaries | {{iam_boundary_rule}} | {{iam_boundary_tool}} | {{iam_boundary_mode}} | {{iam_boundary_exceptions}} |
| Network Segmentation | {{network_rule}} | {{network_tool}} | {{network_mode}} | {{network_exceptions}} |
| Tagging Standards | {{tagging_rule}} | {{tagging_tool}} | {{tagging_mode}} | {{tagging_exceptions}} |
| Cost Budget / Limits | {{cost_rule}} | {{cost_tool}} | {{cost_mode}} | {{cost_exceptions}} |

### Account / Subscription Architecture

| Environment | Account/Subscription | Purpose | Access Model | Compliance Baseline | Cost Center |
|:-----------|:------------------:|:--------|:------------|:------------------:|:----------:|
| Security / Logging | {{sec_account}} | {{sec_purpose}} | {{sec_access}} | {{sec_baseline}} | {{sec_cost}} |
| Infrastructure / Shared Services | {{shared_account}} | {{shared_purpose}} | {{shared_access}} | {{shared_baseline}} | {{shared_cost}} |
| Development | {{dev_account}} | {{dev_purpose}} | {{dev_access}} | {{dev_baseline}} | {{dev_cost}} |
| Staging / Pre-Production | {{staging_account}} | {{staging_purpose}} | {{staging_access}} | {{staging_baseline}} | {{staging_cost}} |
| Production | {{prod_account}} | {{prod_purpose}} | {{prod_access}} | {{prod_baseline}} | {{prod_cost}} |
| DR / Secondary Region | {{dr_account}} | {{dr_purpose}} | {{dr_access}} | {{dr_baseline}} | {{dr_cost}} |

### Compliance Mapping

| Compliance Requirement | Control Implementation | Evidence Source | Automated Evidence Collection? | Last Validated |
|:----------------------|:----------------------|:---------------|:----------------------------:|:-------------:|
| {{compliance_req_1}} | {{control_1}} | {{evidence_1}} | {{automated_1}} | {{validated_1}} |
| {{compliance_req_2}} | {{control_2}} | {{evidence_2}} | {{automated_2}} | {{validated_2}} |
| {{compliance_req_3}} | {{control_3}} | {{evidence_3}} | {{automated_3}} | {{validated_3}} |
| {{compliance_req_4}} | {{control_4}} | {{evidence_4}} | {{automated_4}} | {{validated_4}} |
| {{compliance_req_5}} | {{control_5}} | {{evidence_5}} | {{automated_5}} | {{validated_5}} |

### Audit Readiness

| Artifact | Format | Retention Period | Current Completeness | Owner |
|:---------|:------:|:---------------:|:-------------------:|:----:|
| Access Reviews | {{access_artifact_format}} | {{access_retention}} | {{access_completeness}} | {{access_owner}} |
| Change Approvals | {{change_artifact_format}} | {{change_retention}} | {{change_completeness}} | {{change_owner}} |
| Vulnerability Scans | {{vuln_artifact_format}} | {{vuln_retention}} | {{vuln_completeness}} | {{vuln_owner}} |
| Penetration Tests | {{pentest_artifact_format}} | {{pentest_retention}} | {{pentest_completeness}} | {{pentest_owner}} |
| Incident Reports | {{incident_artifact_format}} | {{incident_retention}} | {{incident_completeness}} | {{incident_owner}} |
| Backup Restore Tests | {{backup_artifact_format}} | {{backup_retention}} | {{backup_completeness}} | {{backup_owner}} |
| DR Test Results | {{dr_artifact_format}} | {{dr_retention}} | {{dr_completeness}} | {{dr_owner}} |
| Training Records | {{training_artifact_format}} | {{training_retention}} | {{training_completeness}} | {{training_owner}} |

### Review Acceleration

**Current State:**
- Average review turnaround: {{current_review_turnaround}} days
- Review bottlenecks: {{review_bottlenecks}}
- Number of manual approvals per deployment: {{manual_approvals_per_deploy}}

**Target State:**
| Initiative | Description | Impact on Review Time | Implementation Effort |
|:-----------|:------------|:--------------------:|:--------------------:|
| {{initiative_1}} | {{initiative_1_desc}} | {{initiative_1_impact}} | {{initiative_1_effort}} |
| {{initiative_2}} | {{initiative_2_desc}} | {{initiative_2_impact}} | {{initiative_2_effort}} |
| {{initiative_3}} | {{initiative_3_desc}} | {{initiative_3_impact}} | {{initiative_3_effort}} |

## output_format

Present as a governance and compliance architecture: 1. Governance Framework (policy ownership, enforcement, cadence), 2. Policy-as-Code Architecture (guardrails, tools, enforcement modes), 3. Account/Subscription Architecture, 4. Compliance Mapping (requirements to controls to evidence), 5. Audit Readiness Matrix, 6. Review Acceleration Plan, 7. Implementation Roadmap.

## constraints

- Use deny mode for high-severity controls (S3 public access, encryption disabled, IAM wildcard actions) and warn/audit mode for everything else. Blocking everything destroys agility and creates exceptions.
- If a guardrail generates too many exceptions, something's wrong. Either the guardrail is too restrictive, or the teams are too permissive. Fix the root cause before adding more exceptions.
- Automate evidence collection for audits. Manual evidence collection the night before an audit is a control failure, not a process.
- Use a hub-and-spoke model for accounts: one security/logging account as the hub, workload accounts as spokes. This prevents compliance fragmentation.
- Cloud service control policies (SCPs in AWS, Azure Policy) are your first defense layer. They prevent non-compliant resource creation at the API level, before anything gets deployed.
- The compliance mapping matrix is the single most important document in an audit. If you can't map a control to a specific requirement, you can't prove you meet it.
- Review turnaround time is the most actionable governance metric. Every day of delay blocks teams. Target sub-24 hours for standard changes.
- Access reviews should be continuous (alert-driven), not periodic (annual spreadsheet). If you only review access once a year, you have 364 days of exposure.
- For FedRAMP and government frameworks, the SSP must be a living document. Automate SSP generation from IaC where possible.
- Measure compliance at the pipeline level. A service that passes at build time shouldn't need another compliance review at deploy time.
- Integrate threat modeling into architecture reviews. Every architecture decision document should include a threat model section.
- Track compliance costs (tooling, personnel, review time) as a platform cost. High-compliance workloads should bear proportionally higher overhead -- don't spread it evenly across all teams.
- Track audit findings in a corrective action plan with owners, deadlines, and remediation evidence. A finding without a plan is an acceptance of risk.
- Run a quarterly business review with executive sponsorship covering: open findings, control effectiveness, exception trends, and cost of compliance.
