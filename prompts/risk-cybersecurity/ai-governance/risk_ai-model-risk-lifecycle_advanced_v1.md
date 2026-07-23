---
title: AI Model Risk Management Lifecycle
service_line: risk-cybersecurity
subcategory: ai-governance
use_case_type: model-risk-management
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: risk-sme
reviewer: risk-sme
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["ai-governance", "model-risk", "model-validation", "model-monitoring", "drift-detection", "bias-monitoring", "model-lifecycle", "llm-governance", "foundation-models", "claude"]
test_suites: []
---

## system_prompt

I've built model risk management programs for organizations running hundreds of AI/ML models in production -- from traditional gradient-boosted trees to large language models and agentic workflows. The principles of model risk management (inventory, tiering, validation, monitoring, retirement) apply across all model types, but the execution is radically different for generative AI.

Here's the hard truth: most model risk frameworks were written for deterministic ML models (credit scoring, fraud detection) where you can measure accuracy against ground truth. LLMs break that model. You can't compute an F1 score for a chatbot response. You can't validate a prompt chain the same way you validate a regression model. And when a foundation model provider updates their model, your risk profile changes overnight.

The key lessons I've learned:

1. **Tier everything** -- not all models need the same validation rigor. A customer-facing credit decision model needs full independent validation. An internal code assistant needs basic safety testing. Classify early, classify often.
2. **Generative AI requires new playbooks** -- traditional model validation (backtesting, benchmarking, sensitivity analysis) still applies, but you need to add prompt testing, guardrail evaluation, hallucination rates, and adversarial robustness.
3. **Monitoring is not optional** -- AI models drift faster than traditional models, especially LLMs. input distribution shifts, concept drift, bias emergence, and provider-side changes all require continuous monitoring.
4. **Vendor model governance is the hardest problem** -- you can't validate a model you didn't build. You need model cards, system cards, transparency reports, and contractual commitments from providers.
5. **Retirement is as important as deployment** -- models that shouldn't be used anymore need to be decommissioned properly. Stale models in production are a liability.

## context

**Organization:**
- Name: {{organization_name}}
- Total AI Models in Production: {{total_models}}
- Model Types: {{model_types}} (Traditional ML / LLM / Computer Vision / NLP / Agentic / Ensemble)
- Highest-Risk Model Tier: {{highest_tier}} (Tier 1-4 per internal classification)
- Foundation Model Providers: {{fm_providers}} (OpenAI / Anthropic / Google / Meta / Open Source / Multiple)
- Model Risk Framework Maturity: {{mrf_maturity}} (None / SR 11-7 aligned / Internal only / Mature)
- Existing Model Governance Tools: {{model_governance_tools}} (ModelDB / MLflow / Custom / None)
- Model Validation Team: {{validation_team}} (Internal independent validation / External / No dedicated team)
- Regulatory Oversight: {{regulatory_oversight}} (FRB / OCC / SEC / None / Multiple)

## user_prompt

Design an AI model risk management program for {{organization_name}} across the full model lifecycle.

### Phase 1: Model Inventory & Tiering

| Model ID | Name | Type | Provider | Risk Tier | Criticality | Status | Owner |
|---|---|---|---|---|---|---|---|
| {{model_id_1}} | {{model_name_1}} | {{model_type_1}} | {{model_provider_1}} | {{model_tier_1}} | {{model_criticality_1}} | {{model_status_1}} | {{model_owner_1}} |
| {{model_id_2}} | {{model_name_2}} | {{model_type_2}} | {{model_provider_2}} | {{model_tier_2}} | {{model_criticality_2}} | {{model_status_2}} | {{model_owner_2}} |

**Tiering Criteria:**

