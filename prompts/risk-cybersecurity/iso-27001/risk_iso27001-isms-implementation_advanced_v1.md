---
title: ISO 27001 ISMS Implementation & Certification
service_line: risk-cybersecurity
subcategory: iso-27001
use_case_type: implementation
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: risk-sme
reviewer: security-lead
created_date: 2026-06-05
last_modified: 2026-07-15
tags: ["iso-27001", "isms", "information-security", "annex-a", "risk-management", "certification", "claude"]
test_suites: ["testing/test-cases/risk-cybersecurity/iso-27001-isms.json"]
---

## system_prompt

I've led 50+ ISMS implementations across financial services, healthcare, tech, manufacturing, and professional services. ISO 27001 is straightforward as a standard but hard to implement well. The certification audit is just a moment in time -- the real work is building an ISMS that actually changes how people handle information security day-to-day.

Standards I work with regularly:
- ISO/IEC 27001:2022 (requirements)
- ISO/IEC 27002:2022 (code of practice with Annex A controls)
- ISO 27003 (implementation guidance)
- ISO 27004 (performance metrics and monitoring)
- ISO 27005 (risk management)
- ISO 19011 (audit management)
- Accreditation body requirements (ANAB, UKAS)
- Integration with ISO 9001, ISO 22301

I follow the PDCA cycle, but I don't treat it as a checklist:
1. **Plan** -- ISMS policy, objectives, risk assessment, statement of applicability
2. **Do** -- implement the controls and operate the ISMS
3. **Check** -- monitor, measure, internal audit, management review
4. **Act** -- corrective actions, preventive actions, continual improvement

## context

**Organization Profile:**
- Name: {{org_name}}
- Industry: {{industry}}
- Employees: {{employee_count}}
- ISMS Scope: {{isms_scope}} (organization / specific business unit / specific location / specific service)
- Current Security Maturity: {{security_maturity}} (none / ad-hoc / defined / managed / optimized)
- Existing Certifications: {{existing_certifications}} (ISO 9001 / SOC 2 / PCI DSS / None)
- Target Certification Date: {{target_certification_date}}
- Registration Body (CAB): {{cab}} (preferred certification body if known)
- Number of Sites: {{site_count}} (in-scope)
- In-Scope Systems: {{in_scope_systems}} (ERP, email, file servers, cloud services, etc.)

**Risk Context:**
- Key Assets: {{key_assets}}
- Threat Landscape: {{threat_landscape}} (cybercrime / insider / supply chain / nation-state / regulatory)
- Compliance Obligations: {{compliance_obligations}} (GDPR / HIPAA / PCI / CMMC / SOX)
- Previous Risk Assessment: {{previous_risk_assessment}} (none / informal / formal / certified)

## user_prompt

Guide me through implementing an ISO 27001-compliant ISMS for {{org_name}}.

### Phase 1: ISMS Foundation (Plan)

**1.1 ISMS Policy**

Draft the top-level ISMS policy statement:

```markdown
# Information Security Policy

{{org_name}} is committed to protecting the confidentiality, integrity, and availability of its information assets.

## Policy Objectives
1. Protect information assets against threats, both internal and external
2. Ensure compliance with legal, regulatory, and contractual obligations
3. Maintain the trust of stakeholders and customers
4. Enable secure business operations and digital transformation
5. Achieve and maintain ISO 27001 certification by {{target_certification_date}}

## Policy Principles
- Risk-based approach to security decision-making
- Continuous improvement of the ISMS
- Clear accountability and ownership of information assets
- Security awareness and competence for all personnel
- Integration of security into business processes

## Scope
This policy applies to {{isms_scope}}.

[Policy Owner]: {{policy_owner}}
[Review Frequency]: Annually
[Approved By]: {{approving_authority}}
[Date]: {{policy_date}}
```

**1.2 ISMS Scope Definition (Clause 4.3)**

Document the ISMS scope using these dimensions:

| Dimension | In Scope | Out of Scope | Rationale |
|-----------|----------|-------------|-----------|
| **Organizational** | {{org_scope_detail}} | {{org_out_of_scope}} | {{org_rationale}} |
| **Physical / Location** | {{location_scope}} | {{location_out_of_scope}} | {{location_rationale}} |
| **Technical / System** | {{technical_scope}} | {{technical_out_of_scope}} | {{technical_rationale}} |
| **Process / Service** | {{process_scope}} | {{process_out_of_scope}} | {{process_rationale}} |

**1.3 Information Asset Inventory (Clause 5.9 / 5.10)**

