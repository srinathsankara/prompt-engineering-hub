---
title: Not-for-Profit Grant Compliance & Single Audit
service_line: industry-verticals
subcategory: not-for-profit
use_case_type: review
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: assurance-sme
reviewer: nfp-sme
created_date: 2026-05-22
last_modified: 2026-06-13
tags: ["not-for-profit", "nfp", "grant", "single-audit", "uniform-guidance", "2-cfr-200", "claude"]
test_suites: ["testing/test-cases/industry-verticals/nfp-grant.json"]
---

## system_prompt

I audit not-for-profits and their grant compliance -- federal, state, and private awards. The Uniform Guidance (2 CFR 200) is the governing framework, and the Single Audit Act means any NFP spending more than $750k in federal awards gets a full compliance audit. Most NFPs underinvest in grant compliance infrastructure and then scramble when the auditor shows up.

Key areas I cover:
- AICPA Audit & Accounting Guide for NFPs
- Uniform Guidance (2 CFR Part 200)
- OMB Compliance Supplement
- Single Audit Act requirements
- Federal, state, and private grant management

You help NFPs navigate grant compliance, single audits, indirect cost rates, and internal controls over grant programs.

## context

**Organization Profile:**
- Name: {{org_name}}
- Type: {{org_type}} (501(c)(3) / 501(c)(4) / foundation / university / other)
- Total Revenue: {{total_revenue}}
- Federal Grant Revenue: {{federal_revenue}} ({{federal_pct}}% of total)
- Number of Grant Programs: {{grant_count}}
- Major Programs (over $750k threshold): {{major_programs}}

**Award Details:**
- Grantor Agency: {{grantor}} (HHS / DOE / DOL / ED / State agency / Foundation)
- Award Type: {{award_type}} (federal / state / private / flow-through)
- Award Number: {{award_number}}
- Period of Performance: {{pop_start}} to {{pop_end}}
- Total Award Amount: {{award_amount}}
- Funds Drawn to Date: {{drawn_amount}}
- Cost Type: {{cost_type}} (cost-reimbursement / fixed-price / formula-based)
- CFDA/Assistance Listing Number: {{assistance_listing_number}}

## user_prompt

Perform a grant compliance analysis for {{org_name}}'s {{grant_program_name}} program.

### Phase 1: Grant Eligibility & Allowability (2 CFR 200 Subpart E)

For each cost category, evaluate allowability against Uniform Guidance:

| Cost Category | Amount | Reasonable? | Allocable? | Consistent Policy? | Allowable? |
|---------------|--------|-------------|------------|-------------------|-----------|
| Direct Labor | {{labor_amount}} | {{labor_reasonable}} | {{labor_allocable}} | {{labor_consistent}} | {{labor_allowable}} |
| Fringe Benefits | {{fringe_amount}} | {{fringe_reasonable}} | {{fringe_allocable}} | {{fringe_consistent}} | {{fringe_allowable}} |
| Travel | {{travel_amount}} | {{travel_reasonable}} | {{travel_allocable}} | {{travel_consistent}} | {{travel_allowable}} |
| Equipment | {{equip_amount}} | {{equip_reasonable}} | {{equip_allocable}} | {{equip_consistent}} | {{equip_allowable}} |
| Supplies | {{supplies_amount}} | {{supplies_reasonable}} | {{supplies_allocable}} | {{supplies_consistent}} | {{supplies_allowable}} |
| Contractual | {{contract_amount}} | {{contract_reasonable}} | {{contract_allocable}} | {{contract_consistent}} | {{contract_allowable}} |
| **Total Direct Costs** | {{total_direct}} | | | | |

**Indirect Costs:**
| Method | Description | Rate | Amount | Elected? | 
|--------|-------------|------|--------|----------|
| De minimis rate (2 CFR 200.414) | 10% of MTDC | 10% | {{de_minimis_amount}} | {{de_minimis_elected}} |
| Negotiated indirect cost rate (NICRA) | {{nicra_description}} | {{nicra_rate}}% | {{nicra_amount}} | {{nicra_elected}} |

**Unallowable Costs to Flag:**
- {{unallowable_1}}
- {{unallowable_2}}
- {{unallowable_3}}

### Phase 2: Time & Effort Reporting

Compliance requirements (2 CFR 200.430):
- [ ] Personnel activity reports (PARs) maintained for all employees charging federal awards
- [ ] PARs signed by employee or responsible official at least semi-annually
- [ ] PARs reflect actual activity (not budgeted)
- [ ] Substitute systems (e.g., P-card logs, phone records) for intermittent workers
- [ ] Effort certifications on file for cost-sharing/matching commitments

### Phase 3: Procurement & Subrecipient Monitoring

**Procurement (2 CFR 200.317-.327):**
| Requirement | Status | Evidence |
|-------------|--------|----------|
| Written procurement policy | {{procurement_policy_status}} | {{procurement_policy_evidence}} |
| Competition for any contract > $250k | {{competition_status}} | {{competition_evidence}} |
| Cost/price analysis for sole source | {{sole_source_status}} | {{sole_source_evidence}} |
| Bonding requirements (if applicable) | {{bonding_status}} | {{bonding_evidence}} |

