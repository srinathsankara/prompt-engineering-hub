---
title: ISO 42002 AI Risk Assessment & Management
service_line: risk-cybersecurity
subcategory: iso-42002
use_case_type: assessment
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: risk-sme
reviewer: security-lead
created_date: 2026-07-08
last_modified: 2026-07-15
tags: ["iso-42002", "ai-risk", "risk-assessment", "ai-safety", "ai-governance", "model-risk", "claude"]
test_suites: ["testing/test-cases/risk-cybersecurity/iso-42002-ai-risk.json"]
---

## system_prompt

AI risk assessment is still an emerging field, and ISO 42002 is one of the first frameworks to tackle it systematically. I work across ISO 42002, NIST AI RMF 1.0, ISO 23894, and the EU AI Act risk classification. AI risks fall into three buckets: technical (model behavior, adversarial robustness), organizational (governance, compliance), and societal (fairness, bias, fundamental rights). Most teams focus on the first and ignore the other two. That's a mistake.

My risk assessment process:
1. **Contextualize** -- understand the AI system's purpose, stakeholders, deployment context, and regulatory landscape
2. **Identify** -- enumerate risks across technical, operational, ethical, and compliance dimensions
3. **Analyze** -- assess inherent risk using likelihood and impact calibrated to AI-specific failure modes
4. **Evaluate** -- compare residual risk against organizational risk appetite
5. **Treat** -- select controls (avoid, modify, transfer, retain)
6. **Monitor** -- continuous monitoring through drift detection, bias measurement, incident tracking
7. **Communicate** -- transparency reporting to stakeholders, regulators, and affected parties

## context

**Organization:**
- Name: {{org_name}}
- AI Governance Maturity: {{ai_governance_maturity}} (ad-hoc / defined / managed / optimized)
- Existing AI Risk Framework: {{existing_framework}} (NIST AI RMF / ISO 23894 / EU AI Act / internal / none)
- Sector: {{sector}} (healthcare / financial services / government / technology / manufacturing / professional services)
- Regulatory Oversight: {{regulatory_oversight}} (SEC / FDA / FCA / CFPB / HHS / none)

**AI System Under Assessment:**
- System Name: {{ai_system_name}}
- AI Type: {{ai_type}} (generative LLM / discriminative ML / computer vision / NLP / recommender / RPA / expert system)
- Deployment Model: {{deployment_model}} (SaaS API / self-hosted / embedded / edge / hybrid)
- System Tier: {{system_tier}} (critical / high-impact / medium-impact / low-impact)
- Data Modalities: {{data_modalities}} (text / image / structured data / multimodal / audio / video)
- Number of Users / Affected Population: {{user_population}}
- Geographic Deployment: {{geography}} (US / EU / global / single jurisdiction)

**System Description:**
{{ai_system_full_description}}

**Lifecycle Stage:**
- Current Stage: {{lifecycle_stage}} (design / development / validation / production / decommissioning)
- Stage-Specific Risks: {{stage_specific_risks}}

## user_prompt

Conduct an ISO 42002-aligned AI risk assessment for {{ai_system_name}}.

### Phase 1: AI Risk Context Establishment

**1.1 AI System Characterization**

| Dimension | Detail |
|-----------|--------|
| Intended Purpose | {{intended_purpose}} |
| Operational Domain | {{operational_domain}} (contexts where system is designed to operate) |
| Edge of Operational Domain | {{edge_domain}} (contexts where system may degrade or fail) |
| Inputs | {{ai_inputs}} -- source, format, data quality requirements |
| Outputs | {{ai_outputs}} -- format, decision type, action triggered |
| Autonomy Level | {{autonomy_level}} (full / human-in-the-loop / human-on-the-loop / advisory only) |
| Human Oversight | {{human_oversight_type}} -- when, how, by whom |
| Feedback Loops | {{feedback_loops}} -- how system learns from deployment |
| Third-Party AI Dependencies | {{third_party_ai}} -- base models, APIs, data sources |

**1.2 Stakeholder Identification & Impact Mapping**

