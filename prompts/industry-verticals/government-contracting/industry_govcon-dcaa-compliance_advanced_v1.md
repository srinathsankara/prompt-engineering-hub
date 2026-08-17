---
title: Government Contracting & DCAA Compliance
service_line: industry-verticals
subcategory: government-contracting
use_case_type: review
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: industry-sme
reviewer: risk-sme
created_date: 2026-05-25
last_modified: 2026-06-15
tags: ["government-contracting", "dcaa", "far", "cas", "cmmc", "cost-accounting", "claude"]
test_suites: ["testing/test-cases/industry-verticals/govcon-dcaa.json"]
---

## system_prompt

I've spent twenty-plus years in government contracting finance -- DCAA audits, CAS disclosure statements, incurred cost submissions, business system certifications. I've seen a contractor lose millions over an unapproved accounting system change and another walk away clean because the FAR clauses were handled in the right order. You have deep expertise in the Federal Acquisition Regulation (FAR), Defense Contract Audit Agency (DCAA) compliance, Cost Accounting Standards (CAS), business system requirements (DFARS), and CMMC. You help government contractors maintain compliant accounting systems, prepare incurred cost submissions, and navigate DCAA audits.

## context

**Contractor Profile:**
- Name: {{contractor_name}}
- Business Size: {{business_size}} (large / mid-tier / small business / 8(a) / SDVOSB / HUBZone)
- Years in GovCon: {{years_govcon}}
- Primary Agencies: {{primary_agencies}} (DoD / DOE / NASA / GSA / civilian)
- Contract Types: {{contract_types}} (FFP / T&M / cost-reimbursement / IDIQ / CPAF)
- Current CAS Coverage: {{cas_coverage}} (none / CAS-covered / full CAS)
- CMMC Level: {{cmmc_level}} (target level and current level)
- Accounting System: {{accounting_system}} (Deltek / Unanet / SAP / custom)
- DCAA Status: {{dcaa_status}} (no audits / audit in progress / prior audit findings)

**Fiscal Year Data:**
- Total Revenue: {{total_revenue}}
- GovCon Revenue: {{govcon_revenue}} ({{govcon_pct}}% of total)
- Cost Reimbursable Revenue: {{cost_reimbursable_revenue}}
- Incurred Cost Submission Status: {{incurred_cost_status}}
- Forward Pricing Rate Agreement: {{fpra_status}} (yes / no / in negotiation)

## user_prompt

Perform a DCAA compliance assessment for {{contractor_name}}.

### Phase 1: Accounting System Review (DFARS 252.242-7006)

Evaluate the accounting system against the 18 mandatory criteria:

| # | Criteria | Compliant? | Evidence | Remediation Needed |
|---|----------|-----------|----------|-------------------|
| 1 | Segregate direct and indirect costs | {{c1_status}} | {{c1_evidence}} | {{c1_remediation}} |
| 2 | Identify cost by contract line item | {{c2_status}} | {{c2_evidence}} | {{c2_remediation}} |
| 3 | Accumulate costs by contract | {{c3_status}} | {{c3_evidence}} | {{c3_remediation}} |
| 4 | Billings comply with contract terms | {{c4_status}} | {{c4_evidence}} | {{c4_remediation}} |
| 5 | Labor cost distribution system | {{c5_status}} | {{c5_evidence}} | {{c5_remediation}} |
| 6 | Timekeeping system with supervisory approval | {{c6_status}} | {{c6_evidence}} | {{c6_remediation}} |
| 7 | Segregate pre-production and production costs | {{c7_status}} | {{c7_evidence}} | {{c7_remediation}} |
| 8 | Job order cost system with audit trail | {{c8_status}} | {{c8_evidence}} | {{c8_remediation}} |
| 9 | Cost accounting data readily available | {{c9_status}} | {{c9_evidence}} | {{c9_remediation}} |
| 10 | Pooling of indirect costs by logical grouping | {{c10_status}} | {{c10_evidence}} | {{c10_remediation}} |
| 11 | Accumulation of G&A expenses | {{c11_status}} | {{c11_evidence}} | {{c11_remediation}} |
| 12 | Cost allocation methodology consistent | {{c12_status}} | {{c12_evidence}} | {{c12_remediation}} |
| 13 | Billings/payments reconciliation | {{c13_status}} | {{c13_evidence}} | {{c13_remediation}} |
| 14 | Disclosure Statement (CASB DS-1/DS-2) current | {{c14_status}} | {{c14_evidence}} | {{c14_remediation}} |
| 15 | Interim determination of costs | {{c15_status}} | {{c15_evidence}} | {{c15_remediation}} |
| 16 | Time-phased cost information | {{c16_status}} | {{c16_evidence}} | {{c16_remediation}} |
| 17 | Contract costing at interim billing rates | {{c17_status}} | {{c17_evidence}} | {{c17_remediation}} |
| 18 | DCAA access to records | {{c18_status}} | {{c18_evidence}} | {{c18_remediation}} |

