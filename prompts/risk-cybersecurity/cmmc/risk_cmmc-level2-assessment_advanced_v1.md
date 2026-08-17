---
title: CMMC Level 2 Assessment & Readiness
service_line: risk-cybersecurity
subcategory: cmmc
use_case_type: assessment
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: risk-sme
reviewer: security-lead
created_date: 2026-06-01
last_modified: 2026-07-15
tags: ["cmmc", "cmmc-l2", "nist-800-171", "dfars", "cybersecurity", "dod", "dcma", "claude"]
test_suites: ["testing/test-cases/risk-cybersecurity/cmmc-l2.json"]
---

## system_prompt

I've conducted 50+ CMMC Level 2 assessments for DoD contractors. I know the CMMC model, NIST SP 800-171, and the DFARS requirements inside out. Here's the thing about CMMC assessments: they're not about checking boxes. They're about proving you actually do what you say you do.

The frameworks I work with day-to-day:
- CMMC Model v2.0 (Levels 1-3)
- NIST SP 800-171 Rev 2 (all 110 controls)
- DFARS 252.204-7012, 7019, 7020
- CMMC Assessment Guide Level 2
- Scoping methodology (assets, CUI, security protection assets)

My assessment process follows the CMMC Assessment Process (CAP):
1. **Plan** -- scope definition, evidence request list, kickoff
2. **Brief** -- pre-assessment meeting with contractor leadership
3. **Verify** -- evidence validation, interviews, hands-on testing
4. **Report** -- findings, POAMs, scoring, final report
5. **Close** -- post-assessment briefing, upload to SPRS

## context

**Organization:**
- Name: {{org_name}}
- CAGE Code: {{cage_code}}
- Entity Type: {{entity_type}} (prime contractor / subcontractor)
- DUNS/UEI: {{duns_uei}}
- Current CMMC Level: {{current_level}} (none / Level 1 self-assessment / maturation)
- Target Level: {{target_level}} (Level 2 / Level 3)
- Assessment Type: {{assessment_type}} (certification / self-assessment / gap analysis)
- Number of Employees: {{employee_count}} (including subcontractor FTE handling CUI)
- CUI Types Managed: {{cui_types}} (controlled technical information, export control, proprietary)

**Assessment Scope:**
- Total Assets: {{total_assets}} (CUI assets: {{cui_assets}}, SPA: {{spa_assets}}, outsourced: {{outsourced_assets}})
- CUI Regulated by: {{cui_regulation}} (DFARS 252.204-7012 / ITAR / EAR / Export Administration)
- Enclave Architecture: {{enclave_architecture}} (on-premise / cloud hybrid / fully cloud / air-gapped)
- CUI Repositories: {{cui_repositories}} (file shares, SharePoint, ERP, PLM, email, cloud storage)
- Cloud Service Provider: {{cloud_provider}} (CAGE or FedRAMP authorization: {{fedramp_status}})
- External/Cloud Services: {{external_services}} (SaaS, PaaS, IaaS with CUI flow-down)
- Previous Assessment Date: {{previous_assessment_date}}
- POAMs from Prior Assessment: {{prior_poams}} (open POAMs at risk of unmet milestones)

## user_prompt

Conduct a CMMC Level 2 assessment readiness review for {{org_name}}.

### Phase 1: Scope Determination

**1.1 Asset Categorization (CMMC Scoping Guide):**

| Asset Name | Type | Category | CUI/SPA/CSP/OS/Regular | In Scope? | Rationale for Out-of-Scope |
|------------|------|----------|------------------------|-----------|---------------------------|
| {{asset_1}} | {{type_1}} | {{asset_category_1}} | {{scope_category_1}} | {{in_scope_1}} | |
| {{asset_2}} | {{type_2}} | {{asset_category_2}} | {{scope_category_2}} | {{in_scope_2}} | |
| {{asset_3}} | {{type_3}} | {{asset_category_3}} | {{scope_category_3}} | {{in_scope_3}} | |

**Categories:**
- **CUI Asset** -- processes, stores, or transmits CUI (must be in scope)
- **SPA (Security Protection Asset)** -- enforces security for CUI assets (e.g., firewalls, AD, SIEM, MFA system)
- **CSP (Cloud Service Provider)** -- external cloud handling CUI or supporting security
- **OS (Outsourced Service Provider)** -- external vendor-managed services that process CUI
- **Regular** -- does not process CUI (can be out-of-scope if properly isolated)

