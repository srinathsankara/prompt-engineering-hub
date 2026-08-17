---
title: HIPAA Security & Privacy Compliance Assessment
service_line: risk-cybersecurity
subcategory: hipaa
use_case_type: assessment
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: risk-sme
reviewer: security-lead
created_date: 2026-07-05
last_modified: 2026-07-15
tags: ["hipaa", "hi-tech", "phi", "ephi", "ocr", "security-rule", "privacy-rule", "breach-notification", "healthcare", "claude"]
test_suites: ["testing/test-cases/risk-cybersecurity/hipaa-compliance.json"]
---

## system_prompt

I've been doing HIPAA compliance work for 15+ years -- covered entities, business associates, the whole spectrum. HIPAA looks simple on paper (three rules: Privacy, Security, Breach Notification) but the devil is in the implementation. OCR enforcement has been getting more aggressive every year, and state laws keep adding layers on top.

Regulations I work with daily:
- HIPAA Privacy Rule (45 CFR 164.500-.534)
- HIPAA Security Rule (45 CFR 164.300-.318) -- Administrative, Physical, Technical Safeguards
- HIPAA Breach Notification Rule (45 CFR 164.400-.414)
- HITECH Act (2009), Omnibus Rule (2013)
- OCR enforcement priorities and audit protocol
- State laws that exceed HIPAA minimums (CA, TX, others)
- NIST SP 800-66 Rev 2 implementation guidance

My assessment approach:
1. **Scope** -- identify where ePHI lives, covered entity or BA status, data flows
2. **Analyze** -- evaluate administrative, physical, and technical safeguards against the actual rules
3. **Identify gaps** -- map findings against HIPAA Rules and OCR audit protocol
4. **Remediate** -- prioritize by risk to ePHI confidentiality, integrity, and availability
5. **Document** -- policies, procedures, risk assessments, breach response plans

## context

**Organization Profile:**
- Name: {{org_name}}
- Entity Type: {{entity_type}} (Covered Entity / Business Associate / Health Information Exchange / Subcontractor)
- Sub-Type: {{sub_type}} (provider / health plan / healthcare clearinghouse / HIE / HIO / TPA)
- Size: {{org_size}} (large / medium / small) -- relevant to OCR penalty tier
- ePHI Volume: {{ephi_volume}} (records stored, records created annually)
- Prior OCR Investigations: {{prior_ocr}} (none / resolved / pending)
- Previous Risk Assessment: {{prior_risk_assessment}} (date and scope if applicable)

**ePHI Environment:**
- Systems with ePHI: {{ephi_systems}} (EHR / PM / RCM / patient portal / data warehouse / email / file shares)
- Cloud Services with ePHI: {{cloud_services}} (AWS / Azure / GCP / SaaS -- with BAAs in place)
- ePHI Transmitted Over: {{ephi_transmission}} (cleartext / encrypted email / VPN / API / SFTP / Direct protocol)
- Portable Devices with ePHI: {{portable_devices}} (laptops / mobile devices / USB drives / tablets)
- Remote Workforce: {{remote_workforce}} (% of staff accessing ePHI remotely)

## user_prompt

Conduct a HIPAA compliance assessment for {{org_name}}.

### Phase 1: ePHI Discovery and Data Flow Mapping

**1.1 ePHI Inventory**

| Data Asset | ePHI Data Elements | System / Location | Format | Format (Structured/Unstructured) | Retention Period |
|------------|-------------------|-------------------|--------|-------------------------------|-----------------|
| {{data_asset_1}} | {{data_elements_1}} | {{location_1}} | {{format_1}} | {{retention_1}} | |
| {{data_asset_2}} | {{data_elements_2}} | {{location_2}} | {{format_2}} | {{retention_2}} | |

**1.2 ePHI Data Flow Diagram**

```
                      ┌─────────────────┐
                      │   Patient       │
                      │   (Individual)  │
                      └────────┬────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                    ACCESS CONTROL GATEWAY                    │
│              (MFA / SSO / Identity Provider)                 │
└─────────────────────────────────────────────────────────────┘
                               │
                               ▼
               ┌───────────────────────────────┐
               │    Covered Entity Systems     │
               │  ┌─────┐ ┌─────┐ ┌────────┐  │
               │  │ EHR │ │ PMS │ │ Portal │  │
               │  └──┬──┘ └──┬──┘ └───┬────┘  │
               │     │       │        │       │
               └─────┼───────┼────────┼───────┘
                     │       │        │
                     ▼       ▼        ▼
         ┌───────────────────────────────┐
         │    Business Associates        │
         │  ┌─────────┐ ┌──────────┐    │
         │  │ Clearing│ │ Analytics│    │
         │  │  house  │ │ Vendor   │    │
         │  └─────────┘ └──────────┘    │
         │  ┌─────────┐ ┌──────────┐    │
         │  │  TPA    │ │ HIE      │    │
         │  └─────────┘ └──────────┘    │
         └───────────────────────────────┘
```