| Stakeholder Group | Relationship to AI System | Potential Harms | Desired Outcomes |
|------------------|---------------------------|-----------------|------------------|
| {{stakeholder_1}} (e.g., end users) | {{relationship_1}} | {{harms_1}} | {{outcomes_1}} |
| {{stakeholder_2}} (e.g., subjects of decisions) | {{relationship_2}} | {{harms_2}} | {{outcomes_2}} |
| {{stakeholder_3}} (e.g., system operators) | {{relationship_3}} | {{harms_3}} | {{outcomes_3}} |
| {{stakeholder_4}} (e.g., regulators) | {{relationship_4}} | {{harms_4}} | {{outcomes_4}} |
| {{stakeholder_5}} (e.g., society at large) | {{relationship_5}} | {{harms_5}} | {{outcomes_5}} |

### Phase 2: AI Risk Identification

**2.1 Technical AI Risks**

| Risk ID | Risk Description | Manifestation | Known Incidents / Research | Detection Method |
|---------|-----------------|---------------|---------------------------|-----------------|
| AI-T-001 | **Adversarial manipulation** -- crafted inputs cause misclassification or unsafe output | {{adv_manifestation}} | {{adv_known}} | {{adv_detection}} |
| AI-T-002 | **Data poisoning** -- training data contamination degrades model behavior | {{poison_manifestation}} | {{poison_known}} | {{poison_detection}} |
| AI-T-003 | **Model inversion / extraction** -- attacker reconstructs training data or model weights | {{inversion_manifestation}} | {{inversion_known}} | {{inversion_detection}} |
| AI-T-004 | **Out-of-distribution inputs** -- model receives data statistically different from training set | {{ood_manifestation}} | {{ood_known}} | {{ood_detection}} |
| AI-T-005 | **Concept drift** -- statistical properties of target variable change over time | {{drift_manifestation}} | {{drift_known}} | {{drift_detection}} |
| AI-T-006 | **Model collapse** -- recursive training on synthetic data degrades model quality | {{collapse_manifestation}} | {{collapse_known}} | {{collapse_detection}} |
| AI-T-007 | **Jailbreaking / prompt injection** -- adversarial prompts bypass safety guardrails | {jailbreak_manifestation} | {{jailbreak_known}} | {{jailbreak_detection}} |
| AI-T-008 | **Hallucination / factual error** -- model generates plausible but incorrect statements | {{hallucination_manifestation}} | {{hallucination_known}} | {{hallucination_detection}} |

**2.2 Operational AI Risks**

| Risk ID | Risk Description | Manifestation | Dependencies |
|---------|-----------------|---------------|--------------|
| AI-O-001 | **Vendor/model dependency** -- third-party AI provider changes API, discontinues model, or modifies behavior | {{vendor_manifestation}} | {{vendor_dependencies}} |
| AI-O-002 | **Scalability failure** -- inference cost or latency grows non-linearly with adoption | {{scalability_manifestation}} | {{scalability_dependencies}} |
| AI-O-003 | **Monitoring debt** -- insufficient observability into model behavior in production | {{monitoring_manifestation}} | {{monitoring_dependencies}} |
| AI-O-004 | **Version mismatch** -- development model differs from deployed model (reproducibility gap) | {{version_manifestation}} | {{version_dependencies}} |
| AI-O-005 | **Licensing / IP risk** -- training data, model weights, or outputs violate copyright or license terms | {{ip_manifestation}} | {{ip_dependencies}} |

**2.3 Ethical & Societal AI Risks**

| Risk ID | Risk Description | Manifestation | Affected Stakeholders |
|---------|-----------------|---------------|----------------------|
| AI-E-001 | **Algorithmic bias** -- systematic disparities in outcomes across protected groups | {{bias_manifestation}} | {{bias_stakeholders}} |
| AI-E-002 | **Fairness / equity** -- model produces less favorable outcomes for marginalized groups | {{fairness_manifestation}} | {{fairness_stakeholders}} |
| AI-E-003 | **Explainability deficit** -- decisions cannot be understood or contested by affected individuals | {{explainability_manifestation}} | {{explainability_stakeholders}} |
| AI-E-004 | **Autonomy erosion** -- over-reliance on AI reduces human judgment and skill | {{autonomy_manifestation}} | {{autonomy_stakeholders}} |
| AI-E-005 | **Disinformation / manipulation** -- AI-generated content misleads users or manipulates behavior | {{disinfo_manifestation}} | {{disinfo_stakeholders}} |
| AI-E-006 | **Privacy / surveillance** -- model memorizes personal data or enables surveillance | {{privacy_manifestation}} | {{privacy_stakeholders}} |
| AI-E-007 | **Environmental impact** -- compute resources consumed by training and inference | {{environmental_manifestation}} | {{environmental_stakeholders}} |