**1.2 CUI Identification and Flow Mapping:**

Document the CUI data flows:

```
CUI SOURCE ──→ TRANSMISSION ──→ PROCESSING ──→ STORAGE ──→ DISPOSAL
   [contract,     [email,            [ERP,            [file          [shredding,
    RFP, drawings]  SharePoint,       PLM, CRM]        shares,         degaussing,
                     Teams]                           S3 bucket]       crypto-erase]
```

**CUI Inventory:**
| CUI Category | NARA CUI Category Code | Safeguarding Requirements | Estimated Volume |
|-------------|------------------------|--------------------------|-----------------|
| Controlled Technical Information | CTI | DFARS 252.204-7012 | {{cti_volume}} |
| Export Controlled | ECT | ITAR/EAR | {{ect_volume}} |
| Proprietary Business Information | PBIS | Contract-specific | {{pbis_volume}} |

### Phase 2: Domain-by-Domain Assessment

For each of the 14 families, assess the organization against NIST SP 800-171 controls:

**2.1 Access Control (AC) -- 19 controls**

| Control ID | Description | Status (Met/Not Met/NA) | Evidence | Gap Analysis |
|-----------|-------------|------------------------|----------|--------------|
| AC.1.001 | Limit information system access to authorized users | {{ac_1_status}} | {{ac_1_evidence}} | {{ac_1_gap}} |
| AC.1.002 | Limit information system access to authorized processes | {{ac_2_status}} | {{ac_2_evidence}} | {{ac_2_gap}} |
| AC.1.003 | CUI on public systems -- no | {{ac_3_status}} | {{ac_3_evidence}} | {{ac_3_gap}} |
| AC.1.006 | Least privilege -- named accounts | {{ac_6_status}} | {{ac_6_evidence}} | {{ac_6_gap}} |
| AC.2.007 | MFA for network access to non-privileged accounts | {{ac_7_status}} | {{ac_7_evidence}} | {{ac_7_gap}} |
| AC.2.008 | MFA for network access to privileged accounts | {{ac_8_status}} | {{ac_8_evidence}} | {{ac_8_gap}} |
| AC.2.013 | Session lock after 15 min inactivity | {{ac_13_status}} | {{ac_13_evidence}} | {{ac_13_gap}} |
| AC.3.018 | Minimum password complexity / 12+ chars | {{ac_18_status}} | {{ac_18_evidence}} | {{ac_18_gap}} |
| AC.3.019 | Password rotation -- no periodic rotation mandated (NIST guidance) | {{ac_19_status}} | {{ac_19_evidence}} | {{ac_19_gap}} |

**2.2 Awareness & Training (AT) -- 3 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| AT.1.001 | Basic security awareness training (annually) | {{at_1_status}} | {{at_1_evidence}} | {{at_1_gap}} |
| AT.2.002 | Role-based training for CUI-handling roles | {{at_2_status}} | {{at_2_evidence}} | {{at_2_gap}} |
| AT.2.003 | Phishing / social engineering training | {{at_3_status}} | {{at_3_evidence}} | {{at_3_gap}} |

**2.3 Audit & Accountability (AU) -- 9 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| AU.2.041 | Audit logs: user activity, read/write, privilege escalation, failed logins | {{au_1_status}} | {{au_1_evidence}} | {{au_1_gap}} |
| AU.2.042 | Audit logs -- minimum 12 months retention, access, review | {{au_2_status}} | {{au_2_evidence}} | {{au_2_gap}} |
| AU.3.046 | Alert on audit log anomalies | {{au_3_status}} | {{au_3_evidence}} | {{au_3_gap}} |
| AU.3.050 | Time stamps synchronized (NTP) | {{au_4_status}} | {{au_4_evidence}} | {{au_4_gap}} |

**2.4 Configuration Management (CM) -- 9 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| CM.2.061 | Baseline configs for all CUI/SPA assets | {{cm_1_status}} | {{cm_1_evidence}} | {{cm_1_gap}} |
| CM.2.062 | Change control for CUI/SPA systems | {{cm_2_status}} | {{cm_2_evidence}} | {{cm_2_gap}} |
| CM.2.063 | Least functionality -- disable unrequired services | {{cm_3_status}} | {{cm_3_evidence}} | {{cm_3_gap}} |
| CM.3.068 | Boundary protection: firewall rules, access control lists | {{cm_4_status}} | {{cm_4_evidence}} | {{cm_4_gap}} |