**1.3 Business Associate Inventory**

| BA Name | Services Provided | BA Signed? | BA Type | Last BA Review | ePHI Accessed |
|---------|-----------------|------------|---------|----------------|---------------|
| {{ba_1}} | {{ba_services_1}} | {{ba_signed_1}} | {{ba_type_1}} | {{ba_review_1}} | {{ba_ephi_1}} |
| {{ba_2}} | {{ba_services_2}} | {{ba_signed_2}} | {{ba_type_2}} | {{ba_review_2}} | {{ba_ephi_2}} |

### Phase 2: HIPAA Security Rule -- Administrative Safeguards (45 CFR §164.304-.314)

**2.1 Security Management Process (S1) -- §164.308(a)(1)**

| Requirement | Compliant? | Evidence | Gaps | Priority |
|-------------|-----------|----------|------|----------|
| Risk analysis (comprehensive, organization-wide) | {{ra_status}} | {{ra_evidence}} | {{ra_gaps}} | {{ra_priority}} |
| Risk management plan (mitigation, timeline, ownership) | {{rmp_status}} | {{rmp_evidence}} | {{rmp_gaps}} | {{rmp_priority}} |
| Sanction policy (for HIPAA violations) | {{sanction_status}} | {{sanction_evidence}} | {{sanction_gaps}} | {{sanction_priority}} |
| Information system activity review (log review) | {{log_review_status}} | {{log_review_evidence}} | {{log_review_gaps}} | {{log_review_priority}} |

**2.2 Assigned Security Responsibility (S2) -- §164.308(a)(2)**
- [ ] Security Officer designated: {{security_officer_name}} ({{security_officer_status}})
- [ ] Security Officer responsibilities documented
- [ ] Authority adequate to fulfill responsibilities

**2.3 Workforce Security (S3) -- §164.308(a)(3)**

| Requirement | Compliant? | Evidence |
|-------------|-----------|----------|
| Authorization / supervision of workforce accessing ePHI | {{ws_auth_status}} | {{ws_auth_evidence}} |
| Workforce clearance procedures | {{ws_clearance_status}} | {{ws_clearance_evidence}} |
| Termination procedures (same day access removal) | {{ws_termination_status}} | {{ws_termination_evidence}} |

**2.4 Information Access Management (S4) -- §164.308(a)(4)**

| Requirement | Compliant? | Evidence |
|-------------|-----------|----------|
| Isolate health clearinghouse functions (if applicable) | {{iam_clearinghouse_status}} | {{iam_clearinghouse_evidence}} |
| Access authorization -- role-based access to ePHI | {{iam_authorization_status}} | {{iam_authorization_evidence}} |
| Access establishment and modification procedures | {{iam_modification_status}} | {{iam_modification_evidence}} |

**2.5 Security Awareness & Training (S5) -- §164.308(a)(5)**

| Requirement | Compliant? | Frequency | Evidence |
|-------------|-----------|-----------|----------|
| Security awareness training for all workforce members | {{sat_initial_status}} | {{sat_initial_frequency}} | {{sat_initial_evidence}} |
| Password management training | {{sat_password_status}} | {{sat_password_frequency}} | {{sat_password_evidence}} |
| Malware protection training | {{sat_malware_status}} | {{sat_malware_frequency}} | {{sat_malware_evidence}} |
| Login monitoring / session time-out training | {{sat_login_status}} | {{sat_login_frequency}} | {{sat_login_evidence}} |
| Security reminders (ongoing) | {{sat_reminders_status}} | {{sat_reminders_frequency}} | {{sat_reminders_evidence}} |

**2.6 Security Incident Procedures (S6) -- §164.308(a)(6)**
- [ ] Incident response policy and procedures documented
- [ ] Incident response team defined
- [ ] Breach notification procedures documented per HIPAA Breach Rule
- [ ] Incident response tested at least annually
- [ ] Evidence: {{incident_response_evidence}}

**2.7 Contingency Plan (S7) -- §164.308(a)(7)**

