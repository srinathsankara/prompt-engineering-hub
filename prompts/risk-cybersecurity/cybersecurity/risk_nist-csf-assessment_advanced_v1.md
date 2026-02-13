---
title: NIST Cybersecurity Framework (CSF 2.0) Maturity Assessment
service_line: risk-cybersecurity
subcategory: cybersecurity
use_case_type: assessment
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: risk-sme
reviewer: risk-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["nist-csf", "cybersecurity", "risk-assessment", "maturity-model", "incident-response", "recovery", "detect", "protect", "govern", "respond", "claude"]
test_suites: []
---

## system_prompt

I've conducted enterprise-wide cybersecurity maturity assessments using NIST CSF 2.0 across multiple industries. The framework has six functions -- Govern, Identify, Protect, Detect, Respond, Recover -- and most organizations I assess are strong in two or three and weak in the rest. The goal is not to be perfect at everything. It's to match your cybersecurity posture to your business risk tolerance.

My assessment approach:

1. **Scoping** -- define organizational boundaries and tier selection (Tier 1-4). You can't assess what you haven't scoped.
2. **Current State** -- evaluate control maturity across all six functions. Be honest about where you are, not where you wish you were.
3. **Target State** -- define the desired posture based on business risk tolerance. Higher risk tolerance means a lower target tier -- and that's fine.
4. **Gap Analysis** -- identify what's missing between current and target. This is where the real work lives.
5. **Roadmap** -- prioritize by risk, cost, and impact. Not everything needs to be fixed this quarter.

## context

**Organization:**
- Name: {{organization_name}}
- Industry: {{industry}}
- Revenue: {{revenue}}
- Employees: {{employee_count}}
- IT/OT Scope: {{it_ot_scope}} (IT only / IT + OT / IT + IoT / all)
- Data Classification Levels Handled: {{data_classifications}} (PII / PHI / PCI / CUI / IP / Public)
- Current Security Program Tier: {{current_tier}} (Tier 1: Partial / Tier 2: Risk-Informed / Tier 3: Repeatable / Tier 4: Adaptive)
- Target Security Program Tier: {{target_tier}}
- Regulatory Frameworks Impacting: {{regulatory_frameworks}}
- Prior Assessment Date: {{prior_assessment_date}}
- Prior Assessment Maturity Rating: {{prior_maturity_rating}}

## user_prompt

Conduct a NIST CSF 2.0 maturity assessment for {{organization_name}}.

### Function 1: Govern (GV) -- Establish & Communicate Cybersecurity Oversight

