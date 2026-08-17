---
title: ISO 42001 AI Management System (AIMS) Implementation
service_line: risk-cybersecurity
subcategory: iso-42001
use_case_type: implementation
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: risk-sme
reviewer: security-lead
created_date: 2026-07-01
last_modified: 2026-07-15
tags: ["iso-42001", "ai-management", "aims", "artificial-intelligence", "ai-governance", "responsible-ai", "claude"]
test_suites: ["testing/test-cases/risk-cybersecurity/iso-42001-aims.json"]
---

## system_prompt

I'm an ISO 42001:2023 Lead Implementer and AI Governance specialist -- one of the first cohort certified under this new standard. ISO 42001 is still evolving, and so is the regulatory landscape around it (EU AI Act, emerging US regulations). The standard gives you a framework, but implementing it requires adapting to a moving target.

Key standards and frameworks I work with:
- ISO/IEC 42001:2023 -- AIMS requirements
- ISO/IEC 23894 -- AI Risk Management
- ISO/IEC 38507 -- AI governance implications
- ISO/IEC 42002 (emerging) -- AI risk assessment methodologies
- EU AI Act risk classification (prohibited, high-risk, limited, minimal)
- NIST AI RMF 1.0
- OECD AI Principles

My AIMS implementation follows the ISO high-level structure, adapted for AI:
1. **Context** -- AI-specific opportunities and risks in the organization
2. **Leadership** -- AI ethics policy, accountability, governance structure
3. **Planning** -- AI risk assessment, AI system impact assessment
4. **Support** -- AI competence, awareness, documented information
5. **Operation** -- AI system lifecycle: design, development, deployment, monitoring
6. **Evaluation** -- AI system performance monitoring, bias detection, drift
7. **Improvement** -- nonconformity, corrective actions, continuous improvement

## context

**Organization Profile:**
- Name: {{org_name}}
- Industry: {{industry}}
- AI Maturity Level: {{ai_maturity}} (exploring / implementing / scaling / embedded)
- Existing AI Systems: {{ai_systems_count}} (number of AI/ML systems in production)
- AI Types Used: {{ai_types}} (LLM / predictive ML / computer vision / NLP / RPA / expert systems)
- AI Deployment Models: {{ai_deployment}} (API-based / self-hosted / hybrid / embedded in ISV products)
- Existing Management Systems: {{existing_mss}} (ISO 27001 / ISO 9001 / SOC 2 / None)
- Regulatory Exposure: {{regulatory_exposure}} (EU AI Act / GDPR / sectoral AI regulation)

**AI System Under Scope:**
- System Name: {{ai_system_name}}
- Description: {{ai_system_description}}
- Purpose: {{ai_system_purpose}}
- Risk Classification (per EU AI Act): {{ai_risk_class}} (prohibited / high-risk / limited transparency / minimal)
- Data Used For: {{ai_data_usage}} (training / fine-tuning / RAG / inference / evaluation)
- Stakeholders Affected: {{ai_stakeholders}} (customers / employees / public / regulated entities)
- Deployment Date: {{ai_deployment_date}}

## user_prompt

Guide me through implementing an ISO 42001 AI Management System (AIMS) for {{org_name}}.

### Phase 1: AI-Specific Context and Scope

**1.1 AI System Inventory**

| System ID | Name | Type | Risk Class | Data Domains | Third-Party AI? | Version | Status |
|-----------|------|------|------------|--------------|-----------------|---------|--------|
| AI-001 | {{ai_name_1}} | {{ai_type_1}} | {{risk_class_1}} | {{data_domains_1}} | {{third_party_1}} | {{version_1}} | {{status_1}} |
| AI-002 | {{ai_name_2}} | {{ai_type_2}} | {{risk_class_2}} | {{data_domains_2}} | {{third_party_2}} | {{version_2}} | {{status_2}} |

**1.2 AI-Specific External and Internal Issues (Clause 4.1)**

| Issue Type | Issue | Impact on AIMS | Monitoring Mechanism |
|------------|-------|---------------|---------------------|
| Regulatory | {{regulatory_issue}} | {{regulatory_impact}} | {{regulatory_monitoring}} |
| Technological | {{tech_issue}} (e.g., foundation model updates, model collapse) | {{tech_impact}} | {{tech_monitoring}} |
| Ethical | {{ethical_issue}} (bias, fairness, transparency) | {{ethical_impact}} | {{ethical_monitoring}} |
| Societal | {{societal_issue}} (job displacement, misinformation) | {{societal_impact}} | {{societal_monitoring}} |
| Business | {{business_issue}} (vendor lock-in, cost of compute) | {{business_impact}} | {{business_monitoring}} |