| Asset ID | Asset Name | Owner | Classification | Location/System | CIA Rating | Backup Frequency | Retention |
|----------|------------|-------|---------------|-----------------|------------|-----------------|-----------|
| A-001 | {{asset_name}} | {{owner}} | {{classification}} | {{location}} | {{cia}} | {{backup_freq}} | {{retention}} |

**Asset Classification Scheme:**
| Classification | Definition | Examples |
|---------------|------------|---------|
| Public | No harm if disclosed | Marketing materials, published financials |
| Internal | Limited harm if disclosed | Internal policies, org charts, non-public procedures |
| Confidential | Moderate harm if disclosed | PII, client data, trade secrets, financial data |
| Restricted | Severe harm if disclosed | PHI, classified IP, critical infrastructure configs |

**1.4 Risk Assessment and Treatment Methodology (Clause 6.1)**

**Risk Assessment Approach:** {{risk_approach}} (Qualitative / Quantitative / Semi-Quantitative)

**Risk Criteria:**
| Likelihood | Definition | Score |
|------------|-----------|-------|
| Very Low | <1% probability per year | 1 |
| Low | 1-10% probability per year | 2 |
| Medium | 10-25% probability per year | 3 |
| High | 25-75% probability per year | 4 |
| Very High | >75% probability per year | 5 |

| Impact | Definition | Score |
|--------|-----------|-------|
| Negligible | <$1k loss, no reputational damage | 1 |
| Minor | $1k-$10k loss, limited local reputational damage | 2 |
| Moderate | $10k-$100k loss, industry-specific reputational damage | 3 |
| Major | $100k-$1M loss, national reputational damage | 4 |
| Critical | >$1M loss, existential threat to organization | 5 |

**Risk Appetite:** Maximum acceptable risk level: {{risk_appetite_level}} (e.g., score of 12/25)

**Risk Treatment Options:**
| Option | Description | When to Use |
|--------|-------------|-------------|
| **Modify** | Implement controls to reduce risk | Risk exceeds appetite, control is feasible |
| **Retain** | Accept risk with documented rationale | Risk within appetite, or control is not cost-effective |
| **Avoid** | Discontinue the activity | Risk unacceptable and cannot be effectively mitigated |
| **Transfer** | Share risk with third party (insurance, contract) | Partial risk transfer is possible |

### Phase 2: ISMS Implementation (Do)

**2.1 Annex A Control Implementation (A.5-A.8, 93 controls in 4 themes)**

Map and implement controls from ISO 27002:2022:

**Theme 1: Organizational Controls (37 controls)**

| Control ID | Control Name | Implementation Status | Evidence | Owner |
|-----------|--------------|---------------------|----------|-------|
| 5.1 | Policies for information security | {{c_5_1_status}} | {{c_5_1_evidence}} | {{c_5_1_owner}} |
| 5.2 | Information security roles and responsibilities | {{c_5_2_status}} | {{c_5_2_evidence}} | {{c_5_2_owner}} |
| 5.3 | Segregation of duties | {{c_5_3_status}} | {{c_5_3_evidence}} | {{c_5_3_owner}} |
| 5.7 | Threat intelligence | {{c_5_7_status}} | {{c_5_7_evidence}} | {{c_5_7_owner}} |
| 5.10 | Acceptable use of information | {{c_5_10_status}} | {{c_5_10_evidence}} | {{c_5_10_owner}} |
| 5.14 | Information transfer (NDAs, data sharing) | {{c_5_14_status}} | {{c_5_14_evidence}} | {{c_5_14_owner}} |
| 5.23 | Information security for cloud services | {{c_5_23_status}} | {{c_5_23_evidence}} | {{c_5_23_owner}} |
| 5.24 | ICT readiness for business continuity | {{c_5_24_status}} | {{c_5_24_evidence}} | {{c_5_24_owner}} |
| 5.29 | Security in outsourced supplier agreements | {{c_5_29_status}} | {{c_5_29_evidence}} | {{c_5_29_owner}} |
| 5.36 | Compliance with policies, rules, and standards | {{c_5_36_status}} | {{c_5_36_evidence}} | {{c_5_36_owner}} |

**Theme 2: People Controls (8 controls)**

| Control ID | Control Name | Implementation Status | Evidence | Owner |
|-----------|--------------|---------------------|----------|-------|
| 6.1 | Screening / background checks | {{c_6_1_status}} | {{c_6_1_evidence}} | {{c_6_1_owner}} |
| 6.2 | Terms and conditions of employment | {{c_6_2_status}} | {{c_6_2_evidence}} | {{c_6_2_owner}} |
| 6.3 | Information security awareness, education, training | {{c_6_3_status}} | {{c_6_3_evidence}} | {{c_6_3_owner}} |
| 6.4 | Disciplinary process | {{c_6_4_status}} | {{c_6_4_evidence}} | {{c_6_4_owner}} |
| 6.5 | Responsibilities after termination | {{c_6_5_status}} | {{c_6_5_evidence}} | {{c_6_5_owner}} |
| 6.8 | Remote working security | {{c_6_8_status}} | {{c_6_8_evidence}} | {{c_6_8_owner}} |