### Phase 2: Incurred Cost Submission (ICE)

**Checklist for completed incurred cost submission:**
- [ ] SF 1408 (if requested by DCAA)
- [ ] Schedule A -- Contract costs incurred and claimed
- [ ] Schedule B -- Indirect cost pools and allocation bases
- [ ] Schedule C -- Allocation method details
- [ ] Schedule D -- G&A expense pool detail
- [ ] Schedule E -- Occupancy costs
- [ ] Schedule F -- Labor hour data
- [ ] Schedule G -- Other costs
- [ ] Schedule H -- Subcontractor costs
- [ ] Schedule I -- Prior year adjustments
- [ ] Certificate of indirect costs (signed by CFO or VP Finance)
- [ ] Time/effort reconciliation
- [ ] Supporting workpapers for each pool and base

**Common DCAA Findings:**
| Finding | Severity | Prevention |
|---------|----------|------------|
| Unsupported executive compensation | High | Ensure compensation is reasonable per FAR 31.205-6 |
| Inadequate timekeeping | High | Electronic timesheets with daily entries and supervisory approval |
| Improper cost allocation | Medium | Maintain written allocation methodology documentation |
| Unallowable costs in indirect pools | Medium | Perform quarterly unallowable cost sweeps |
| Inadequate subcontractor monitoring | Medium | Pre-award risk assessments and post-award monitoring |

### Phase 3: Indirect Rate Structure

**Recommended Rate Structure:**
| Indirect Pool | Base | FY {{current_year}} | Provisional Rate | Final Rate (prior year) |
|--------------|------|---------------------|-----------------|------------------------|
| Fringe | Total direct labor | {{fringe_rate}}% | {{fringe_provisional}}% | {{fringe_final}}% |
| Overhead | Direct labor dollars | {{oh_rate}}% | {{oh_provisional}}% | {{oh_final}}% |
| Material Handling (if applicable) | Material cost | {{mh_rate}}% | {{mh_provisional}}% | {{mh_final}}% |
| G&A | Total cost input (TCI) | {{ga_rate}}% | {{ga_provisional}}% | {{ga_final}}% |
| **Wrap Rate** (Fringe + OH + G&A) | Direct labor | **{{wrap_rate}}%** | | |

**Forward Pricing Rate Proposal:**
| Element | FY+1 | FY+2 | FY+3 | Basis of Estimate |
|---------|------|------|------|-------------------|
| Labor escalation | {{labor_esc_1}}% | {{labor_esc_2}}% | {{labor_esc_3}}% | {{labor_boe}} |
| Fringe rate | {{fringe_1}}% | {{fringe_2}}% | {{fringe_3}}% | {{fringe_boe}} |
| Overhead rate | {{oh_1}}% | {{oh_2}}% | {{oh_3}}% | {{oh_boe}} |
| G&A rate | {{ga_1}}% | {{ga_2}}% | {{ga_3}}% | {{ga_boe}} |

### Phase 4: Cost Allowability -- Common FAR Part 31 Issues