**1.3 AI Governance Structure (Clause 5.1)**

Document the AI governance roles:

| Role | Responsibility | Name/Team | Reporting Line |
|------|---------------|-----------|----------------|
| AI Ethics Board | Approve AI use cases, ethical review, high-risk AI decisions | {{ethics_board}} | Board of Directors |
| AI Risk Owner | AI risk assessment, treatment, monitoring | {{ai_risk_owner}} | CRO / CISO |
| AI System Owner | AI system lifecycle management | {{ai_system_owner}} | CTO / VP Engineering |
| AI Data Steward | Data quality, provenance, bias detection | {{ai_data_steward}} | CDO |
| AI Training & Awareness Lead | AI competence and training programs | {{ai_training_lead}} | CHRO |
| AI Compliance Officer | Regulatory compliance (EU AI Act, etc.) | {{ai_compliance_officer}} | General Counsel |

### Phase 2: AI Risk Assessment (Clause 6.1 / ISO 23894)

**2.1 AI Risk Categories**

Assess risks specific to AI systems:

| Risk Category | Specific Risk | Inherent Score | Controls | Residual Score | Acceptable? |
|--------------|---------------|---------------|----------|----------------|-------------|
| **Bias & Fairness** | {{bias_risk}} -- model produces disparate outcomes for {{protected_groups}} | {{inherent_bias}} | {{bias_controls}} | {{residual_bias}} | {{acceptable_bias}} |
| **Accuracy & Reliability** | {{accuracy_risk}} -- model accuracy below {{accuracy_threshold}}% in {{edge_cases}} | {{inherent_accuracy}} | {{accuracy_controls}} | {{residual_accuracy}} | {{acceptable_accuracy}} |
| **Robustness & Security** | {{robustness_risk}} -- adversarial prompts, data poisoning, model inversion | {{inherent_robustness}} | {{robustness_controls}} | {{residual_robustness}} | {{acceptable_robustness}} |
| **Transparency & Explainability** | {{transparency_risk}} -- black-box decisions affecting {{stakeholders}} cannot be explained | {{inherent_transparency}} | {{transparency_controls}} | {{residual_transparency}} | {{acceptable_transparency}} |
| **Data Privacy** | {{privacy_risk}} -- PII leakage in training data, model memorization | {{inherent_privacy}} | {{privacy_controls}} | {{residual_privacy}} | {{acceptable_privacy}} |
| **Accountability** | {{accountability_risk}} -- no human oversight for critical AI decisions | {{inherent_accountability}} | {{accountability_controls}} | {{residual_accountability}} | {{acceptable_accountability}} |
| **Environmental** | {{environmental_risk}} -- compute cost and carbon footprint | {{inherent_environmental}} | {{environmental_controls}} | {{residual_environmental}} | {{acceptable_environmental}} |
| **Third-Party AI** | {{third_party_risk}} -- vendor AI model changes, deprecation, supply chain | {{inherent_third_party}} | {{third_party_controls}} | {{residual_third_party}} | {{acceptable_third_party}} |

**2.2 AI System Impact Assessment**

For each high-risk AI system, conduct an AI impact assessment:

| Assessment Area | Findings | Score | Mitigation |
|----------------|----------|-------|------------|
| **Fundamental Rights Impact** | {{fundamental_rights_findings}} | {{fundamental_rights_score}} | {{fundamental_rights_mitigation}} |
| **Data Protection Impact (DPIA)** | {{dpia_findings}} | {{dpia_score}} | {{dpia_mitigation}} |
| **Health & Safety Impact** | {{health_safety_findings}} | {{health_safety_score}} | {{health_safety_mitigation}} |
| **Societal Impact** | {{societal_impact_findings}} | {{societal_impact_score}} | {{societal_impact_mitigation}} |
| **Human Oversight Adequacy** | {{human_oversight_findings}} | {{human_oversight_score}} | {{human_oversight_mitigation}} |

### Phase 3: AI System Lifecycle Controls (Clause 8 -- Operation)

**3.1 AI System Design & Development**

| Control Area | Requirement | Evidence | Status |
|-------------|-------------|----------|--------|
| **Data Quality** | Training data: completeness, accuracy, representativeness, bias assessment | {{data_quality_evidence}} | {{data_quality_status}} |
| **Data Provenance** | Data sources documented, lineage tracked, consent verified | {{data_provenance_evidence}} | {{data_provenance_status}} |
| **Model Selection** | Model selection rationale documented; trade-off between accuracy and fairness | {{model_selection_evidence}} | {{model_selection_status}} |
| **Robustness Testing** | Adversarial testing, edge case testing, out-of-distribution testing | {{robustness_evidence}} | {{robustness_status}} |
| **Explainability** | XAI techniques applied; explanation quality assessed for target audience | {{explainability_evidence}} | {{explainability_status}} |
| **Human-in-the-Loop** | Designated human oversight at predefined decision points | {{human_loop_evidence}} | {{human_loop_status}} |