| Category | Control | Current Maturity (0-5) | Target Maturity (0-5) | Gap | Evidence | Recommendations |
|----------|---------|----------------------|----------------------|-----|----------|----------------|
| GV.OC -- Organizational Context | GV.OC.01: Organizational mission, objectives, stakeholders defined | {{gv_oc_01}} | {{gv_oc_01_target}} | {{gv_oc_01_gap}} | {{gv_oc_01_evidence}} | {{gv_oc_01_recommendation}} |
| GV.OC -- Organizational Context | GV.OC.02: Legal, regulatory, contractual requirements identified | {{gv_oc_02}} | {{gv_oc_02_target}} | {{gv_oc_02_gap}} | {{gv_oc_02_evidence}} | {{gv_oc_02_recommendation}} |
| GV.OC -- Organizational Context | GV.OC.03: Critical services and assets prioritized | {{gv_oc_03}} | {{gv_oc_03_target}} | {{gv_oc_03_gap}} | {{gv_oc_03_evidence}} | {{gv_oc_03_recommendation}} |
| GV.RM -- Risk Management Strategy | GV.RM.01: Risk appetite and tolerance established | {{gv_rm_01}} | {{gv_rm_01_target}} | {{gv_rm_01_gap}} | {{gv_rm_01_evidence}} | {{gv_rm_01_recommendation}} |
| GV.RM -- Risk Management Strategy | GV.RM.02: Cybersecurity risk integrated with enterprise risk | {{gv_rm_02}} | {{gv_rm_02_target}} | {{gv_rm_02_gap}} | {{gv_rm_02_evidence}} | {{gv_rm_02_recommendation}} |
| GV.RM -- Risk Management Strategy | GV.RM.03: Third-party / supply chain risk program exists | {{gv_rm_03}} | {{gv_rm_03_target}} | {{gv_rm_03_gap}} | {{gv_rm_03_evidence}} | {{gv_rm_03_recommendation}} |
| GV.RM -- Risk Management Strategy | GV.RM.04: Risk management processes are documented and communicated | {{gv_rm_04}} | {{gv_rm_04_target}} | {{gv_rm_04_gap}} | {{gv_rm_04_evidence}} | {{gv_rm_04_recommendation}} |
| GV.SC -- Supply Chain Risk | GV.SC.01: Cybersecurity requirements integrated into supplier contracts | {{gv_sc_01}} | {{gv_sc_01_target}} | {{gv_sc_01_gap}} | {{gv_sc_01_evidence}} | {{gv_sc_01_recommendation}} |
| GV.SC -- Supply Chain Risk | GV.SC.02: Supplier risk assessments conducted | {{gv_sc_02}} | {{gv_sc_02_target}} | {{gv_sc_02_gap}} | {{gv_sc_02_evidence}} | {{gv_sc_02_recommendation}} |
| GV.SC -- Supply Chain Risk | GV.SC.03: Supplier cybersecurity performance monitored | {{gv_sc_03}} | {{gv_sc_03_target}} | {{gv_sc_03_gap}} | {{gv_sc_03_evidence}} | {{gv_sc_03_recommendation}} |
| GV.PO -- Policy & Oversight | GV.PO.01: Cybersecurity policy framework established | {{gv_po_01}} | {{gv_po_01_target}} | {{gv_po_01_gap}} | {{gv_po_01_evidence}} | {{gv_po_01_recommendation}} |
| GV.PO -- Policy & Oversight | GV.PO.02: Board and senior management oversight | {{gv_po_02}} | {{gv_po_02_target}} | {{gv_po_02_gap}} | {{gv_po_02_evidence}} | {{gv_po_02_recommendation}} |
| GV.PO -- Policy & Oversight | GV.PO.03: Roles, responsibilities, and accountability assigned | {{gv_po_03}} | {{gv_po_03_target}} | {{gv_po_03_gap}} | {{gv_po_03_evidence}} | {{gv_po_03_recommendation}} |
| GV.PO -- Policy & Oversight | GV.PO.04: Continuous improvement / change management process | {{gv_po_04}} | {{gv_po_04_target}} | {{gv_po_04_gap}} | {{gv_po_04_evidence}} | {{gv_po_04_recommendation}} |

### Function 2: Identify (ID) -- Understand Cybersecurity Risks

| Category | Control | Current Maturity | Gap | Recommendations |
|----------|---------|----------------|-----|----------------|
| ID.AM -- Asset Management | ID.AM.01: Hardware and firmware inventory maintained | {{id_am_01}} | {{id_am_01_gap}} | {{id_am_01_recommendation}} |
| ID.AM -- Asset Management | ID.AM.02: Software, SaaS, and cloud assets inventoried | {{id_am_02}} | {{id_am_02_gap}} | {{id_am_02_recommendation}} |
| ID.AM -- Asset Management | ID.AM.03: Data flows and data classification mapped | {{id_am_03}} | {{id_am_03_gap}} | {{id_am_03_recommendation}} |
| ID.AM -- Asset Management | ID.AM.04: External information systems cataloged (third-party integrations) | {{id_am_04}} | {{id_am_04_gap}} | {{id_am_04_recommendation}} |
| ID.AM -- Asset Management | ID.AM.05: Resources prioritized based on classification and criticality | {{id_am_05}} | {{id_am_05_gap}} | {{id_am_05_recommendation}} |
| ID.AM -- Asset Management | ID.AM.06: System/software licenses and EOL/EOS tracked | {{id_am_06}} | {{id_am_06_gap}} | {{id_am_06_recommendation}} |
| ID.RA -- Risk Assessment | ID.RA.01: Cybersecurity risk assessment performed (at least annually) | {{id_ra_01}} | {{id_ra_01_gap}} | {{id_ra_01_recommendation}} |
| ID.RA -- Risk Assessment | ID.RA.02: Threat intelligence incorporated (CVE, CISA, ISAC) | {{id_ra_02}} | {{id_ra_02_gap}} | {{id_ra_02_recommendation}} |
| ID.RA -- Risk Assessment | ID.RA.03: Vulnerabilities identified and prioritized (scanning, pen testing) | {{id_ra_03}} | {{id_ra_03_gap}} | {{id_ra_03_recommendation}} |
| ID.RA -- Risk Assessment | ID.RA.04: Business impact analysis (BIA) performed | {{id_ra_04}} | {{id_ra_04_gap}} | {{id_ra_04_recommendation}} |
| ID.RA -- Risk Assessment | ID.RA.05: Risk register maintained and reviewed by risk committee | {{id_ra_05}} | {{id_ra_05_gap}} | {{id_ra_05_recommendation}} |
| ID.IM -- Improvement | ID.IM.01: Lessons learned from incidents and assessments documented | {{id_im_01}} | {{id_im_01_gap}} | {{id_im_01_recommendation}} |
| ID.IM -- Improvement | ID.IM.02: Remediation tracking system (e.g., Plan of Action & Milestones) | {{id_im_02}} | {{id_im_02_gap}} | {{id_im_02_recommendation}} |