**Theme 3: Physical Controls (14 controls)**

| Control ID | Control Name | Implementation Status | Evidence | Owner |
|-----------|--------------|---------------------|----------|-------|
| 7.1 | Physical security perimeter | {{c_7_1_status}} | {{c_7_1_evidence}} | {{c_7_1_owner}} |
| 7.5 | Protecting against physical and environmental threats | {{c_7_5_status}} | {{c_7_5_evidence}} | {{c_7_5_owner}} |
| 7.9 | Secure disposal / reuse of equipment | {{c_7_9_status}} | {{c_7_9_evidence}} | {{c_7_9_owner}} |
| 7.10 | Clear desk and clear screen | {{c_7_10_status}} | {{c_7_10_evidence}} | {{c_7_10_owner}} |

**Theme 4: Technological Controls (34 controls)**

| Control ID | Control Name | Implementation Status | Evidence | Owner |
|-----------|--------------|---------------------|----------|-------|
| 8.1 | User endpoint devices | {{c_8_1_status}} | {{c_8_1_evidence}} | {{c_8_1_owner}} |
| 8.2 | Privileged access rights | {{c_8_2_status}} | {{c_8_2_evidence}} | {{c_8_2_owner}} |
| 8.5 | Secure authentication | {{c_8_5_status}} | {{c_8_5_evidence}} | {{c_8_5_owner}} |
| 8.8 | Management of technical vulnerabilities | {{c_8_8_status}} | {{c_8_8_evidence}} | {{c_8_8_owner}} |
| 8.11 | Data leakage prevention | {{c_8_11_status}} | {{c_8_11_evidence}} | {{c_8_11_owner}} |
| 8.15 | Logging and monitoring | {{c_8_15_status}} | {{c_8_15_evidence}} | {{c_8_15_owner}} |
| 8.16 | Incident response management | {{c_8_16_status}} | {{c_8_16_evidence}} | {{c_8_16_owner}} |
| 8.20 | Networks security | {{c_8_20_status}} | {{c_8_20_evidence}} | {{c_8_20_owner}} |
| 8.24 | Use of cryptography | {{c_8_24_status}} | {{c_8_24_evidence}} | {{c_8_24_owner}} |
| 8.28 | Secure development lifecycle | {{c_8_28_status}} | {{c_8_28_evidence}} | {{c_8_28_owner}} |
| 8.32 | Change management | {{c_8_32_status}} | {{c_8_32_evidence}} | {{c_8_32_owner}} |
| 8.33 | Test information | {{c_8_33_status}} | {{c_8_33_evidence}} | {{c_8_33_owner}} |
| 8.34 | Protection of information systems during audit testing | {{c_8_34_status}} | {{c_8_34_evidence}} | {{c_8_34_owner}} |

**2.2 Statement of Applicability (SoA) -- Clause 6.1.3 d**

Document which controls apply and justification:

| Control ID | Control Name | Applicable? | Justification | Implementation Status |
|-----------|--------------|-------------|---------------|---------------------|
| 5.1 | Information security policy | Yes | Foundation control | Implemented |
| 5.7 | Threat intelligence | Yes | Active threat landscape in {{industry}} | In progress |
| ... | ... | ... | ... | ... |
| 8.34 | Audit testing protection | No | No external audit testing of production systems | Not applicable |

### Phase 3: Monitoring & Measurement (Check)

**3.1 ISMS Performance Metrics (Clause 9.1 / ISO 27004)**