**3.2 AI System Monitoring & Operations**

| Monitoring Area | Metric | Threshold | Alert | Response |
|----------------|--------|-----------|-------|----------|
| **Data Drift** | Input distribution shift (PSI / KL divergence) | {{drift_threshold}} | {{drift_alert}} | {{drift_response}} |
| **Concept Drift** | Model performance degradation over time | {{concept_drift_threshold}} | {{concept_drift_alert}} | {{concept_drift_response}} |
| **Accuracy Degradation** | Accuracy / F1 / AUC drop from baseline | {{accuracy_threshold}} | {{accuracy_alert}} | {{accuracy_response}} |
| **Bias Drift** | Fairness metric change (demographic parity / equal opportunity) | {{bias_drift_threshold}} | {{bias_drift_alert}} | {{bias_drift_response}} |
| **Latency / Throughput** | Inference time SLA | {{latency_threshold}}ms | {{latency_alert}} | {{latency_response}} |
| **Input Anomaly Detection** | Out-of-distribution inputs, adversarial patterns | {{input_anomaly_threshold}} | {{input_anomaly_alert}} | {{input_anomaly_response}} |

**3.3 Third-Party and Foundation Model Governance**

| Control | Requirement | Vendor Response | Status |
|---------|-------------|----------------|--------|
| Model transparency | Vendor provides model card, datasheet, system card | {{vendor_model_card}} | {{model_card_status}} |
| Data usage rights | Training data ownership, consent, copyright compliance confirmed | {{vendor_data_rights}} | {{data_rights_status}} |
| Model updates | Vendor change notification SLA; version pinning capability | {{vendor_update_policy}} | {{update_status}} |
| Security assessment | Vendor penetration testing, red teaming results shared | {{vendor_security}} | {{security_status}} |
| SLA guarantees | Uptime, accuracy, latency SLAs defined in contract | {{vendor_sla}} | {{sla_status}} |
| Exit plan | Model portability, data extraction, migration assistance | {{vendor_exit}} | {{exit_status}} |

### Phase 4: AI Transparency and Documentation (Clause 7.5)

**4.1 AI System Documentation -- Model Card**

```yaml
model_card:
  model_name: {{ai_system_name}}
  version: {{ai_system_version}}
  model_type: {{model_type}}
  provider: {{model_provider}} (internal / {{vendor_name}})
  intended_use: {{intended_use}}
  limitations: {{limitations}}
  training_data:
    - source: {{training_source}}
    - size: {{training_size}}
    - date_range: {{training_date_range}}
    - languages: {{training_languages}}
  performance:
    - primary_metric: {{primary_metric}}
    - value: {{primary_value}}
    - eval_dataset: {{eval_dataset}}
  fairness_evaluation:
    - dimension: {{fairness_dimension}}
    - metric: {{fairness_metric}}
    - result: {{fairness_result}}
  known_biases: {{known_biases}}
  human_oversight: {{human_oversight_description}}
  regulatory_classification: {{regulatory_classification}}
  approval_date: {{approval_date}}
  approved_by: {{approving_body}}
```

### Phase 5: EU AI Act Compliance Mapping

Map ISO 42001 controls to EU AI Act requirements for high-risk AI systems:

| EU AI Act Requirement | ISO 42001 Control Mapping | Implementation Status | Evidence |
|----------------------|--------------------------|----------------------|----------|
| Risk management system (Art. 9) | 6.1 -- AI risk assessment | {{art_9_status}} | {{art_9_evidence}} |
| Data governance (Art. 10) | 8.1 -- Data quality, provenance | {{art_10_status}} | {{art_10_evidence}} |
| Technical documentation (Art. 11) | 7.5 -- Model card, system documentation | {{art_11_status}} | {{art_11_evidence}} |
| Record keeping & logging (Art. 12) | 8.3 -- Monitoring, logging | {{art_12_status}} | {{art_12_evidence}} |
| Transparency & user information (Art. 13) | 7.4 -- Communication | {{art_13_status}} | {{art_13_evidence}} |
| Human oversight (Art. 14) | 8.2 -- Human-in-the-loop | {{art_14_status}} | {{art_14_evidence}} |
| Accuracy, robustness, cybersecurity (Art. 15) | 8.1 -- Testing, robustness | {{art_15_status}} | {{art_15_evidence}} |
| Conformity assessment (Art. 43) | 9.2 -- Internal audit | {{art_43_status}} | {{art_43_evidence}} |
| Registration in EU database (Art. 49) | 7.5.2 -- Documented information controls | {{art_49_status}} | {{art_49_evidence}} |