| Requirement | Compliant? | Last Test | Evidence |
|-------------|-----------|-----------|----------|
| Data backup plan (ePHI recoverability) | {{cp_backup_status}} | {{cp_backup_last_test}} | {{cp_backup_evidence}} |
| Disaster recovery plan | {{cp_dr_status}} | {{cp_dr_last_test}} | {{cp_dr_evidence}} |
| Emergency mode operation plan | {{cp_emergency_status}} | {{cp_emergency_last_test}} | {{cp_emergency_evidence}} |
| Testing and revision procedures | {{cp_testing_status}} | {{cp_testing_last_test}} | {{cp_testing_evidence}} |
| Applications and data criticality analysis | {{cp_criticality_status}} | {{cp_criticality_last_test}} | {{cp_criticality_evidence}} |

**2.8 Evaluation (S8) -- §164.308(a)(8)**
- [ ] Periodic technical and non-technical evaluation of security policies in response to environmental or operational changes
- [ ] Evaluation frequency: {{evaluation_frequency}}
- [ ] Last evaluation: {{last_evaluation_date}}

**2.9 Business Associate Contracts (S9) -- §164.308(b)(1)**

| BA Name | Contract Contains Required Elements? | BA Performance Monitored? | Breach Reported by BA? |
|---------|-------------------------------------|-------------------------|----------------------|
| {{ba_name}} | {{ba_contract_compliant}} | {{ba_monitored}} | {{ba_breach_reported}} |

**Required BAA elements (45 CFR §164.504(e)):**
- [ ] Permitted uses and disclosures of ePHI
- [ ] Prohibition on unauthorized use/disclosure
- [ ] Safeguards to protect ePHI (Security Rule compliance)
- [ ] Reporting of breaches and security incidents
- [ ] Return or destruction of ePHI upon termination
- [ ] Subcontractor obligations (flow-down requirements)
- [ ] Access by individual to their ePHI
- [ ] Amendment of ePHI
- [ ] Accounting of disclosures
- [ ] Availability of books/records to HHS Secretary
- [ ] Attestation that BA will comply with Security Rule

### Phase 3: HIPAA Security Rule -- Physical Safeguards (45 CFR §164.310)

| Requirement | Compliant? | Evidence | Gaps |
|-------------|-----------|----------|------|
| **Facility Access Controls (P1)** -- §164.310(a)(1) | | | |
| Facility security plan | {{facility_plan_status}} | {{facility_plan_evidence}} | {{facility_plan_gaps}} |
| Access control and validation (ID badges, biometrics) | {{facility_access_status}} | {{facility_access_evidence}} | {{facility_access_gaps}} |
| Maintenance records (visitor logs, repairs) | {{facility_maintenance_status}} | {{facility_maintenance_evidence}} | {{facility_maintenance_gaps}} |
| **Workstation Use (P2)** -- §164.310(b) | | | |
| Workstation use policies (proper use, physical attributes) | {{workstation_use_status}} | {{workstation_use_evidence}} | {{workstation_use_gaps}} |
| **Workstation Security (P3)** -- §164.310(c) | | | |
| Workstation physical safeguards (locked offices, cable locks, privacy screens) | {{workstation_security_status}} | {{workstation_security_evidence}} | {{workstation_security_gaps}} |
| **Device & Media Controls (P4)** -- §164.310(d)(1) | | | |
| Disposal procedures (degaussing, shredding, crypto-erase) | {{device_disposal_status}} | {{device_disposal_evidence}} | {{device_disposal_gaps}} |
| Media re-use procedures | {{device_reuse_status}} | {{device_reuse_evidence}} | {{device_reuse_gaps}} |
| Accountability / device tracking (asset inventory) | {{device_accountability_status}} | {{device_accountability_evidence}} | {{device_accountability_gaps}} |
| Data backup and storage (offsite encrypted backup) | {{device_backup_status}} | {{device_backup_evidence}} | {{device_backup_gaps}} |

### Phase 4: HIPAA Security Rule -- Technical Safeguards (45 CFR §164.312)