**Subrecipient Monitoring (2 CFR 200.331-.333):**
| Requirement | Status | Evidence |
|-------------|--------|----------|
| Subrecipient risk assessment before award | {{sub_risk_assessment}} | {{sub_risk_evidence}} |
| Written subaward agreement | {{sub_agreement}} | {{sub_agreement_evidence}} |
| Subrecipient monitoring plan | {{sub_monitoring_plan}} | {{sub_monitoring_evidence}} |
| Subrecipient single audit review | {{sub_single_audit}} | {{sub_audit_evidence}} |

### Phase 4: Allowable Costs / Cost Principles

Check specific restrictions for {{grant_program_name}}:

- [ ] Matching/cost-sharing requirement met? ({{matching_requirement}}%)
- [ ] Program income properly tracked and applied?
- [ ] Equipment inventory maintained (if > $5k)?
- [ ] Real property reporting (if applicable)?
- [ ] Intellectual property rights/disposition?

### Phase 5: Single Audit Requirements (if applicable)

**Threshold Test:**
- Total federal expenditures: {{total_federal_expenditures}}
- Single Audit threshold: $750k (2 CFR 200.501)
- Single Audit required: {{single_audit_required}} (Yes/No)

**Major Program Determination:**
| Grant Program | CFDA # | Expenditures | Type A/B | Major Program? |
|---------------|--------|-------------|----------|---------------|
| {{program_1}} | {{cfda_1}} | {{expenditures_1}} | {{type_1}} | {{major_1}} |
| {{program_2}} | {{cfda_2}} | {{expenditures_2}} | {{type_2}} | {{major_2}} |
| {{program_3}} | {{cfda_3}} | {{expenditures_3}} | {{type_3}} | {{major_3}} |

**Compliance Requirements Tested (per OMB Compliance Supplement):**
| Compliance Area | Requirement | Testing Performed | Findings |
|----------------|-------------|------------------|----------|
| A. Activities Allowed/Unallowed | {{a_requirement}} | {{a_testing}} | {{a_findings}} |
| B. Allowable Costs/Cost Principles | {{b_requirement}} | {{b_testing}} | {{b_findings}} |
| C. Cash Management | {{c_requirement}} | {{c_testing}} | {{c_findings}} |
| D. Davis-Bacon Act | {{d_requirement}} | {{d_testing}} | {{d_findings}} |
| E. Eligibility | {{e_requirement}} | {{e_testing}} | {{e_findings}} |
| F. Equipment/Real Property | {{f_requirement}} | {{f_testing}} | {{f_findings}} |
| G. Matching/Level of Effort | {{g_requirement}} | {{g_testing}} | {{g_findings}} |
| H. Period of Performance | {{h_requirement}} | {{h_testing}} | {{h_findings}} |
| I. Procurement/Suspended Debarred | {{i_requirement}} | {{i_testing}} | {{i_findings}} |
| J. Program Income | {{j_requirement}} | {{j_testing}} | {{j_findings}} |
| K. Real Property Acquisition | {{k_requirement}} | {{k_testing}} | {{k_findings}} |
| L. Reporting | {{l_requirement}} | {{l_testing}} | {{l_findings}} |
| M. Subrecipient Monitoring | {{m_requirement}} | {{m_testing}} | {{m_findings}} |
| N. Special Tests | {{n_requirement}} | {{n_testing}} | {{n_findings}} |

### Phase 6: Reporting Compliance

| Report | Frequency | Due Date | Filed? | Certified? |
|--------|-----------|----------|--------|------------|
| SF-425 (Federal Financial Report) | Quarterly | {{ffr_due}} | {{ffr_filed}} | {{ffr_certified}} |
| SF-PPR (Performance Progress Report) | Quarterly | {{ppr_due}} | {{ppr_filed}} | {{ppr_certified}} |
| Federal Cash Transactions Report | Quarterly | {{fctr_due}} | {{fctr_filed}} | {{fctr_certified}} |
| Single Audit Reporting Package | Annual | {{single_audit_due}} | {{single_audit_filed}} | {{single_audit_certified}} |
| Indirect Cost Rate Proposal | Annual | {{nicra_due}} | {{nicra_filed}} | {{nicra_certified}} |

## output_format

Present as a grant compliance workpaper package:
1. **Executive Summary** -- compliance status, findings, and risk rating
2. **Cost Allowability Matrix** -- all costs tested against 2 CFR 200
3. **Compliance Checklist** -- 14 compliance areas with pass/fail per program
4. **Findings and Questioned Costs** -- classified by severity
5. **Corrective Action Plan** -- for each finding, with owner and deadline
6. **Reporting Tracker** -- all report submissions and due dates
7. **Schedule of Expenditures of Federal Awards (SEFA)** -- draft

## constraints

- The $750k Single Audit threshold is absolute -- if federal expenditures exceed it, a Single Audit is required
- The de minimis indirect cost rate (10% of MTDC) is not available to organizations that have ever had a NICRA
- Questioned costs must be quantified even if amounts are estimates
- Subrecipient monitoring applies regardless of dollar amount
- The Compliance Supplement is updated annually -- use current year's supplement
- For-profit subrecipients are not subject to Single Audit -- alternative monitoring is required
- Cognizant agency for indirect costs is determined by the largest federal award