### Phase 6: AIMS Performance Evaluation (Clause 9)

| Metric | Target | Current | Trend | Owner |
|--------|--------|---------|-------|-------|
| AI incidents (privacy, bias, safety) | 0/month | {{ai_incidents}} | {{incident_trend}} | {{incident_owner}} |
| AI systems with completed impact assessment | 100% | {{impact_assessment_pct}}% | {{impact_trend}} | {{impact_owner}} |
| AI model accuracy / F1 (production) | >{{accuracy_target}}% | {{current_accuracy}}% | {{accuracy_trend}} | {{accuracy_owner}} |
| AI bias testing completion | Quarterly | {{bias_testing_status}} | {{bias_trend}} | {{bias_owner}} |
| Human oversight compliance | 100% of high-risk | {{human_oversight_pct}}% | {{human_oversight_trend}} | {{human_oversight_owner}} |
| Third-party AI vendor assessments | 100% | {{vendor_assessment_pct}}% | {{vendor_trend}} | {{vendor_owner}} |
| AI governance training completion | >95% | {{training_completion}}% | {{training_trend}} | {{training_owner}} |

### Phase 7: Pre-Certification Checklist

**Stage 1 (Documentation Review):**
- [ ] AIMS scope -- AI system boundaries, organizational scope, exclusions
- [ ] AI ethics policy -- signed by executive leadership
- [ ] AI risk assessment methodology (per ISO 23894)
- [ ] AI system risk register -- all identified risks with treatment
- [ ] AI system impact assessments -- for all high-risk systems
- [ ] AI governance structure -- roles, responsibilities, authority
- [ ] AI competence framework -- training records, role-based AI literacy requirements
- [ ] AI transparency documentation -- model cards, system cards for all production AI
- [ ] AI supplier management policy -- vendor assessment criteria

**Stage 2 (Implementation Verification):**
- [ ] AI monitoring operational -- drift detection, bias monitoring, accuracy tracking
- [ ] Human oversight controls implemented -- all high-risk AI systems have human review
- [ ] AI incident response procedure tested and exercised
- [ ] AI system logs retained per policy (minimum {{log_retention_days}} days)
- [ ] Third-party AI providers assessed and documented
- [ ] AI data governance controls operational -- data provenance, consent, quality
- [ ] AI fairness/bias testing -- completed for all production AI systems
- [ ] Management review conducted with AI-specific agenda items
- [ ] Internal audit completed with findings closed

## output_format

Present as a complete AIMS implementation workbook:
1. **AIMS Policy** -- AI ethics policy, governance charter
2. **AI System Inventory** -- complete register of all AI systems
3. **AI Risk Register** -- risk categories, inherent/residual scores, treatment plans
4. **AI Impact Assessment** -- completed assessments per high-risk system
5. **Control Implementation** -- lifecycle controls per AI system
6. **Model Cards** -- transparency documentation per AI system
7. **Monitoring Plan** -- drift, bias, accuracy, latency metrics and thresholds
8. **EU AI Act Compliance Matrix** -- mapping of ISO 42001 to regulatory requirements
9. **Audit Checklist** -- Stage 1 and Stage 2 certification checklists
10. **Governance Dashboard** -- executive KPIs for AI risk and performance

## constraints

- The standard applies to ANY organization developing or using AI -- not just AI vendors
- High-risk classification (per EU AI Act) requires additional impact assessments and conformity procedures
- ISO 42001 is designed to be integrated with ISO 27001 (ISMS) and ISO 9001 (QMS) -- leverage existing controls
- AI transparency documentation (model cards) should be accessible to both technical and non-technical stakeholders
- Human oversight must be meaningful -- merely having a human "in the loop" who rubber-stamps AI decisions is insufficient
- Third-party AI systems (API-based LLMs, embedded AI in ISV products) are in scope
- AI bias testing should cover intersectional bias, not just single-dimension analysis
- Environmental impact (compute energy, carbon footprint) is a recognized AI risk category under ISO 42001
- The standard requires documented information -- "if it isn't documented, it didn't happen" applies to AI
- ISO 42001 certification is available from multiple CABs; accreditation landscape is still evolving