### Function 3: Protect (PR) -- Implement Safeguards

| Category | Control | Current Maturity | Gap | Recommendations |
|----------|---------|----------------|-----|----------------|
| PR.AA -- Identity Mgmt / Access Control | PR.AA.01: MFA enforced for all users (internal, remote, privileged) | {{pr_aa_01}} | {{pr_aa_01_gap}} | {{pr_aa_01_recommendation}} |
| PR.AA -- Identity Mgmt / Access Control | PR.AA.02: Least privilege principle -- role-based access control (RBAC) | {{pr_aa_02}} | {{pr_aa_02_gap}} | {{pr_aa_02_recommendation}} |
| PR.AA -- Identity Mgmt / Access Control | PR.AA.03: Privileged access management (PAM) implemented | {{pr_aa_03}} | {{pr_aa_03_gap}} | {{pr_aa_03_recommendation}} |
| PR.AA -- Identity Mgmt / Access Control | PR.AA.04: Identity lifecycle (joiner/mover/leaver) automated | {{pr_aa_04}} | {{pr_aa_04_gap}} | {{pr_aa_04_recommendation}} |
| PR.AA -- Identity Mgmt / Access Control | PR.AA.05: Remote access secured (VPN, ZTNA, session monitoring) | {{pr_aa_05}} | {{pr_aa_05_gap}} | {{pr_aa_05_recommendation}} |
| PR.DS -- Data Security | PR.DS.01: Data-at-rest encryption (AES-256) | {{pr_ds_01}} | {{pr_ds_01_gap}} | {{pr_ds_01_recommendation}} |
| PR.DS -- Data Security | PR.DS.02: Data-in-transit encryption (TLS 1.2+) | {{pr_ds_02}} | {{pr_ds_02_gap}} | {{pr_ds_02_recommendation}} |
| PR.DS -- Data Security | PR.DS.03: DLP (data loss prevention) controls implemented | {{pr_ds_03}} | {{pr_ds_03_gap}} | {{pr_ds_03_recommendation}} |
| PR.DS -- Data Security | PR.DS.04: Backup and restore procedures (tested quarterly) | {{pr_ds_04}} | {{pr_ds_04_gap}} | {{pr_ds_04_recommendation}} |
| PR.DS -- Data Security | PR.DS.05: Data sanitization / secure disposal process | {{pr_ds_05}} | {{pr_ds_05_gap}} | {{pr_ds_05_recommendation}} |
| PR.PS -- Platform Security | PR.PS.01: Configuration management / hardening (CIS benchmarks, STIGs) | {{pr_ps_01}} | {{pr_ps_01_gap}} | {{pr_ps_01_recommendation}} |
| PR.PS -- Platform Security | PR.PS.02: Patch management (automated, SLA-based patching) | {{pr_ps_02}} | {{pr_ps_02_gap}} | {{pr_ps_02_recommendation}} |
| PR.PS -- Platform Security | PR.PS.03: Endpoint protection (EDR/XDR, anti-malware, app control) | {{pr_ps_03}} | {{pr_ps_03_gap}} | {{pr_ps_03_recommendation}} |
| PR.PS -- Platform Security | PR.PS.04: Secure software development (SAST, DAST, SCA, code review) | {{pr_ps_04}} | {{pr_ps_04_gap}} | {{pr_ps_04_recommendation}} |
| PR.PS -- Platform Security | PR.PS.05: Cloud security posture management | {{pr_ps_05}} | {{pr_ps_05_gap}} | {{pr_ps_05_recommendation}} |
| PR.AT -- Awareness & Training | PR.AT.01: Annual security awareness training (phishing simulations) | {{pr_at_01}} | {{pr_at_01_gap}} | {{pr_at_01_recommendation}} |
| PR.AT -- Awareness & Training | PR.AT.02: Role-based security training (developers, admins, executives) | {{pr_at_02}} | {{pr_at_02_gap}} | {{pr_at_02_recommendation}} |
| PR.AT -- Awareness & Training | PR.AT.03: Insider threat training for HR, legal, security teams | {{pr_at_03}} | {{pr_at_03_gap}} | {{pr_at_03_recommendation}} |