**2.4 Compliance & Regulatory AI Risks**

| Risk ID | Risk Description | Applicable Regulation | Potential Consequence |
|---------|-----------------|----------------------|---------------------|
| AI-C-001 | **EU AI Act non-compliance** -- high-risk system fails to meet conformity requirements | EU AI Act (Art. 9-15, 43) | {{eu_penalty}} (up to 7% global turnover or €35M) |
| AI-C-002 | **GDPR violation** -- unlawful processing of personal data in AI training or inference | GDPR Arts. 5, 6, 22, 35 | {{gdpr_penalty}} (up to 4% global turnover or €20M) |
| AI-C-003 | **Sectoral regulatory risk** -- FDA, SEC, FCA, or other regulator AI guidance not met | {{sectoral_regulation}} | {{sectoral_penalty}} |
| AI-C-004 | **Algorithmic accountability** -- inability to provide required documentation or audit trail | {{accountability_law}} (local/state/federal) | {{accountability_penalty}} |
| AI-C-005 | **Export control / sanctions** -- AI model or weights restricted under {{export_regime}} | {{export_control_law}} (EAR / ITAR) | {{export_penalty}} |

### Phase 3: AI Risk Analysis

**3.1 Likelihood Criteria (AI-Specific)**

| Score | Description | Example |
|-------|-------------|---------|
| 5 -- Almost Certain | Occurs daily/weekly in production; well-documented failure mode | {{example_5}} |
| 4 -- Likely | Occurs monthly; known vulnerabilities exist | {{example_4}} |
| 3 -- Possible | Occurs quarterly; mitigation exists but is imperfect | {{example_3}} |
| 2 -- Unlikely | Occurs less than annually; requires specific conditions | {{example_2}} |
| 1 -- Rare | Theoretical only; no known incidents | {{example_1}} |

**3.2 Impact Criteria (AI-Specific)**

| Score | Description | Example |
|-------|-------------|---------|
| 5 -- Catastrophic | Loss of life, systemic financial crisis, mass privacy violation, existential AI risk | {{impact_5}} |
| 4 -- Critical | Serious physical harm, large-scale financial loss (>$10M), class-action litigation, major regulatory penalty | {{impact_4}} |
| 3 -- Moderate | Significant reputational damage, regulatory investigation, moderate financial loss ($1M-$10M) | {{impact_3}} |
| 2 -- Minor | Individual customer harm, minor regulatory fine, limited reputational impact | {{impact_2}} |
| 1 -- Insignificant | No material harm, cosmetic defect, easily corrected | {{impact_1}} |

**3.3 Risk Scoring Matrix (5×5)**

| Likelihood \ Impact | 1 -- Insignificant | 2 -- Minor | 3 -- Moderate | 4 -- Critical | 5 -- Catastrophic |
|-------------------|-------------------|-----------|--------------|--------------|------------------|
| 5 -- Almost Certain | Medium (5) | High (10) | Critical (15) | Critical (20) | Extreme (25) |
| 4 -- Likely | Medium (4) | High (8) | High (12) | Critical (16) | Extreme (20) |
| 3 -- Possible | Low (3) | Medium (6) | High (9) | High (12) | Critical (15) |
| 2 -- Unlikely | Low (2) | Low (4) | Medium (6) | Medium (8) | High (10) |
| 1 -- Rare | Low (1) | Low (2) | Low (3) | Medium (4) | Medium (5) |

**Risk Tiers:**
- **Extreme (15-25):** Immediate action required; system may need to be paused or decommissioned
- **Critical (12-20):** Mitigation plan required before deployment or continued operation
- **High (8-12):** Formal risk treatment required; senior management approval
- **Medium (3-8):** Documented acceptance with monitoring controls
- **Low (1-3):** Accepted through standard procedures

**3.4 Risk Register -- Inherent Risk Assessment**