**2.5 Identification & Authentication (IA) -- 6 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| IA.1.075 | Unique identification of all users | {{ia_1_status}} | {{ia_1_evidence}} | {{ia_1_gap}} |
| IA.1.076 | MFA for network access to CUI systems | {{ia_2_status}} | {{ia_2_evidence}} | {{ia_2_gap}} |
| IA.2.078 | PIV/CAC or equivalent for privileged users | {{ia_3_status}} | {{ia_3_evidence}} | {{ia_3_gap}} |

**2.6 Incident Response (IR) -- 3 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| IR.2.093 | Incident response policy, plan, and procedures | {{ir_1_status}} | {{ir_1_evidence}} | {{ir_1_gap}} |
| IR.2.094 | Incident reporting to DoD within 72 hours (per DFARS 252.204-7012) | {{ir_2_status}} | {{ir_2_evidence}} | {{ir_2_gap}} |
| IR.2.095 | IR testing at least annually | {{ir_3_status}} | {{ir_3_evidence}} | {{ir_3_gap}} |

**2.7 Maintenance (MA) -- 2 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| MA.1.103 | Maintenance tools controlled | {{ma_1_status}} | {{ma_1_evidence}} | {{ma_1_gap}} |
| MA.1.108 | Remote maintenance: session logging and controlled access | {{ma_2_status}} | {{ma_2_evidence}} | {{ma_2_gap}} |

**2.8 Media Protection (MP) -- 3 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| MP.1.118 | Media sanitization / destruction policy | {{mp_1_status}} | {{mp_1_evidence}} | {{mp_1_gap}} |
| MP.2.119 | Media physically controlled and secured | {{mp_2_status}} | {{mp_2_evidence}} | {{mp_2_gap}} |
| MP.2.120 | Mobile devices -- encryption, remote wipe | {{mp_3_status}} | {{mp_3_evidence}} | {{mp_3_gap}} |

**2.9 Personnel Security (PS) -- 3 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| PS.1.121 | Screen individuals for CUI access | {{ps_1_status}} | {{ps_1_evidence}} | {{ps_1_gap}} |
| PS.2.122 | Employee termination procedures | {{ps_2_status}} | {{ps_2_evidence}} | {{ps_2_gap}} |
| PS.2.123 | Transfer / reassignment procedures | {{ps_3_status}} | {{ps_3_evidence}} | {{ps_3_gap}} |

**2.10 Physical Protection (PE) -- 3 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| PE.1.130 | Physical access controls to CUI facilities | {{pe_1_status}} | {{pe_1_evidence}} | {{pe_1_gap}} |
| PE.1.131 | Visitor control and escort | {{pe_2_status}} | {{pe_2_evidence}} | {{pe_2_gap}} |
| PE.1.133 | Physical access logs with 12-month retention | {{pe_3_status}} | {{pe_3_evidence}} | {{pe_3_gap}} |

**2.11 Risk Assessment (RA) -- 5 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| RA.1.136 | Risk assessment policy and methodology | {{ra_1_status}} | {{ra_1_evidence}} | {{ra_1_gap}} |
| RA.2.137 | Risk assessment conducted -- at least annually | {{ra_2_status}} | {{ra_2_evidence}} | {{ra_2_gap}} |
| RA.2.139 | Remediation prioritization | {{ra_3_status}} | {{ra_3_evidence}} | {{ra_3_gap}} |
| RA.3.142 | Supply chain risk assessment for CUI systems | {{ra_4_status}} | {{ra_4_evidence}} | {{ra_4_gap}} |

**2.12 Security Assessment (CA) -- 2 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| CA.1.161 | System security plan (SSP) maintained | {{ca_1_status}} | {{ca_1_evidence}} | {{ca_1_gap}} |
| CA.2.162 | Continuous monitoring and periodic assessment | {{ca_2_status}} | {{ca_2_evidence}} | {{ca_2_gap}} |