| Tier | Criteria | Validation Requirement | Monitoring Requirement | Approval Authority |
|---|---|---|---|---|
| **Tier 1: Low Impact** | Internal use only, no consequential decisions, low autonomy, no sensitive data | Self-validation checklist | Basic performance monitoring | Model Owner |
| **Tier 2: Moderate Impact** | Internal or external use, limited autonomy, non-sensitive PII | Peer review + standardized test suite | Performance + drift monitoring | Model Risk Lead |
| **Tier 3: High Impact** | Customer-facing, consequential decisions, sensitive data, significant autonomy | Independent validation + adversarial testing | Full monitoring (drift, bias, accuracy, safety) | Model Risk Committee |
| **Tier 4: Critical Impact** | Regulatory decisions, health/safety, vulnerable populations, systemic risk | Full independent validation + external review + regulatory coordination | Continuous monitoring + automated rollback | AI Governance Council + Regulator |

### Phase 2: Traditional ML Model Validation

For Tier 3-4 traditional ML models (classification, regression, recommendation):

| Validation Area | Methodology | Criteria | {{model_1}} Result | {{model_2}} Result |
|---|---|---|---|---|
| **Data Quality** | Completeness, accuracy, consistency, timeliness, representativeness | {{data_quality_criteria}} | {{data_quality_result_1}} | {{data_quality_result_2}} |
| **Feature Engineering** | Feature relevance, stability, leakage check, missing value treatment | {{feature_criteria}} | {{feature_result_1}} | {{feature_result_2}} |
| **Model Development** | Algorithm selection rationale, hyperparameter tuning, training/validation split | {{development_criteria}} | {{development_result_1}} | {{development_result_2}} |
| **Backtesting** | Historical performance simulation, walk-forward analysis | {{backtesting_criteria}} | {{backtesting_result_1}} | {{backtesting_result_2}} |
| **Benchmarking** | Performance vs. baseline, vs. alternative models, vs. industry benchmarks | {{benchmarking_criteria}} | {{benchmarking_result_1}} | {{benchmarking_result_2}} |
| **Sensitivity Analysis** | Input perturbation, boundary testing, extreme value testing | {{sensitivity_criteria}} | {{sensitivity_result_1}} | {{sensitivity_result_2}} |
| **Stability Testing** | Prediction consistency across similar inputs, temporal stability | {{stability_criteria}} | {{stability_result_1}} | {{stability_result_2}} |
| **Explainability** | SHAP, LIME, partial dependence plots, feature importance | {{explainability_criteria}} | {{explainability_result_1}} | {{explainability_result_2}} |
| **Fairness / Bias** | Disparate impact, equal opportunity, demographic parity across {{protected_attributes}} | {{fairness_criteria}} | {{fairness_result_1}} | {{fairness_result_2}} |

### Phase 3: Generative AI & LLM Validation

For LLM-based systems (Tier 2-4):

| Validation Area | Methodology | {{llm_1}} Result | {{llm_2}} Result | Notes |
|---|---|---|---|---|
| **Model Selection** | Provider selection rationale, model version, capability assessment | {{model_selection_result_1}} | {{model_selection_result_2}} | {{model_selection_notes}} |
| **Prompt Testing** | Prompt robustness, jailbreak resistance, prompt injection testing | {{prompt_testing_result_1}} | {{prompt_testing_result_2}} | Use automated red-teaming tools |
| **Guardrail Evaluation** | Content filtering accuracy, false positive/negative rates, policy adherence | {{guardrail_result_1}} | {{guardrail_result_2}} | Test for both under- and over-filtering |
| **Hallucination Rate** | Factual accuracy on {{eval_dataset}}, citation accuracy, refusal rate | {{hallucination_result_1}} | {{hallucination_result_2}} | Domain-specific evaluation dataset required |
| **Context Handling** | Context window utilization, retrieval accuracy (RAG), attention to context | {{context_result_1}} | {{context_result_2}} | Measure context adherence, not just generation |
| **Safety Testing** | Toxic output, bias amplification, stereotype reinforcement, PII leakage | {{safety_result_1}} | {{safety_result_2}} | Intersectional bias testing across {{demographic_dimensions}} |
| **Output Consistency** | Response variation across identical inputs, temperature impact, determinism | {{consistency_result_1}} | {{consistency_result_2}} | Acceptable variation depends on use case |
| **Latency & Cost** | Time-to-first-token, end-to-end latency, tokens per request, cost per inference | {{latency_result_1}} | {{latency_result_2}} | Must meet {{latency_sla}} SLA |
| **Agentic Safety** | Tool call accuracy, multi-step reasoning verification, error recovery, sandboxing | {{agentic_safety_result_1}} | {{agentic_safety_result_2}} | For agentic workflows with tool access |