### Function 4: Detect (DE) -- Identify Cybersecurity Events

| Category | Control | Current Maturity | Gap | Recommendations |
|----------|---------|----------------|-----|----------------|
| DE.AE -- Anomalies & Events | DE.AE.01: Baseline of normal network traffic known | {{de_ae_01}} | {{de_ae_01_gap}} | {{de_ae_01_recommendation}} |
| DE.AE -- Anomalies & Events | DE.AE.02: Behavioral analytics / UEBA deployed | {{de_ae_02}} | {{de_ae_02_gap}} | {{de_ae_02_recommendation}} |
| DE.AE -- Anomalies & Events | DE.AE.03: Event correlation (SIEM) -- centralized log management | {{de_ae_03}} | {{de_ae_03_gap}} | {{de_ae_03_recommendation}} |
| DE.CM -- Continuous Monitoring | DE.CM.01: Network traffic monitoring (NTA / NDR) | {{de_cm_01}} | {{de_cm_01_gap}} | {{de_cm_01_recommendation}} |
| DE.CM -- Continuous Monitoring | DE.CM.02: Endpoint detection (EDR/XDR) -- 24/7 SOC coverage | {{de_cm_02}} | {{de_cm_02_gap}} | {{de_cm_02_recommendation}} |
| DE.CM -- Continuous Monitoring | DE.CM.03: Cloud environment monitoring (CSPM, CASB) | {{de_cm_03}} | {{de_cm_03_gap}} | {{de_cm_03_recommendation}} |
| DE.CM -- Continuous Monitoring | DE.CM.04: Physical security monitoring (access logs, cameras) | {{de_cm_04}} | {{de_cm_04_gap}} | {{de_cm_04_recommendation}} |
| DE.CM -- Continuous Monitoring | DE.CM.05: Detection coverage mapped to MITRE ATT&CK | {{de_cm_05}} | {{de_cm_05_gap}} | {{de_cm_05_recommendation}} |

### Function 5: Respond (RS) -- Respond to Incidents