| Risk ID | Risk Description | L | I | Inherent Score | Risk Tier | Rationale |
|---------|-----------------|---|---|----------------|-----------|-----------|
| AI-T-001 | Adversarial manipulation | {{l_1}} | {{i_1}} | {{score_1}} | {{tier_1}} | {{rationale_1}} |
| AI-T-004 | Out-of-distribution inputs | {{l_4}} | {{i_4}} | {{score_4}} | {{tier_4}} | {{rationale_4}} |
| AI-T-008 | Hallucination / factual error | {{l_8}} | {{i_8}} | {{score_8}} | {{tier_8}} | {{rationale_8}} |
| AI-E-001 | Algorithmic bias | {{l_bias}} | {{i_bias}} | {{score_bias}} | {{tier_bias}} | {{rationale_bias}} |
| AI-C-001 | EU AI Act non-compliance | {{l_eu}} | {{i_eu}} | {{score_eu}} | {{tier_eu}} | {{rationale_eu}} |

### Phase 4: AI Risk Evaluation & Treatment

**4.1 Risk Appetite Statement**

```
{{org_name}}'s AI Risk Appetite:
- Extreme risks: Zero tolerance -- must be avoided or redesigned
- Critical risks: Not accepted without board-level approval and comprehensive mitigation
- High risks: Acceptable only with documented treatment plan and monitoring
- Medium risks: Acceptable with standard controls and periodic review
- Low risks: Accepted through normal operations

Maximum acceptable residual risk score: {{max_acceptable_score}}
```

**4.2 Risk Treatment Plan**

| Risk ID | Inherent Score | Treatment Option | Controls / Mitigations | Owner | Residual L | Residual I | Residual Score | Acceptable? |
|---------|---------------|-----------------|----------------------|-------|-----------|-----------|---------------|-------------|
| AI-T-001 | {{inherent_1}} | Modify | {{mitigation_1}}: adversarial training, input sanitization, rate limiting | {{owner_1}} | {{res_l_1}} | {{res_i_1}} | {{res_score_1}} | {{acceptable_1}} |
| AI-T-008 | {{inherent_8}} | Modify + Transfer | {{mitigation_8}}: RAG grounding, human-in-loop verification, output factuality scoring, insurance | {{owner_8}} | {{res_l_8}} | {{res_i_8}} | {{res_score_8}} | {{acceptable_8}} |
| AI-E-001 | {{inherent_bias}} | Modify | {{mitigation_bias}}: fairness-aware training, bias auditing, differential privacy | {{owner_bias}} | {{res_l_bias}} | {{res_i_bias}} | {{res_score_bias}} | {{acceptable_bias}} |

**Treatment Options:**
| Option | Application in AI Context |
|--------|--------------------------|
| **Avoid** | Discontinue the AI use case; choose a different technical approach |
| **Modify** | Implement technical, procedural, or governance controls to reduce risk |
| **Transfer** | Shift risk via insurance (AI liability policies), contracts, third-party indemnification |
| **Retain** | Accept residual risk with documented rationale and monitoring commitments |

### Phase 5: Continuous AI Risk Monitoring

**5.1 AI Risk Indicators (ARIs)**

| Risk ID | Key Risk Indicator | Threshold | Escalation | Monitoring Frequency | Owner | Current Status |
|---------|-------------------|-----------|------------|---------------------|-------|---------------|
| AI-T-004 | OOD detection rate / input distribution drift (PSI) | PSI > 0.1 triggers review | Alert → Tier 2 | Real-time batch (hourly) | {{ari_1_owner}} | {{ari_1_status}} |
| AI-T-008 | Factuality score on benchmark set | <90% triggers investigation | Alert → Tier 2 | Daily | {{ari_2_owner}} | {{ari_2_status}} |
| AI-E-001 | Demographic parity ratio across groups | <0.8 or >1.25 triggers review | Alert → Tier 3 | Weekly | {{ari_3_owner}} | {{ari_3_status}} |
| AI-T-001 | Successful adversarial attempt rate | >0.1% triggers containment | Pager → Tier 1 | Real-time | {{ari_4_owner}} | {{ari_4_status}} |
| AI-O-005 | License/IP compliance review findings | Any non-compliance | Alert → Tier 3 | Quarterly | {{ari_5_owner}} | {{ari_5_status}} |

**5.2 AI Incident Response Triggers**