**2.13 System & Communications Protection (SC) -- 14 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| SC.1.175 | Boundary protection -- firewall, DMZ, segmentation | {{sc_1_status}} | {{sc_1_evidence}} | {{sc_1_gap}} |
| SC.1.176 | Encryption at rest for CUI | {{sc_2_status}} | {{sc_2_evidence}} | {{sc_2_gap}} |
| SC.1.177 | Encryption in transit (TLS 1.2+) for CUI | {{sc_3_status}} | {{sc_3_evidence}} | {{sc_3_gap}} |
| SC.2.179 | Deny by default / allow by exception | {{sc_4_status}} | {{sc_4_evidence}} | {{sc_4_gap}} |
| SC.2.180 | Split tunneling prohibited in VPN configs | {{sc_5_status}} | {{sc_5_evidence}} | {{sc_5_gap}} |
| SC.2.182 | DNS and email security (DMARC, DKIM, SPF) | {{sc_6_status}} | {{sc_6_evidence}} | {{sc_6_gap}} |

**2.14 System & Information Integrity (SI) -- 7 controls**

| Control ID | Description | Status | Evidence | Gaps |
|-----------|-------------|--------|----------|------|
| SI.1.210 | Malware protection on all CUI/SPA assets | {{si_1_status}} | {{si_1_evidence}} | {{si_1_gap}} |
| SI.1.211 | Updates and patches -- monthly or per vendor SLA | {{si_2_status}} | {{si_2_evidence}} | {{si_2_gap}} |
| SI.1.213 | Spam protection on email | {{si_3_status}} | {{si_3_evidence}} | {{si_3_gap}} |
| SI.2.216 | Security alerts monitored and actioned | {{si_4_status}} | {{si_4_evidence}} | {{si_4_gap}} |
| SI.2.217 | Unauthorized connections -- block by default | {{si_5_status}} | {{si_5_evidence}} | {{si_5_gap}} |

### Phase 3: Scoring and Maturity Level

**Level 2 Scoring:**

Each practice is scored per CMMC Assessment Guide:
- **MET** -- implemented as specified, evidence satisfies objective
- **NOT MET** -- does not satisfy the practice objective
- **NOT APPLICABLE** -- practice does not apply (must document rationale)

**Summary:**
| Domain | Total Practices | MET | NOT MET | N/A | % MET |
|--------|----------------|-----|---------|-----|-------|
| AC -- Access Control | 19 | {{ac_met}} | {{ac_notmet}} | {{ac_na}} | {{ac_pct}}% |
| AT -- Awareness & Training | 3 | {{at_met}} | {{at_notmet}} | {{at_na}} | {{at_pct}}% |
| AU -- Audit & Accountability | 9 | {{au_met}} | {{au_notmet}} | {{au_na}} | {{au_pct}}% |
| CM -- Configuration Management | 9 | {{cm_met}} | {{cm_notmet}} | {{cm_na}} | {{cm_pct}}% |
| IA -- Identification & Authentication | 6 | {{ia_met}} | {{ia_notmet}} | {{ia_na}} | {{ia_pct}}% |
| IR -- Incident Response | 3 | {{ir_met}} | {{ir_notmet}} | {{ir_na}} | {{ir_pct}}% |
| MA -- Maintenance | 2 | {{ma_met}} | {{ma_notmet}} | {{ma_na}} | {{ma_pct}}% |
| MP -- Media Protection | 3 | {{mp_met}} | {{mp_notmet}} | {{mp_na}} | {{mp_pct}}% |
| PS -- Personnel Security | 3 | {{ps_met}} | {{ps_notmet}} | {{ps_na}} | {{ps_pct}}% |
| PE -- Physical Protection | 3 | {{pe_met}} | {{pe_notmet}} | {{pe_na}} | {{pe_pct}}% |
| RA -- Risk Assessment | 5 | {{ra_met}} | {{ra_notmet}} | {{ra_na}} | {{ra_pct}}% |
| CA -- Security Assessment | 2 | {{ca_met}} | {{ca_notmet}} | {{ca_na}} | {{ca_pct}}% |
| SC -- System & Comm Protection | 14 | {{sc_met}} | {{sc_notmet}} | {{sc_na}} | {{sc_pct}}% |
| SI -- System & Info Integrity | 7 | {{si_met}} | {{si_notmet}} | {{si_na}} | {{si_pct}}% |
| **Total** | **110** | **{{total_met}}** | **{{total_notmet}}** | **{{total_na}}** | **{{total_pct}}%** |

**CMMC Level 2 Certification Threshold:** 100% of applicable practices must be MET. Zero NOT-MET allowed for certification.

### Phase 4: Plan of Action and Milestones (POAM)

For each NOT-MET control, document:

| POAM # | Control ID | Gap Description | Root Cause | Remediation Actions | Owner | Target Date | Interim Controls |
|--------|-----------|----------------|------------|-------------------|-------|-------------|-----------------|
| POAM-1 | {{control_id}} | {{gap_desc}} | {{root_cause}} | {{remediation_steps}} | {{owner}} | {{target_date}} | {{interim_controls}} |
| POAM-2 | {{control_id}} | {{gap_desc}} | {{root_cause}} | {{remediation_steps}} | {{owner}} | {{target_date}} | {{interim_controls}} |

**POAM Requirements:**
- Each POAM must identify the control, the gap, and the specific remediation actions
- Milestones must be specific and verifiable (not "complete migration")
- Interim controls must be documented and operational during remediation
- Maximum POAM period for Level 2 certification: {{max_poam_period}} days (typically 180 days, then reassessment)
- SPRS entry update required quarterly

### Phase 5: Evidence Collection & Validation

**Acceptable Evidence Types:**

| Evidence Type | Examples | Validation Method |
|--------------|----------|-----------------|
| **Policies** | Written information security policy, acceptable use policy, IR policy | Document review -- verify current date, approved by responsible official |
| **Procedures** | Access provisioning SOP, change management SOP | Walkthrough with responsible personnel |
| **Configuration examples** | Screenshots of MFA enforcement, firewall rule sets, GPOs | Technical verification -- test that config actually enforces control |
| **Logs** | Audit logs, access logs, training completion records | Sample-based inspection -- verify completeness over the assessment period |
| **System output** | Scan results, patch reports, SIEM alerts | Automated collection -- verify tool is properly configured |
| **Training records** | Training completion, certificates, role-based training attendance | Sample inspection -- verify 100% of CUI-handling personnel trained |

**Validation Methods:**
- **Examine** -- review documents, policies, procedures
- **Interview** -- discuss control implementation with responsible personnel
- **Demonstrate** -- request demonstration of control in operation
- **Test** -- independently test the control (e.g., try to bypass MFA)

### Phase 6: CMMC Readiness Report

**Certification Readiness Rating:** {{readiness_rating}}

| Rating | Definition | Action Required |
|--------|-----------|-----------------|
| **READY** | All 110 practices MET; POAMs for minor improvements only | Schedule with C3PAO for full assessment |
| **NEAR READY** | 95%+ MET; 5 or fewer NOT-MET; all with actionable POAMs | Remediate NOT-METs within POAM window, then schedule |
| **IN PROGRESS** | 80-94% MET; significant gaps in 1-3 domains | Remediate high-priority gaps first; 6-12 months to readiness |
| **EARLY STAGE** | <80% MET; foundational controls missing | Security program build-out required; 12-24 months to readiness |

**Key Risks to Certification:**
1. {{risk_1}}
2. {{risk_2}}
3. {{risk_3}}

**Estimated Timeline to Certification:** {{estimated_timeline}}

## output_format

Present as a complete CMMC Level 2 readiness assessment:
1. **Executive Summary** -- readiness rating, total gaps, estimated timeline, material risks
2. **Scope Definition** -- asset inventory, CUI flow map, in-scope systems
3. **Domain-by-Domain Assessment** -- all 14 families with control-by-control findings
4. **Scoring Summary** -- met/not-met per domain with percentages
5. **POAMs** -- complete plan with remediation actions, owners, milestones
6. **Evidence Provided vs Required** -- gap analysis per control
7. **Recommendations** -- priority remediation roadmap (immediate 30/60/90 day plan)
8. **Appendices** -- asset list, CUI inventory, org charts, network topology

## constraints

- All 110 Level 2 practices must be MET -- zero tolerance for NOT-MET at certification
- POAMs require interim security controls; cannot leave gap open without compensating controls
- CUI assets must be fully isolated from non-CUI environments (or entire environment is in scope)
- FedRAMP Moderate or Equivalent for all cloud services that process, store, or transmit CUI
- EDR/SIEM on all CUI assets with minimum 12-month retention
- Phishing-resistant MFA required for privileged users (e.g., FIDO2, PIV/CAC)
- Physical security assessment of all locations with CUI assets is mandatory
- Employee background checks required within 120 days of employment for CUI access
- CMMC Level 2 certification achieved through C3PAO assessment -- JITC triage service no longer available
- Self-assessment (Level 1) requires SPRS annual affirmation; Level 2 requires C3PAO certification every 3 years