### Phase 4: Foundation Model & Vendor AI Governance

| Control Area | Requirement | {{vendor_1}} | {{vendor_2}} | {{vendor_3}} |
|---|---|---|---|---|
| **Model Transparency** | Model card, system card, technical report provided | {{vendor_1_transparency}} | {{vendor_2_transparency}} | {{vendor_3_transparency}} |
| **Safety Testing** | Provider red-teaming results shared, safety benchmarks published | {{vendor_1_safety}} | {{vendor_2_safety}} | {{vendor_3_safety}} |
| **Data Governance** | Training data provenance, copyright compliance, consent documentation | {{vendor_1_data}} | {{vendor_2_data}} | {{vendor_3_data}} |
| **Change Management** | Model update notification SLA, version pinning, change impact assessment | {{vendor_1_changes}} | {{vendor_2_changes}} | {{vendor_3_changes}} |
| **Security** | Penetration testing results, SOC 2 / ISO 27001 certification, FedRAMP | {{vendor_1_security}} | {{vendor_2_security}} | {{vendor_3_security}} |
| **SLAs** | Uptime, latency, accuracy SLAs; credits for non-performance | {{vendor_1_sla}} | {{vendor_2_sla}} | {{vendor_3_sla}} |
| **Exit Provisions** | Data portability, model extraction rights, migration assistance, transition period | {{vendor_1_exit}} | {{vendor_2_exit}} | {{vendor_3_exit}} |
| **Subprocessor Disclosure** | Sub-processors used for model training, hosting, fine-tuning | {{vendor_1_subprocessors}} | {{vendor_2_subprocessors}} | {{vendor_3_subprocessors}} |

### Phase 5: Model Monitoring

| Monitoring Dimension | Metric | Threshold | {{model_1}} Status | {{model_2}} Status | Alert | Response |
|---|---|---|---|---|---|---|
| **Data Drift** | Population Stability Index / KL Divergence | PSI > {{psi_threshold}} | {{model_1_data_drift}} | {{model_2_data_drift}} | {{data_drift_alert}} | {{data_drift_response}} |
| **Concept Drift** | Model performance over time (accuracy, F1, AUC) | > {{concept_drift_threshold}}% degradation | {{model_1_concept_drift}} | {{model_2_concept_drift}} | {{concept_drift_alert}} | {{concept_drift_response}} |
| **Prediction Drift** | Output distribution shift | > {{prediction_drift_threshold}}% | {{model_1_prediction_drift}} | {{model_2_prediction_drift}} | {{prediction_drift_alert}} | {{prediction_drift_response}} |
| **Bias Drift** | Fairness metric change over time (demographic parity, equal opportunity) | > {{bias_drift_threshold}} change | {{model_1_bias_drift}} | {{model_2_bias_drift}} | {{bias_drift_alert}} | {{bias_drift_response}} |
| **Hallucination Rate** | Factual accuracy (LLM-specific) | > {{hallucination_threshold}}% | {{model_1_hallucination}} | {{model_2_hallucination}} | {{hallucination_alert}} | {{hallucination_response}} |
| **Safety Violations** | Policy violation rate per {{violation_period}} | > 0 critical, > {{non_critical_threshold}} minor | {{model_1_safety}} | {{model_2_safety}} | {{safety_alert}} | {{safety_response}} |
| **Latency** | P95 inference time | > {{latency_threshold}} ms | {{model_1_latency}} | {{model_2_latency}} | {{latency_alert}} | {{latency_response}} |
| **Throughput** | Requests per second | < {{throughput_threshold}} | {{model_1_throughput}} | {{model_2_throughput}} | {{throughput_alert}} | {{throughput_response}} |
| **Provider Change** | Foundation model version change detected | Any unpinned change | {{model_1_provider_change}} | {{model_2_provider_change}} | {{provider_change_alert}} | {{provider_change_response}} |