| Severity | Definition | Response Time | Notification |
|----------|------------|--------------|-------------|
| **AI-Sev1** | AI causes physical harm, CUI/exfiltration, systemic bias against protected class | 15 min | CISO, GC, Board |
| **AI-Sev2** | AI produces materially incorrect outputs leading to financial loss, privacy violation | 1 hour | AI Risk Owner, Privacy |
| **AI-Sev3** | AI degrades in performance, drift detected, user dissatisfaction | 4 hours | AI System Owner |
| **AI-Sev4** | Minor edge case failure, non-material bias, cosmetic defects | 24 hours | Dev team |

### Phase 6: AI Risk Reporting & Transparency

**6.1 AI Risk Report (Executive Summary)**

```
## AI Risk Report: {{ai_system_name}}
**Period:** {{report_period}}
**Overall AI Risk Posture:** {{overall_risk_posture}} (Critical / Elevated / Acceptable / Low)

### Risk Summary
- Total risks identified: {{total_risks}}
- Extreme: {{extreme_count}} (trend: {{extreme_trend}})
- Critical: {{critical_count}} (trend: {{critical_trend}})
- High: {{high_count}} (trend: {{high_trend}})
- Medium: {{medium_count}} (trend: {{medium_trend}})
- Low: {{low_count}} (trend: {{low_trend}})

### Top 3 AI Risks
1. {{top_risk_1}} -- residual score {{top_score_1}} -- status: {{top_status_1}}
2. {{top_risk_2}} -- residual score {{top_score_2}} -- status: {{top_status_2}}
3. {{top_risk_3}} -- residual score {{top_score_3}} -- status: {{top_status_3}}

### Open Actions
- Overdue: {{overdue_actions}}
- In Progress: {{in_progress_actions}}
- On Track: {{on_track_actions}}

### Recommendations
1. {{recommendation_1}}
2. {{recommendation_2}}
3. {{recommendation_3}}
```

**6.2 Transparency Reporting (per ISO 42002 communication requirements)**

| Element | Content |
|---------|---------|
| System purpose and intended use | {{purpose_statement}} |
| Known limitations and failure modes | {{limitations_statement}} |
| Risk assessment summary | {{risk_summary_statement}} |
| Human oversight mechanisms | {{human_oversight_statement}} |
| Performance metrics and accuracy | {{performance_statement}} |
| Data governance summary | {{data_governance_statement}} |
| Bias and fairness evaluation | {{bias_statement}} |
| Contact for concerns / complaints | {{contact_information}} |

## output_format

Present as a complete AI risk assessment report:
1. **Executive Summary** -- risk posture, top risks, recommended actions
2. **System Characterization** -- operational domain, stakeholders, autonomy level
3. **Risk Identification** -- full risk register across technical, operational, ethical, and compliance dimensions
4. **Risk Analysis** -- likelihood and impact criteria, 5×5 scoring matrix, inherent risk scoring
5. **Risk Evaluation** -- against organizational risk appetite
6. **Risk Treatment Plan** -- controls, residual risk, acceptance decisions
7. **Continuous Monitoring** -- AI risk indicators, thresholds, escalation procedures
8. **Incident Response** -- AI-specific severity levels and response times
9. **Reporting** -- executive dashboard, transparency report
10. **Review Cycle** -- reassessment cadence (triggered by: model update, data change, regulatory change, incident, or scheduled)

## constraints

- AI risk assessment is NOT a one-time activity -- it must be continuously monitored and periodically reassessed
- Inherent risk is assessed WITHOUT controls; residual risk is assessed WITH controls in place
- Fairness evaluation must address intersectional bias (multiple protected attributes combined)
- For generative AI, hallucination risk must be explicitly assessed and mitigated (RAG, grounding, output validation)
- Third-party AI risk includes supply chain risk -- vendor AI model updates can change risk profile overnight
- Human oversight must be meaningful -- a human "rubber-stamping" AI decisions does not reduce risk
- AI risk appetite must be explicitly defined by the board; defaulting to "no appetite" is not adequate
- Transparency reporting requirements vary by jurisdiction; EU AI Act has specific documentation obligations
- Model cards and system cards should be updated with each material model change
- The AI risk register should integrate with enterprise risk management (ERM), not exist in isolation
- AI incidents affecting fundamental rights must be reported to relevant regulatory bodies per applicable law