| Category | Control | Current Maturity | Gap | Recommendations |
|----------|---------|----------------|-----|----------------|
| RS.MA -- Incident Management | RS.MA.01: Incident response plan documented and tested (tabletop, full exercise) | {{rs_ma_01}} | {{rs_ma_01_gap}} | {{rs_ma_01_recommendation}} |
| RS.MA -- Incident Management | RS.MA.02: IR roles, chain of custody, escalation procedures defined | {{rs_ma_02}} | {{rs_ma_02_gap}} | {{rs_ma_02_recommendation}} |
| RS.MA -- Incident Management | RS.MA.03: Forensic readiness (collection, preservation, analysis) | {{rs_ma_03}} | {{rs_ma_03_gap}} | {{rs_ma_03_recommendation}} |
| RS.MA -- Incident Management | RS.MA.04: Retainer with external IR firm / DFIR provider | {{rs_ma_04}} | {{rs_ma_04_gap}} | {{rs_ma_04_recommendation}} |
| RS.CO -- Communications | RS.CO.01: Internal and external notification procedures defined | {{rs_co_01}} | {{rs_co_01_gap}} | {{rs_co_01_recommendation}} |
| RS.CO -- Communications | RS.CO.02: Regulatory notification capabilities (breach notification) | {{rs_co_02}} | {{rs_co_02_gap}} | {{rs_co_02_recommendation}} |
| RS.CO -- Communications | RS.CO.03: Crisis communication / PR plan | {{rs_co_03}} | {{rs_co_03_gap}} | {{rs_co_03_recommendation}} |
| RS.AN -- Analysis | RS.AN.01: Incident investigation procedures (root cause analysis) | {{rs_an_01}} | {{rs_an_01_gap}} | {{rs_an_01_recommendation}} |
| RS.AN -- Analysis | RS.AN.02: Threat intelligence integrated into response | {{rs_an_02}} | {{rs_an_02_gap}} | {{rs_an_02_recommendation}} |
| RS.MI -- Mitigation | RS.MI.01: Containment (isolation, segmentation, disabling access) | {{rs_mi_01}} | {{rs_mi_01_gap}} | {{rs_mi_01_recommendation}} |
| RS.MI -- Mitigation | RS.MI.02: Eradication (removing threat, patching, rebuilding) | {{rs_mi_02}} | {{rs_mi_02_gap}} | {{rs_mi_02_recommendation}} |
| RS.IM -- Improvement | RS.IM.01: Post-incident review and lessons learned | {{rs_im_01}} | {{rs_im_01_gap}} | {{rs_im_01_recommendation}} |
| RS.IM -- Improvement | RS.IM.02: IR plan updated based on exercises and incidents | {{rs_im_02}} | {{rs_im_02_gap}} | {{rs_im_02_recommendation}} |

### Function 6: Recover (RC) -- Restore Capabilities

| Category | Control | Current Maturity | Gap | Recommendations |
|----------|---------|----------------|-----|----------------|
| RC.RP -- Recovery Planning | RC.RP.01: Business continuity plan (BCP) documented | {{rc_rp_01}} | {{rc_rp_01_gap}} | {{rc_rp_01_recommendation}} |
| RC.RP -- Recovery Planning | RC.RP.02: Disaster recovery plan (DRP) documented | {{rc_rp_02}} | {{rc_rp_02_gap}} | {{rc_rp_02_recommendation}} |
| RC.RP -- Recovery Planning | RC.RP.03: RTO / RPO defined per system tier | {{rc_rp_03}} | {{rc_rp_03_gap}} | {{rc_rp_03_recommendation}} |
| RC.RP -- Recovery Planning | RC.RP.04: Recovery procedures tested annually (at minimum) | {{rc_rp_04}} | {{rc_rp_04_gap}} | {{rc_rp_04_recommendation}} |
| RC.CO -- Communications | RC.CO.01: Recovery milestones communicated to stakeholders | {{rc_co_01}} | {{rc_co_01_gap}} | {{rc_co_01_recommendation}} |
| RC.CO -- Communications | RC.CO.02: Public relations and reputation management during recovery | {{rc_co_02}} | {{rc_co_02_gap}} | {{rc_co_02_recommendation}} |
| RC.IM -- Improvement | RC.IM.01: Post-recovery lessons learned | {{rc_im_01}} | {{rc_im_01_gap}} | {{rc_im_01_recommendation}} |
| RC.IM -- Improvement | RC.IM.02: Recovery plan updated based on tests and actual incidents | {{rc_im_02}} | {{rc_im_02_gap}} | {{rc_im_02_recommendation}} |

### Overall Maturity

**Function-Level Summary:**

