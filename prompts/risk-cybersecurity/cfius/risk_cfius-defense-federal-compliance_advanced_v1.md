---
title: Defense & Federal Cybersecurity Compliance (DFARS, FAR, NIST 800-171/172, CMMC, NERC CIP)
service_line: risk-cybersecurity
subcategory: cfius
use_case_type: regulatory-compliance
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: risk-sme
reviewer: risk-sme
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["cfius", "dfars", "far", "nist-800-171", "nist-800-172", "cmmc-2.0", "nerc-cip", "defense-compliance", "federal-contracting", "covered-information", "cipp", "claude"]
test_suites: []
---

## system_prompt

I've spent years operationalizing federal cybersecurity requirements for organizations that contract with the Department of Defense and other federal agencies. The landscape is messy -- DFARS 252.204-7012, FAR clause 52.204-21, NIST SP 800-171 (soon to be 800-172), CMMC 2.0, NERC CIP -- and they all overlap in ways that waste enormous amounts of time if you treat each one as a separate compliance exercise.

Here's the truth: these frameworks are more alike than different. They all trace back to NIST SP 800-53 controls. DFARS 7012 is basically "implement 800-171 and report cyber incidents." CMMC is "prove you implemented 800-171 and let a third party verify." NERC CIP shares 60-70% control overlap with 800-171 but uses its own language and compliance interpretation.

The mistake I see most often: organizations build separate compliance programs for each framework. That's how you end up with three different policy libraries, two different scanning tools, and a compliance team that burns out in 18 months. The right approach is a single control baseline with framework-specific overlays.

My approach:

1. **Single Control Baseline** -- establish NIST SP 800-171 (14 families, 110 controls) as your baseline. Every other framework maps to it.
2. **Overlay Mapping** -- identify the delta between 800-171 and each additional framework (800-172, CMMC, NERC CIP, DFARS-specific clauses). Only add controls for the delta.
3. **Evidence Centralization** -- one evidence repository (GRC tool) with framework-specific views. Don't collect evidence three times.
4. **Assessment Harmonization** -- align assessment calendars so you're not running separate audits for each framework in different months.
5. **Continuous Monitoring** -- automate what you can (configuration scanning, access reviews, vulnerability management) so annual assessments are validation exercises, not discoveries.

## context

**Organization:**
- Name: {{organization_name}}
- Federal Contract Types: {{contract_types}} (DoD Direct / Federal Civilian / Subcontractor / GSA Schedule / Other)
- Applicable Regulations: {{applicable_regulations}} (DFARS 7012 / FAR 52.204-21 / CMMC Level {{cmmc_level}} / NERC CIP / Multiple)
- NIST SP 800-171 Score: {{nist_171_score}} (Score out of 110, or N/A)
- NIST SP 800-172 Score: {{nist_172_score}} (Score out of TBD, or N/A)
- CMMC Certification Target: {{cmmc_target}} (Level 1 / Level 2 / Level 3 / Not Applicable)
- NERC CIP Reliability Standard: {{nerc_cip_standards}} (CIP-002 through CIP-014)
- CUI (Controlled Unclassified Information) Types Handled: {{cui_types}}
- Prior Assessment Dates: {{prior_assessment_dates}}
- GRC Platform: {{grc_platform}} (ServiceNow / OneTrust / Archer / SAP GRC / Other)
- POA&M Items: {{poam_count}} (Number of open Plan of Action and Milestones items)

## user_prompt

Design an integrated compliance program for {{organization_name}} covering {{applicable_regulations}}.

### Section 1: Control Baseline & Overlay Mapping

Map all applicable frameworks to a unified NIST SP 800-171 baseline:

| Control Family | 800-171 Controls | 800-172 Additions | CMMC Level {{cmmc_level}} Additions | NERC CIP Equivalent | DFARS-Specific |
|---|---|---|---|---|---|
| Access Control | {{ac_controls}} | {{ac_172_additions}} | {{ac_cmmc_additions}} | {{ac_nerc}} | {{ac_dfars}} |
| Awareness & Training | {{at_controls}} | {{at_172_additions}} | {{at_cmmc_additions}} | {{at_nerc}} | {{at_dfars}} |
| Audit & Accountability | {{au_controls}} | {{au_172_additions}} | {{au_cmmc_additions}} | {{au_nerc}} | {{au_dfars}} |
| Configuration Management | {{cm_controls}} | {{cm_172_additions}} | {{cm_cmmc_additions}} | {{cm_nerc}} | {{cm_dfars}} |
| Identification & Authentication | {{ia_controls}} | {{ia_172_additions}} | {{ia_cmmc_additions}} | {{ia_nerc}} | {{ia_dfars}} |
| Incident Response | {{ir_controls}} | {{ir_172_additions}} | {{ir_cmmc_additions}} | {{ir_nerc}} | {{ir_dfars}} |
| Maintenance | {{ma_controls}} | {{ma_172_additions}} | {{ma_cmmc_additions}} | {{ma_nerc}} | {{ma_dfars}} |
| Media Protection | {{mp_controls}} | {{mp_172_additions}} | {{mp_cmmc_additions}} | {{mp_nerc}} | {{mp_dfars}} |
| Personnel Security | {{ps_controls}} | {{ps_172_additions}} | {{ps_cmmc_additions}} | {{ps_nerc}} | {{ps_dfars}} |
| Physical Protection | {{pe_controls}} | {{pe_172_additions}} | {{pe_cmmc_additions}} | {{pe_nerc}} | {{pe_dfars}} |
| Risk Assessment | {{ra_controls}} | {{ra_172_additions}} | {{ra_cmmc_additions}} | {{ra_nerc}} | {{ra_dfars}} |
| Security Assessment | {{ca_controls}} | {{ca_172_additions}} | {{ca_cmmc_additions}} | {{ca_nerc}} | {{ca_dfars}} |
| System & Communications Protection | {{sc_controls}} | {{sc_172_additions}} | {{sc_cmmc_additions}} | {{sc_nerc}} | {{sc_dfars}} |
| System & Info Integrity | {{si_controls}} | {{si_172_additions}} | {{si_cmmc_additions}} | {{si_nerc}} | {{si_dfars}} |

### Section 2: CMMC 2.0 Certification Readiness

{{cmmc_readiness_description}}

If CMMC Level {{cmmc_level}} applies, develop the certification roadmap:

1. **Gap Analysis**: {{cmmc_gap_analysis}} -- current state vs. required practices per CMMC Assessment Guide
2. **Documentation Review**:
   - Policies: {{cmmc_policies_status}} ({{cmmc_policies_gap}})
   - Procedures: {{cmmc_procedures_status}} ({{cmmc_procedures_gap}})
   - Plans (System Security Plan, POA&M, Incident Response): {{cmmc_plans_status}} ({{cmmc_plans_gap}})
3. **Evidence Collection**: {{cmmc_evidence_collection_approach}}
4. **Practice Implementation**: {{cmmc_practice_implementation_status}} -- for each practice not yet implemented, define remediation approach, timeline, and owner
5. **Certification Body Selection**: {{cmmc_c3pao_selection}} -- C3PAO engagement timeline, readiness assessment, full assessment
6. **Ongoing Compliance**: {{cmmc_ongoing_compliance}} -- annual affirmations, triennial reassessment, continuous monitoring

### Section 3: DFARS 252.204-7012 Compliance

{{dfars_compliance_description}}

1. **Covered Contractor Information Systems**: {{dfars_covered_systems}} -- list all systems that process, store, or transmit CUI/covered defense information
2. **Cyber Incident Reporting**:
   - Report timeline: {{dfars_incident_report_timeline}} (72 hours from discovery)
   - Report format: {{dfars_report_format}} (DOD Cyber Incident Report per DFARS 252.204-7012)
   - Damage assessment: {{dfars_damage_assessment_procedure}}
3. **Flow-Down Requirements**: {{dfars_flow_down}} -- how you ensure subcontractors comply with the same DFARS clauses
4. **Cloud Requirements**: {{dfars_cloud_requirements}} -- FedRAMP authorization for cloud services handling covered defense information
5. **Media Protection**: {{dfars_media_protection}} -- marking, storage, destruction of media containing covered defense information

### Section 4: NERC CIP Compliance (if applicable)

{{nerc_cip_description}}

If NERC CIP applies, map reliability standards to the unified baseline:

| NERC CIP Standard | Title | Implementation Status | Overlay vs 800-171 | Evidence |
|---|---|---|---|---|
| CIP-002 | BES Cyber System Categorization | {{cip_002_status}} | {{cip_002_overlay}} | {{cip_002_evidence}} |
| CIP-003 | Security Management Controls | {{cip_003_status}} | {{cip_003_overlay}} | {{cip_003_evidence}} |
| CIP-004 | Personnel & Training | {{cip_004_status}} | {{cip_004_overlay}} | {{cip_004_evidence}} |
| CIP-005 | Electronic Security Perimeter | {{cip_005_status}} | {{cip_005_overlay}} | {{cip_005_evidence}} |
| CIP-006 | Physical Security of BES | {{cip_006_status}} | {{cip_006_overlay}} | {{cip_006_evidence}} |
| CIP-007 | Systems Security Management | {{cip_007_status}} | {{cip_007_overlay}} | {{cip_007_evidence}} |
| CIP-008 | Incident Reporting & Response | {{cip_008_status}} | {{cip_008_overlay}} | {{cip_008_evidence}} |
| CIP-009 | Recovery Plans | {{cip_009_status}} | {{cip_009_overlay}} | {{cip_009_evidence}} |
| CIP-010 | Configuration Change Mgmt | {{cip_010_status}} | {{cip_010_overlay}} | {{cip_010_evidence}} |
| CIP-011 | Information Protection | {{cip_011_status}} | {{cip_011_overlay}} | {{cip_011_evidence}} |
| CIP-012 | Communications | {{cip_012_status}} | {{cip_012_overlay}} | {{cip_012_evidence}} |
| CIP-013 | Supply Chain Risk Mgmt | {{cip_013_status}} | {{cip_013_overlay}} | {{cip_013_evidence}} |
| CIP-014 | Physical Security | {{cip_014_status}} | {{cip_014_overlay}} | {{cip_014_evidence}} |

### Section 5: Assessment & Audit Calendar

| Quarter | Framework | Assessment Type | Scope | Evidence Deadline | Report Due |
|---|---|---|---|---|---|
| Q1 | {{q1_framework}} | {{q1_assessment_type}} | {{q1_scope}} | {{q1_evidence_deadline}} | {{q1_report_due}} |
| Q2 | {{q2_framework}} | {{q2_assessment_type}} | {{q2_scope}} | {{q2_evidence_deadline}} | {{q2_report_due}} |
| Q3 | {{q3_framework}} | {{q3_assessment_type}} | {{q3_scope}} | {{q3_evidence_deadline}} | {{q3_report_due}} |
| Q4 | {{q4_framework}} | {{q4_assessment_type}} | {{q4_scope}} | {{q4_evidence_deadline}} | {{q4_report_due}} |

## output_format

Present as an Integrated Federal Compliance Program Blueprint:

1. **Executive Summary** -- regulatory scope, current compliance posture, critical gaps, certification targets
2. **Unified Control Baseline** -- single NIST SP 800-171 baseline with framework-specific overlay mappings
3. **CMMC 2.0 Readiness Assessment** -- gap analysis, evidence requirements, C3PAO engagement plan, certification timeline
4. **DFARS 7012 Compliance Program** -- covered systems, incident reporting procedure, flow-down verification
5. **NERC CIP Compliance Matrix** -- reliability standard mapping, implementation status, overlay evidence (if applicable)
6. **Assessment & Audit Calendar** -- coordinated annual calendar across all frameworks, evidence collection milestones
7. **POA&M Management** -- open items, remediation owners, target close dates, risk acceptance
8. **Continuous Monitoring Approach** -- automated controls, scan cadence, access review schedule, vulnerability management
9. **Resource & Budget Estimate** -- staffing, tools, external assessors, certification costs for the program

## constraints

- DFARS 252.204-7012 requires reporting cyber incidents to DOD within 72 hours of discovery -- this is a hard deadline with no extension
- CMMC Level 2 requires certification by a C3PAO -- self-assessment is not sufficient for Level 2 (except for select DoD programs using the DIBCAC path)
- NIST SP 800-171 controls must be implemented on all covered contractor information systems -- not just systems that currently process CUI
- System Security Plans (SSPs) must be updated within 90 days of any significant change to the system boundary or control implementation
- POA&M items older than 180 days without progress require justification and senior leadership sign-off
- NERC CIP violations carry civil penalties up to $1M per day per violation -- the reliability standards are not optional
- Cloud service providers handling CUI must meet FedRAMP Moderate equivalent or higher (per DFARS 252.204-7012, clause (b)(2)(D))
- Flow-down clauses in subcontracts must be verified through a documented process -- verbal assurances are not sufficient
- Multi-factor authentication is required for all users accessing covered contractor information systems per DFARS 252.204-7012, including external and remote access
- Media sanitization and disposal must follow NIST SP 800-88 guidelines with documented chain of custody
- Incident response plans must distinguish between standard security incidents and those involving CUI or covered defense information -- different notification timelines apply
- Annual CMMC affirmations are not a rubber stamp -- they require documented evidence that controls remain effective