| Cost Element | FAR Reference | Generally Allowable? | Special Requirements |
|-------------|---------------|---------------------|---------------------|
| Executive compensation | 31.205-6 | Yes (capped at ${{comp_cap}} under statute) | Benchmarking required |
| Advertising/marketing | 31.205-1 | No | -- |
| Bad debts | 31.205-3 | No | -- |
| Contributions/donations | 31.205-8 | No | -- |
| Employee morale (recreation) | 31.205-13 | Limited | ${{morale_limit}} per employee |
| Entertainment | 31.205-14 | No | -- |
| Fines/penalties | 31.205-15 | No | -- |
| Interest expense | 31.205-20 | No | -- |
| Lobbying | 31.205-22 | No | -- |
| Organization costs | 31.205-27 | No | -- |
| Patent costs | 31.205-30 | Limited | In-house > outside counsel |
| R&D/B&P | 31.205-18 | Yes | If allocable to contracts |
| Selling costs | 31.205-38 | Rebuttable presumption | Must be allocable |
| Travel | 31.205-46 | Yes | Must follow written policy |

### Phase 5: CMMC Readiness Assessment

| CMMC Practice | Level | Implemented? | Evidence | Gap |
|--------------|-------|-------------|----------|-----|
| Access Control (AC.1.001) | 1 | {{ac_1_status}} | {{ac_1_evidence}} | {{ac_1_gap}} |
| Access Control (AC.1.002) | 1 | {{ac_2_status}} | {{ac_2_evidence}} | {{ac_2_gap}} |
| Access Control -- MFA (AC.1.003) | 1 | {{ac_3_status}} | {{ac_3_evidence}} | {{ac_3_gap}} |
| Audit & Accountability (AU.1.001) | 1 | {{au_1_status}} | {{au_1_evidence}} | {{au_1_gap}} |
| Incident Response (IR.1.001) | 1 | {{ir_1_status}} | {{ir_1_evidence}} | {{ir_1_gap}} |
| System & Information Integrity (SI.1.001) | 1 | {{si_1_status}} | {{si_1_evidence}} | {{si_1_gap}} |

**Level 2 practices require:**
- All 110 NIST SP 800-171 controls
- CMMC Level 2 certification by a C3PAO
- Plan of Action and Milestones (POAM) for any unmet controls

### Phase 6: Business System Deficiencies

| Business System | DFARS Reference | Deficiencies | CAP Pending? | Withholding Risk? |
|----------------|----------------|-------------|-------------|-----------------|
| Accounting System | 252.242-7006 | {{acct_sys_deficiencies}} | {{acct_sys_cap}} | {{acct_sys_withholding}} |
| Earned Value Management | 252.234-7002 | {{evm_deficiencies}} | {{evm_cap}} | {{evm_withholding}} |
| Estimating System | 252.215-7002 | {{est_deficiencies}} | {{est_cap}} | {{est_withholding}} |
| Purchasing System | 252.244-7001 | {{purch_deficiencies}} | {{purch_cap}} | {{purch_withholding}} |
| Material Management & Accounting | 252.242-7004 | {{mms_deficiencies}} | {{mms_cap}} | {{mms_withholding}} |
| Property Management | 252.245-7003 | {{prop_deficiencies}} | {{prop_cap}} | {{prop_withholding}} |

## output_format

Present as a comprehensive DCAA compliance assessment:
1. **Executive Summary** -- system adequacy rating, major findings, risk level
2. **Accounting System Assessment** -- 18-criteria scorecard with compliant/inadequate rating
3. **Incurred Cost Submission** -- completeness checklist and common findings
4. **Indirect Rate Structure** -- current rates, provisional rates, FPRA status
5. **FAR Allowability Matrix** -- common unallowable costs and identification process
6. **Business System Deficiencies** -- CAP tracking and payment withholding risk
7. **CMMC Gap Assessment** -- level-specific practice gaps and remediation timeline
8. **Corrective Action Plan** -- prioritized findings with owner, due date, and verification

## constraints

- Accounting system adequacy is a pass/fail determination -- 8+ deficiencies can result in withholding
- Incurred cost submissions are due within 6 months of fiscal year end (extensions available)
- Forward pricing rates without an FPRA require provisional rates with regular monitoring
- CAS-covered contractors must maintain compliance with CASB Disclosure Statement
- CMMC Level 2 certification requires assessment by an accredited C3PAO -- self-assessment is not sufficient
- Unallowable cost identification should be systematic, not ad hoc -- use an unallowable cost policy
- Cost-reimbursable contracts require more rigorous accounting systems than FFP contracts
- DCAA audit focus areas rotate -- stay current with the current year's audit guidance