| Function | Current Avg Maturity | Target Avg Maturity | Gap | Priority |
|----------|---------------------|--------------------|-----|----------|
| GV -- Govern | {{gv_avg}} | {{gv_target_avg}} | {{gv_gap}} | {{gv_priority}} |
| ID -- Identify | {{id_avg}} | {{id_target_avg}} | {{id_gap}} | {{id_priority}} |
| PR -- Protect | {{pr_avg}} | {{pr_target_avg}} | {{pr_gap}} | {{pr_priority}} |
| DE -- Detect | {{de_avg}} | {{de_target_avg}} | {{de_gap}} | {{de_priority}} |
| RS -- Respond | {{rs_avg}} | {{rs_target_avg}} | {{rs_gap}} | {{rs_priority}} |
| RC -- Recover | {{rc_avg}} | {{rc_target_avg}} | {{rc_gap}} | {{rc_priority}} |

**Current Tier: {{current_tier}}**
**Target Tier: {{target_tier}}**

### Remediation Roadmap

| Priority | Recommendation | Category | Effort | Cost Estimate | Timeline | Owner |
|----------|---------------|----------|--------|--------------|----------|-------|
| 1 | {{rec_1}} | {{rec_1_category}} | {{rec_1_effort}} | {{rec_1_cost}} | {{rec_1_timeline}} | {{rec_1_owner}} |
| 2 | {{rec_2}} | {{rec_2_category}} | {{rec_2_effort}} | {{rec_2_cost}} | {{rec_2_timeline}} | {{rec_2_owner}} |
| 3 | {{rec_3}} | {{rec_3_category}} | {{rec_3_effort}} | {{rec_3_cost}} | {{rec_3_timeline}} | {{rec_3_owner}} |
| 4 | {{rec_4}} | {{rec_4_category}} | {{rec_4_effort}} | {{rec_4_cost}} | {{rec_4_timeline}} | {{rec_4_owner}} |
| 5 | {{rec_5}} | {{rec_5_category}} | {{rec_5_effort}} | {{rec_5_cost}} | {{rec_5_timeline}} | {{rec_5_owner}} |

## output_format

Present as a comprehensive NIST CSF 2.0 assessment report:
1. **Executive Summary** -- current tier, target tier, key findings, top 5 priorities
2. **Govern (GV)** -- organizational context, risk management, supply chain, policy oversight
3. **Identify (ID)** -- asset management, risk assessment, improvement
4. **Protect (PR)** -- identity/access, data security, platform security, awareness
5. **Detect (DE)** -- anomaly detection, continuous monitoring
6. **Respond (RS)** -- incident management, communications, analysis, mitigation
7. **Recover (RC)** -- recovery planning, communications, improvement
8. **Maturity Scorecard** -- function-level average maturity with visual (radar/spider chart description)
9. **Remediation Roadmap** -- prioritized recommendations with effort, cost, timeline, owner

## constraints

- CSF 2.0 maturity is scored 0-5: 0=Not Performed, 1=Initial/Ad-Hoc, 2=Repeatable but Informal, 3=Defined/Process, 4=Managed/Measured, 5=Optimizing
- All assessments should reference existing evidence -- interviews, policy documents, system configurations, incident reports
- Supply chain risk (GV.SC) is a new category in CSF 2.0 -- ensure it receives appropriate focus
- Tier selection should align with business risk tolerance -- Tier 4 is not appropriate for all organizations
- Maturity targets should not exceed the resources and risk appetite of the organization
- MITRE ATT&CK mapping for detection coverage is a best practice for detection maturity
- Recovery plan (RC.RP) should include BCP and DRP as distinct but integrated documents
- For regulated industries (HIPAA, PCI, CMMC, GLBA), NIST CSF assessment should be mapped to regulatory requirements for gap identification
- Likelihood of attack should consider industry-specific threat actors -- ransomware (healthcare/gov), state-sponsored (defense/IP), hacktivism (retail/energy)
- Cloud security posture (CSPM, CASB) is essential for organizations with >40% cloud workloads
- EDR/XDR with 24/7 SOC is the baseline for Tier 3 maturity -- co-managed or MSSP options are valid
- Cyber insurance application data should be cross-referenced against assessment findings
