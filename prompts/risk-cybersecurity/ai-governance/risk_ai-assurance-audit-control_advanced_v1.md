---
title: AI Assurance, Audit & Control Framework
service_line: risk-cybersecurity
subcategory: ai-governance
use_case_type: audit-assurance
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: risk-sme
reviewer: risk-sme
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["ai-governance", "ai-audit", "ai-assurance", "ai-controls", "audit-readiness", "third-party-ai", "ai-risk", "responsible-ai", "ai-compliance", "claude"]
test_suites: []
---

## system_prompt

I've led AI assurance programs and audit engagements for organizations under regulatory scrutiny for their AI systems. Here's what I've learned that the textbooks don't tell you: auditing AI is fundamentally different from auditing traditional IT systems because AI behavior is probabilistic, not deterministic. You can't just check whether a control exists -- you have to check whether the model produces fair, accurate, and safe outputs across a distribution that shifts over time.

The assurance challenge has three dimensions:

1. **Technical Assurance** -- does the model work correctly? This is model validation, bias testing, robustness testing, and monitoring. It's the domain of data scientists and ML engineers, but auditors need to understand enough to evaluate the evidence.
2. **Control Assurance** -- are the governance controls operating effectively? This is traditional audit methodology applied to AI-specific controls: committee oversight, risk assessment processes, documentation completeness, incident management.
3. **Regulatory Assurance** -- does the organization meet regulatory requirements? EU AI Act conformity, US Executive Order compliance, state AI law adherence, sector-specific regulations.

The trap I see most often: organizations try to audit AI using traditional IT audit frameworks (COBIT, ISO 27001 audit checklists) without adapting them for AI-specific risks. You need an AI audit methodology that covers both the technology and the governance.

## context

**Organization Under Review:**
- Name: {{organization_name}}
- AI Systems in Scope: {{ai_systems_in_scope}} (Count or "All" or specific list)
- Audit Type: {{audit_type}} (Internal Audit / External Audit / Regulatory Exam / Third-Party Assurance / SOC 2 AI Criteria / Pre-Certification)
- Audit Framework: {{audit_framework}} (Custom AI Audit Framework / ISO 42001 / NIST AI RMF / EU AI Act Conformity / COBIT AI / SOC 2 + AI)
- Prior Audit Findings: {{prior_audit_findings}} (None / Open / Remediated / In Progress)
- Regulatory Interest: {{regulatory_interest}} (Active Exam / Inquiry / No Current Interest)
- AI Risk Appetite: {{ai_risk_appetite}} (Conservative / Moderate / Aggressive / Undefined)
- Assurance Team Composition: {{assurance_team}} (Internal Audit Only / IA + AI Specialists / External Firm / Multi-disciplinary)

## user_prompt

Conduct an AI assurance and audit engagement for {{organization_name}}.

### Phase 1: AI Audit Universe & Risk Assessment

| AI System | Risk Tier | Regulatory Criticality | Prior Findings | Audit Priority | Audit Approach |
|---|---|---|---|---|---|
| {{audit_system_1}} | {{audit_tier_1}} | {{reg_criticality_1}} | {{prior_findings_1}} | {{audit_priority_1}} | {{audit_approach_1}} |
| {{audit_system_2}} | {{audit_tier_2}} | {{reg_criticality_2}} | {{prior_findings_2}} | {{audit_priority_2}} | {{audit_approach_2}} |
| {{audit_system_3}} | {{audit_tier_3}} | {{reg_criticality_3}} | {{prior_findings_3}} | {{audit_priority_3}} | {{audit_approach_3}} |

### Phase 2: AI Control Framework Assessment

#### Control Domain 1: AI Governance & Oversight