### Phase 6: Model Retirement

| Model ID | Retirement Decision | Rationale | Data Retention | Decommission Steps | User Migration | Completion Date |
|---|---|---|---|---|---|---|
| {{retire_model_id_1}} | {{retire_decision_1}} (Decommission / Replace / Archive) | {{retire_rationale_1}} | {{retire_data_retention_1}} | {{retire_steps_1}} | {{retire_migration_1}} | {{retire_date_1}} |

### Phase 7: Model Risk Governance

| Governance Element | Requirement | Implementation |
|---|---|---|
| Model Risk Policy | Documented policy defining model risk appetite, validation standards, monitoring requirements | {{model_risk_policy_status}} |
| Model Inventory | Centralized, up-to-date registry of all AI/ML models with tiering, owner, status | {{model_inventory_status}} |
| Validation Reports | Independent validation reports for all Tier 3-4 models, peer reviews for Tier 2 | {{validation_report_status}} |
| Monitoring Dashboards | Real-time monitoring dashboards for all production models with alerting | {{monitoring_dashboard_status}} |
| Model Risk Committee | Cross-functional committee reviewing material model risk issues | {{model_risk_committee_status}} |
| Model Risk Register | Consolidated register of all model risks with inherent/residual scores, treatment plans | {{model_risk_register_status}} |
| Third-Party Model Assessments | Vendor model risk assessments completed for all third-party/foundation models | {{third_party_assessment_status}} |
| Incident Response | AI model-specific incident response procedure (drift, bias, safety, availability) | {{incident_response_status}} |

## output_format

Present as an AI Model Risk Management Program Framework:

1. **Executive Summary** -- model portfolio overview, risk posture, critical findings, resource requirements
2. **Model Inventory & Tiering** -- complete registry of all AI/ML models with risk classification
3. **Traditional ML Validation Methodology** -- validation areas, acceptance criteria, results per model
4. **Generative AI / LLM Validation Methodology** -- prompt testing, guardrail evaluation, hallucination assessment, safety testing
5. **Foundation Model & Vendor Governance** -- provider assessment matrix, contractual safeguards, monitoring
6. **Model Monitoring Framework** -- dimensions, metrics, thresholds, alerts, response procedures
7. **Model Risk Governance** -- policy, committee, inventory, validation, monitoring, risk register
8. **Model Incident Response Procedure** -- severity classification, escalation path, remediation, root cause analysis
9. **Model Retirement Procedure** -- decommissioning checklist, data retention, user migration, archival
10. **Resource Model & Roadmap** -- staffing, tooling, budget for the model risk management function

## constraints

- Model risk tiering must be reviewed at least quarterly or after any material change to the model, its data, or its use context
- Independent validation for Tier 3-4 models must be performed by personnel independent of model development -- the same team should not both build and validate
- LLM validation requires domain-specific evaluation datasets -- general-purpose benchmarks (MMLU, HellaSwag) are not sufficient for production validation
- Foundation model provider changes (version updates, model deprecation) require re-validation -- pinned versions are strongly recommended for production
- Bias testing must cover intersectional dimensions (race + gender + age), not single-attribute analysis
- Model monitoring must detect provider-side changes automatically -- manual checks are not sufficient for critical models
- Hallucination rate acceptance thresholds must be defined per use case -- a creative writing tool has a higher tolerance than a medical diagnosis assistant
- Agentic AI systems with tool access require additional safety validation -- tool call accuracy, sandboxing, and error recovery must be verified
- Model retirement does not mean data destruction -- training data, validation records, and monitoring logs must be retained per regulatory requirements
- Model risk management applies to internally developed models, vendor models, and fine-tuned foundation models equally
- Monitoring alerts must have defined response procedures with SLA targets -- alerts without response plans are noise, not oversight
- Model cards and system cards should be published for all Tier 2+ models and available to downstream users and regulators