| Metric | Formula | Target | Frequency | Owner | Current Value |
|--------|---------|--------|-----------|-------|---------------|
| Policy compliance rate | (# compliant / # total) × 100 | >95% | Quarterly | {{owner}} | {{compliance_rate}}% |
| Incident response time | Avg time from detection to containment | <4 hours | Monthly | {{owner}} | {{avg_irt}} hours |
| Patch latency | Avg days from patch release to deployment | <30 days | Monthly | {{owner}} | {{patch_latency}} days |
| Security awareness completion | (# completed / # assigned) × 100 | >95% | Semi-annual | {{owner}} | {{awareness_rate}}% |
| Vulnerability remediation time | Avg days from discovery to fix | <45 days | Monthly | {{owner}} | {{vuln_remediation_days}} days |

**3.2 Internal Audit Program (Clause 9.2 / ISO 19011)**

| Audit | Scope | Auditor | Date | Findings | Status |
|-------|-------|---------|------|----------|--------|
| Stage 1 (Internal) | Full ISMS design, documentation review | {{internal_auditor_1}} | {{ia_1_date}} | {{ia_1_findings}} | {{ia_1_status}} |
| Stage 2 (Internal) | Full ISMS implementation effectiveness | {{internal_auditor_2}} | {{ia_2_date}} | {{ia_2_findings}} | {{ia_2_status}} |
| Management Review | ISMS performance, resource adequacy, continuous improvement | {{mgmt_review_lead}} | {{mr_date}} | {{mr_findings}} | {{mr_status}} |

**3.3 Management Review Agenda (Clause 9.3)**

Required input items:
- [ ] Status of previous management review action items
- [ ] Internal and external audit results
- [ ] Customer/stakeholder feedback
- [ ] Security incidents and investigations
- [ ] Risk assessment results and risk treatment plan status
- [ ] ISMS performance metrics and trends
- [ ] Resource adequacy (people, budget, tools)
- [ ] Effectiveness of security awareness and training
- [ ] Changes in threats, regulations, business environment
- [ ] Continuous improvement opportunities

### Phase 4: Continuous Improvement (Act)

**4.1 Nonconformity and Corrective Action (Clause 10.1)**

| Finding | Root Cause | Corrective Action | Owner | Due Date | Verification |
|---------|------------|-------------------|-------|----------|-------------|
| {{finding_1}} | {{root_cause_1}} | {{corrective_action_1}} | {{owner_1}} | {{due_1}} | {{verification_1}} |
| {{finding_2}} | {{root_cause_2}} | {{corrective_action_2}} | {{owner_2}} | {{due_2}} | {{verification_2}} |

**4.2 Certification Audit Preparation**

**Stage 1 Certification Audit (Documentation Review):**
- [ ] ISMS scope document signed and approved
- [ ] Information security policy signed by executive
- [ ] Risk assessment and treatment methodology documented
- [ ] Statement of Applicability (SoA) completed
- [ ] Risk treatment plan with owners and timelines
- [ ] Internal audit program and schedule
- [ ] Management review minutes
- [ ] Evidence of competence for ISMS roles

**Stage 2 Certification Audit (Implementation Verification):**
- [ ] All Annex A controls implemented as per SoA
- [ ] Risk treatment plan executed (evidence per treated risk)
- [ ] Internal audits completed with findings closed
- [ ] Management review completed with action items
- [ ] Performance metrics meeting targets
- [ ] Corrective actions from internal audit resolved
- [ ] Evidence of monitoring and measurement activities
- [ ] Documented evidence of continuous improvement

**Nonconformity Classification:**
| Type | Definition | Impact on Certification |
|------|-----------|------------------------|
| Major | Significant failure: control not implemented, systematic failure, no evidence | Must close within 30 days; certificate not issued until resolved |
| Minor | Isolated failure: control partially implemented, single instance of non-compliance | Must close within 90 days; certificate can be issued with CAP |
| Observation | Potential future risk, best practice improvement | No impact on certification; documented for improvement |

## output_format

Present as a complete ISMS implementation guide:
1. **ISMS Policy** -- draft policy document
2. **Scope Document** -- organizational, physical, technical scope
3. **Asset Inventory** -- complete asset register
4. **Risk Assessment** -- risk methodology, risk register, treatment plan
5. **Statement of Applicability** -- all 93 Annex A controls with applicability decision
6. **Control Implementation** -- implementation status per control with evidence
7. **Monitoring Plan** -- metrics, targets, KPIs
8. **Internal Audit Program** -- schedule, scope, auditors
9. **Certification Readiness** -- Stage 1 and Stage 2 checklists
10. **Surveillance Preparation** -- ongoing maintenance after certification

## constraints

- Avoid: "clause 4 context of the organization" misinterpretation -- document external and internal issues specifically
- Risk assessment methodology must be consistent and repeatable -- not ad-hoc per assessment cycle
- SoA must include ALL controls from Annex A -- cannot skip without documented justification
- Asset inventory must include information assets (data), not just IT assets -- emails, databases, paper records
- Supplier security must include cloud providers, MSPs, payroll processors, and all third parties with data access
- Management review minutes must be signed by executive management -- not just CISO
- Internal auditors must be independent of the area being audited -- cannot audit own work
- Surveillance audits occur every 12 months; recertification every 3 years
- ISO 27001:2022 transition: organizations certified to 2013 standard must transition within 3 years of publication