| Control ID | Control Description | Control Type | Expected Evidence | Status | Finding | Recommendation |
|---|---|---|---|---|---|---|
| GOV-01 | AI governance committee established with defined charter, membership, and authority | Preventive | Committee charter, meeting minutes (past 12 months), decision logs | {{gov_01_status}} | {{gov_01_finding}} | {{gov_01_recommendation}} |
| GOV-02 | AI ethics principles approved by board and communicated enterprise-wide | Preventive | Board-approved principles document, communication records, attestations | {{gov_02_status}} | {{gov_02_finding}} | {{gov_02_recommendation}} |
| GOV-03 | AI risk appetite defined, approved, and monitored | Preventive | Risk appetite statement, Board approval minutes, monitoring dashboard | {{gov_03_status}} | {{gov_03_finding}} | {{gov_03_recommendation}} |
| GOV-04 | AI use case inventory maintained and reviewed quarterly | Detective | AI use case registry, quarterly review evidence, change log | {{gov_04_status}} | {{gov_04_finding}} | {{gov_04_recommendation}} |
| GOV-05 | AI risk assessment methodology defined and applied consistently | Preventive | Methodology document, completed risk assessments, sign-off evidence | {{gov_05_status}} | {{gov_05_finding}} | {{gov_05_recommendation}} |
| GOV-06 | AI roles and responsibilities defined with clear accountability | Preventive | RACI matrix, job descriptions, delegated authority documentation | {{gov_06_status}} | {{gov_06_finding}} | {{gov_06_recommendation}} |

#### Control Domain 2: AI Risk Management

| Control ID | Control Description | Control Type | Expected Evidence | Status | Finding | Recommendation |
|---|---|---|---|---|---|---|
| RM-01 | AI risk assessments completed for all Tier 2+ AI systems before deployment | Preventive | Completed risk assessments per system, approval evidence | {{rm_01_status}} | {{rm_01_finding}} | {{rm_01_recommendation}} |
| RM-02 | AI system impact assessments (fundamental rights, data protection, safety) completed for high-risk systems | Preventive | Completed impact assessments, stakeholder consultation evidence | {{rm_02_status}} | {{rm_02_finding}} | {{rm_02_recommendation}} |
| RM-03 | AI risk register maintained with inherent/residual scores, treatment plans, and owners | Detective | Risk register, review evidence, treatment plan status | {{rm_03_status}} | {{rm_03_finding}} | {{rm_03_recommendation}} |
| RM-04 | AI third-party risk assessments completed for all vendor/foundation model providers | Preventive | Completed vendor assessments, contractual AI provisions, SLA monitoring | {{rm_04_status}} | {{rm_04_finding}} | {{rm_04_recommendation}} |

#### Control Domain 3: AI Data Governance

| Control ID | Control Description | Control Type | Expected Evidence | Status | Finding | Recommendation |
|---|---|---|---|---|---|---|
| DG-01 | Training data quality assessed (completeness, accuracy, representativeness) | Preventive | Data quality reports, lineage documentation, exception logs | {{dg_01_status}} | {{dg_01_finding}} | {{dg_01_recommendation}} |
| DG-02 | Data provenance documented (sources, collection methods, consent) | Detective | Data provenance records, consent documentation, data sharing agreements | {{dg_02_status}} | {{dg_02_finding}} | {{dg_02_recommendation}} |
| DG-03 | Bias testing performed on training data and model outputs | Detective | Bias test results, intersectional analysis reports, remediation evidence | {{dg_03_status}} | {{dg_03_finding}} | {{dg_03_recommendation}} |
| DG-04 | Data privacy controls applied (PII detection, anonymization, retention limits) | Preventive | PII scan results, anonymization validation, retention policy compliance | {{dg_04_status}} | {{dg_04_finding}} | {{dg_04_recommendation}} |

#### Control Domain 4: AI Model Development & Validation

| Control ID | Control Description | Control Type | Expected Evidence | Status | Finding | Recommendation |
|---|---|---|---|---|---|---|
| DV-01 | Model development follows documented SDLC with AI-specific gates | Preventive | SDLC policy, gate review evidence, version control, change log | {{dv_01_status}} | {{dv_01_finding}} | {{dv_01_recommendation}} |
| DV-02 | Model validation performed independently of model development | Detective | Validation reports, independence attestation, reviewer credentials | {{dv_02_status}} | {{dv_02_finding}} | {{dv_02_recommendation}} |
| DV-03 | Adversarial testing and red-teaming completed for Tier 3+ systems | Detective | Red-teaming reports, adversarial test cases, remediation evidence | {{dv_03_status}} | {{dv_03_finding}} | {{dv_03_recommendation}} |
| DV-04 | Model cards / system cards published for all Tier 2+ AI systems | Preventive | Published model cards, review evidence, version history | {{dv_04_status}} | {{dv_04_finding}} | {{dv_04_recommendation}} |

#### Control Domain 5: AI Monitoring & Operations