| Requirement | Compliant? | Evidence | Gaps |
|-------------|-----------|----------|------|
| **Access Controls (T1)** -- §164.312(a)(1) | | | |
| Unique user identification (individual user accounts) | {{access_unique_id_status}} | {{access_unique_id_evidence}} | {{access_unique_id_gaps}} |
| Emergency access procedure (break-glass) | {{access_emergency_status}} | {{access_emergency_evidence}} | {{access_emergency_gaps}} |
| Automatic logoff (session timeout -- 15 min recommended) | {{access_auto_logoff_status}} | {{access_auto_logoff_evidence}} | {{access_auto_logoff_gaps}} |
| Encryption and decryption (at rest) | {{access_encryption_status}} | {{access_encryption_evidence}} | {{access_encryption_gaps}} |
| **Audit Controls (T2)** -- §164.312(b) | | | |
| Hardware, software, and procedural mechanisms to record ePHI access | {{audit_controls_status}} | {{audit_controls_evidence}} | {{audit_controls_gaps}} |
| Log content: user ID, date/time, action, data accessed, origination | {{audit_content_status}} | {{audit_content_evidence}} | {{audit_content_gaps}} |
| Log retention -- minimum 6 years (HIPAA requirement) | {{audit_retention_status}} | {{audit_retention_evidence}} | {{audit_retention_gaps}} |
| **Integrity Controls (T3)** -- §164.312(c)(1) | | | |
| Mechanism to authenticate ePHI not improperly modified/destroyed | {{integrity_controls_status}} | {{integrity_controls_evidence}} | {{integrity_controls_gaps}} |
| **Person/Entity Authentication (T4)** -- §164.312(d) | | | |
| User authentication -- minimum 2 factors (password + MFA) | {{authentication_status}} | {{authentication_evidence}} | {{authentication_gaps}} |
| **Transmission Security (T5)** -- §164.312(e)(1) | | | |
| Integrity controls (ensure ePHI not modified in transit) | {{transmission_integrity_status}} | {{transmission_integrity_evidence}} | {{transmission_integrity_gaps}} |
| Encryption in transit (TLS 1.2+ for all ePHI over open networks) | {{transmission_encryption_status}} | {{transmission_encryption_evidence}} | {{transmission_encryption_gaps}} |

### Phase 5: HIPAA Privacy Rule (45 CFR §164.500-.534)

| Requirement | Compliant? | Evidence | Gaps |
|-------------|-----------|----------|------|
| **Notice of Privacy Practices (NPP)** -- §164.520 | | | |
| NPP provided to each patient on first visit / electronically | {{npp_provision_status}} | {{npp_evidence}} | {{npp_gaps}} |
| NPP posted prominently at service delivery sites and on website | {{npp_posting_status}} | {{npp_posting_evidence}} | {{npp_posting_gaps}} |
| **Minimum Necessary Standard** -- §164.502(b), §164.514(d) | | | |
| Policies limiting ePHI access to minimum necessary | {{minimum_necessary_status}} | {{minimum_necessary_evidence}} | {{minimum_necessary_gaps}} |
| Routine vs non-routine disclosure protocols | {{routine_disclosures_status}} | {{routine_disclosures_evidence}} | {{routine_disclosures_gaps}} |
| **Patient Rights** -- §164.522-.528 | | | |
| Right of access (30/60 day response) | {{access_right_status}} | {{access_right_evidence}} | {{access_right_gaps}} |
| Right to amend (60/90 day response) | {{amend_right_status}} | {{amend_right_evidence}} | {{amend_right_gaps}} |
| Right to accounting of disclosures (6 years) | {{accounting_right_status}} | {{accounting_right_evidence}} | {{accounting_right_gaps}} |
| Right to request restrictions | {{restriction_right_status}} | {{restriction_right_evidence}} | {{restriction_right_gaps}} |
| Right to confidential communications | {{confidential_comm_status}} | {{confidential_comm_evidence}} | {{confidential_comm_gaps}} |
| **Administrative Requirements** -- §164.530 | | | |
| Privacy Officer designated | {{privacy_officer_status}} | {{privacy_officer_name}} | {{privacy_officer_gaps}} |
| Complaint procedures | {{complaint_procedures_status}} | {{complaint_procedures_evidence}} | {{complaint_procedures_gaps}} |
| Training on Privacy Rule (all workforce members) | {{privacy_training_status}} | {{privacy_training_evidence}} | {{privacy_training_gaps}} |
| Mitigation of harmful effects of privacy violations | {{mitigation_status}} | {{mitigation_evidence}} | {{mitigation_gaps}} |

### Phase 6: Breach Notification Rule (45 CFR §164.400-.414)

**6.1 Breach Risk Assessment (Four-Factor Test)**

When a breach of unsecured PHI occurs, document:

| Factor | Analysis | Conclusion |
|--------|----------|------------|
| 1. Nature and extent of PHI involved (identifiability, sensitivity, likelihood of re-identification) | {{factor_1_analysis}} | {{factor_1_conclusion}} |
| 2. Unauthorized person who accessed PHI (authorized vs unauthorized, obligation to protect) | {{factor_2_analysis}} | {{factor_2_conclusion}} |
| 3. Whether PHI was actually acquired or viewed | {{factor_3_analysis}} | {{factor_3_conclusion}} |
| 4. Extent to which risk to PHI has been mitigated | {{factor_4_analysis}} | {{factor_4_conclusion}} |
| **Overall -- Breach Notification Required?** | | **{{breach_notification_required}}** |

**6.2 Notification Requirements**

| Notification Type | Recipient | Timeline | Method | Status |
|------------------|-----------|----------|--------|--------|
| Individual notification | Affected individuals | Without unreasonable delay, no later than 60 days | First-class mail / email / substitute notice | {{individual_notification_status}} |
| Media notice | Media outlets in state/jurisdiction | Same as above | Press release if 500+ affected | {{media_notification_status}} |
| HHS Secretary -- report | HHS OCR | Breaches <500: annual report; 500+: immediately, no later than 60 days | HHS website portal | {{hhs_notification_status}} |

### Phase 7: OCR Audit Protocol -- Key Areas

**OCR Enforcement Priorities (current year):**
- Right of Access (most common settlement -- single largest category)
- Ransomware and security incidents (increasing enforcement)
- Business associate agreements and oversight
- Risk analysis completion and quality
- Patient access to ePHI via mobile apps / APIs

**OCR Penalty Tiers (per violation, per calendar year):**
| Tier | Culpability | Minimum Penalty | Maximum Penalty | Cap / Year |
|------|-------------|----------------|----------------|------------|
| Tier 1 | Did not know / reasonable diligence would not have known | $127 | $63,973 | $1,919,173 |
| Tier 2 | Reasonable cause / not willful neglect | $1,280 | $63,973 | $1,919,173 |
| Tier 3 | Willful neglect -- corrected within 30 days | $12,794 | $63,973 | $1,919,173 |
| Tier 4 | Willful neglect -- not corrected within 30 days | $63,973 | $1,919,173 | $1,919,173 |

### Phase 8: Remediation Roadmap

| Priority | Finding | HIPAA Reference | Remediation | Owner | Target Date |
|----------|---------|----------------|-------------|-------|-------------|
| **Critical** | {{critical_finding}} | {{critical_ref}} | {{critical_remediation}} | {{critical_owner}} | {{critical_date}} |
| **High** | {{high_finding}} | {{high_ref}} | {{high_remediation}} | {{high_owner}} | {{high_date}} |
| **Medium** | {{medium_finding}} | {{medium_ref}} | {{medium_remediation}} | {{medium_owner}} | {{medium_date}} |
| **Low** | {{low_finding}} | {{low_ref}} | {{low_remediation}} | {{low_owner}} | {{low_date}} |

## output_format

Present as a complete HIPAA compliance assessment:
1. **Executive Summary** -- overall compliance score, material findings, breach risk
2. **ePHI Discovery** -- data inventory, data flow diagram, BAA tracker
3. **Administrative Safeguards** -- 9 standards, each with pass/fail and evidence
4. **Physical Safeguards** -- 4 standards with facility, workstation, device controls
5. **Technical Safeguards** -- 5 standards with access, audit, integrity, auth, transmission
6. **Privacy Rule Compliance** -- NPP, minimum necessary, patient rights, administrative
7. **Breach Notification Readiness** -- risk assessment methodology, notification procedures
8. **OCR Audit Readiness** -- enforcement priority alignment, penalty exposure
9. **Remediation Plan** -- prioritized findings with owners and deadlines

## constraints

- HIPAA applies to both Covered Entities AND Business Associates (Omnibus Rule 2013)
- Risk analysis must be comprehensive -- device-level, not just organizational-level
- Encryption is "addressable but preferred" -- if you choose not to encrypt, you must document equivalent alternative
- Minimum necessary does NOT apply to treatment, payment, or healthcare operations disclosures
- Breach notification applies to ALL ePHI, not just unencrypted (presumption of breach unless risk assessment demonstrates low probability)
- Business Associate Agreements flow down to subcontractors -- enforce contractually
- State laws that are more protective than HIPAA take precedence (e.g., CA AB 1954, TX HB 300)
- The 6-year record retention requirement applies to HIPAA documentation (policies, BAAs, training, access requests)
- Ransomware is presumptively a breach -- OCR expects detection, containment, and notification
- OCR settlement amounts increased significantly under HITECH; willful neglect carries the highest penalties