| Control ID | Control Description | Control Type | Expected Evidence | Status | Finding | Recommendation |
|---|---|---|---|---|---|---|
| MO-01 | AI system monitoring operational (drift, bias, accuracy, safety) | Detective | Monitoring dashboards, alert logs, response evidence | {{mo_01_status}} | {{mo_01_finding}} | {{mo_01_recommendation}} |
| MO-02 | AI incident response procedure defined and tested | Preventive / Detective | Incident response plan, test/training evidence, incident logs | {{mo_02_status}} | {{mo_02_finding}} | {{mo_02_recommendation}} |
| MO-03 | Human oversight mechanisms operational and logged | Detective | Human review logs, override records, escalation evidence | {{mo_03_status}} | {{mo_03_finding}} | {{mo_03_recommendation}} |
| MO-04 | AI system performance SLAs monitored and reported | Detective | SLA monitoring reports, breach logs, remediation evidence | {{mo_04_status}} | {{mo_04_finding}} | {{mo_04_recommendation}} |

#### Control Domain 6: AI Transparency & Documentation

| Control ID | Control Description | Control Type | Expected Evidence | Status | Finding | Recommendation |
|---|---|---|---|---|---|---|
| TD-01 | User-facing AI disclosures implemented per regulatory requirements | Preventive | Disclosure text, deployment evidence, regulatory mapping | {{td_01_status}} | {{td_01_finding}} | {{td_01_recommendation}} |
| TD-02 | Technical documentation maintained per system (design, architecture, data flows) | Detective | Documentation repository, review evidence, version control | {{td_02_status}} | {{td_02_finding}} | {{td_02_recommendation}} |
| TD-03 | Audit trails maintained for AI system decisions and changes | Detective | Audit log review, retention compliance, tamper-proof evidence | {{td_03_status}} | {{td_03_finding}} | {{td_03_recommendation}} |

### Phase 3: AI-Specific Testing Procedures

| Test ID | Test Description | Sample Size | {{ai_system_1}} Result | {{ai_system_2}} Result | {{ai_system_3}} Result |
|---|---|---|---|---|---|
| T-01 | Verify AI use case inventory completeness -- sample production AI systems against registry | {{sample_1}} | {{t01_result_1}} | {{t01_result_2}} | {{t01_result_3}} |
| T-02 | Verify risk assessment completion for sampled high-risk systems -- check assessment quality, not just existence | {{sample_2}} | {{t02_result_1}} | {{t02_result_2}} | {{t02_result_3}} |
| T-03 | Verify bias testing evidence -- check intersectional analysis was performed, not just single-attribute | {{sample_3}} | {{t03_result_1}} | {{t03_result_2}} | {{t03_result_3}} |
| T-04 | Verify monitoring alert response -- sample alerts, check response time, remediation evidence | {{sample_4}} | {{t04_result_1}} | {{t04_result_2}} | {{t04_result_3}} |
| T-05 | Verify human oversight logs -- sample human review decisions, check review quality not just existence | {{sample_5}} | {{t05_result_1}} | {{t05_result_2}} | {{t05_result_3}} |
| T-06 | Verify model card / system card accuracy -- sample model cards against actual model behavior | {{sample_6}} | {{t06_result_1}} | {{t06_result_2}} | {{t06_result_3}} |
| T-07 | Verify third-party AI vendor assessment completion -- sample vendors, check assessment quality | {{sample_7}} | {{t07_result_1}} | {{t07_result_2}} | {{t07_result_3}} |
| T-08 | Verify incident response readiness -- conduct tabletop exercise for AI-specific incident scenario | {{sample_8}} | {{t08_result_1}} | {{t08_result_2}} | {{t08_result_3}} |

### Phase 4: Regulatory Compliance Verification

| Regulatory Requirement | Jurisdiction | Compliance Evidence | Status | Gap | Remediation Plan |
|---|---|---|---|---|---|
| {{reg_req_1}} | {{reg_juris_1}} | {{reg_evidence_1}} | {{reg_status_1}} | {{reg_gap_1}} | {{reg_remediation_1}} |
| {{reg_req_2}} | {{reg_juris_2}} | {{reg_evidence_2}} | {{reg_status_2}} | {{reg_gap_2}} | {{reg_remediation_2}} |
| {{reg_req_3}} | {{reg_juris_3}} | {{reg_evidence_3}} | {{reg_status_3}} | {{reg_gap_3}} | {{reg_remediation_3}} |

### Phase 5: Audit Findings & Recommendations

| Finding ID | Severity | Control Domain | Finding Description | Root Cause | Recommendation | Responsible Party | Target Date |
|---|---|---|---|---|---|---|---|
| AUD-{{year}}-001 | {{severity_1}} (Critical / High / Medium / Low / Informational) | {{domain_1}} | {{finding_description_1}} | {{root_cause_1}} | {{recommendation_1}} | {{responsible_1}} | {{target_date_1}} |
| AUD-{{year}}-002 | {{severity_2}} | {{domain_2}} | {{finding_description_2}} | {{root_cause_2}} | {{recommendation_2}} | {{responsible_2}} | {{target_date_2}} |
| AUD-{{year}}-003 | {{severity_3}} | {{domain_3}} | {{finding_description_3}} | {{root_cause_3}} | {{recommendation_3}} | {{responsible_3}} | {{target_date_3}} |

### Phase 6: Third-Party AI Assurance

If the engagement includes third-party AI systems:

| Vendor | AI System | Assurance Level | Evidence Provided | {{organization_name}} Verification | Residual Risk |
|---|---|---|---|---|---|
| {{vendor_1}} | {{vendor_system_1}} | {{assurance_level_1}} (SOC 2 + AI / ISO 42001 / Self-Assessment / None) | {{vendor_evidence_1}} | {{vendor_verification_1}} | {{vendor_risk_1}} |
| {{vendor_2}} | {{vendor_system_2}} | {{assurance_level_2}} | {{vendor_evidence_2}} | {{vendor_verification_2}} | {{vendor_risk_2}} |

### Phase 7: Assurance Opinion & Reporting

| Opinion Dimension | Rating | Rationale |
|---|---|---|
| **AI Governance & Oversight** | {{governance_rating}} (Effective / Requires Improvement / Ineffective) | {{governance_rationale}} |
| **AI Risk Management** | {{risk_rating}} | {{risk_rationale}} |
| **AI Data Governance** | {{data_rating}} | {{data_rationale}} |
| **AI Model Development & Validation** | {{model_rating}} | {{model_rationale}} |
| **AI Monitoring & Operations** | {{monitoring_rating}} | {{monitoring_rationale}} |
| **AI Transparency & Documentation** | {{transparency_rating}} | {{transparency_rationale}} |
| **Regulatory Compliance** | {{regulatory_rating}} | {{regulatory_rationale}} |
| **Overall AI Assurance Opinion** | {{overall_rating}} | {{overall_rationale}} |

## output_format

Present as an AI Assurance & Audit Report:

1. **Executive Summary** -- audit scope, methodology, overall opinion, key findings, critical risks
2. **Audit Universe & Risk Assessment** -- prioritization of AI systems in audit scope
3. **Control Framework Assessment** -- six control domains assessed with control-level findings and recommendations
4. **AI-Specific Testing Results** -- detailed test procedures, sample sizes, results per system
5. **Regulatory Compliance Verification** -- compliance status against applicable regulations with gap analysis
6. **Audit Findings & Recommendations** -- prioritized findings with severity, root cause, and remediation plan
7. **Third-Party AI Assurance** -- vendor AI system assurance assessment and residual risk
8. **Assurance Opinion** -- dimension-level and overall assurance ratings with rationale
9. **Management Response** -- action plan, responsible parties, target dates, tracking methodology

## constraints

- AI audit evidence must include both existence (control is documented) and operating effectiveness (control is actually working) testing
- Sampling methodology must account for AI system risk tier -- higher-tier systems require larger sample sizes and more frequent testing
- Audit independence requirements apply to AI audits -- internal audit teams validating AI systems they helped build do not meet independence standards
- Third-party AI vendor assurance cannot rely solely on vendor-provided SOC 2 reports -- additional AI-specific verification is required
- AI audit findings related to bias, fairness, or ethics require different subject matter expertise than traditional IT audit findings
- Regulatory compliance verification must be mapped to specific regulatory articles/sections, not just "we comply with EU AI Act"
- AI incident response testing (tabletop exercises) should use realistic AI-specific scenarios (bias discovery, model drift, hallucination, regulatory inquiry)
- Audit evidence retention for AI systems must match or exceed the system's operational lifespan plus regulatory retention requirements
- AI model cards and system cards are audit evidence -- they must be version-controlled and reviewable
- Findings that involve foundation model or third-party AI limitations must distinguish between vendor-caused and organization-caused issues
- The assurance opinion should provide a clear, actionable assessment -- ratings should be supported by evidence, not just professional judgment
- AI audit programs should be updated at least annually or when new regulations, new AI system types, or material changes occur
