---
title: Transaction Tax -- State & Local Tax (SALT) Planning for M&A
service_line: transactions
subcategory: transaction-tax
use_case_type: planning
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: transactions-sme
reviewer: transactions-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["transaction-tax", "salt", "state-tax", "mergers-acquisitions", "sales-use-tax", "nexus", "reorganization", "claude"]
test_suites: []
---

## system_prompt

I've advised on SALT in M&A deals where the structure decision made a $50M difference in state tax liability. Stock vs. asset is the headline, but nexus and apportionment are where the surprises hide. You understand how deal structure (stock vs. asset) and target operations drive SALT exposure.

## context

- Transaction: {{transaction_name}}
- Structure: {{structure}} (stock / asset / 338(h)(10) / merger / conversion)
- Target Operating States: {{target_states}}
- Buyer Operating States: {{buyer_states}}
- Target Revenue: {{target_revenue}}
- Target PP&E: {{target_ppe}}
- Target Payroll: {{target_payroll}}
- Key SALT Concern: {{salt_concern}}

## user_prompt

Identify SALT risks and planning opportunities for the acquisition/restructuring of {{transaction_name}}.

### State Tax Nexus & Filing Requirements

| State | Physical Nexus | Economic Nexus | Filing Requirement | Historical Compliance | Risk Level |
|:----:|:-------------:|:-------------:|:-----------------:|:--------------------:|:---------:|
| {{state_1}} | {{physical_nexus_1}} | {{economic_nexus_1}} | {{filing_req_1}} | {{compliance_1}} | {{risk_1}} |
| {{state_2}} | {{physical_nexus_2}} | {{economic_nexus_2}} | {{filing_req_2}} | {{compliance_2}} | {{risk_2}} |

### Sales & Use Tax Exposure

| State | Tax Rate | Product/Service Classification | Exemption Status | Historical Exposure | Mitigation |
|:----:|:-------:|:-----------------------------:|:----------------:|:------------------:|:---------:|
| {{state_st_1}} | {{rate_1}}% | {{classification_1}} | {{exemption_1}} | {{exposure_1}} | {{mitigation_1}} |
| {{state_st_2}} | {{rate_2}}% | {{classification_2}} | {{exemption_2}} | {{exposure_2}} | {{mitigation_2}} |

### Transfer / Recording Taxes

| Tax Type | State(s) | Rate | Triggering Event | Estimated Cost | Planning Opportunity |
|----------|:--------:|:----:|:---------------:|:-------------:|:-------------------:|
| Real Estate Transfer Tax | {{transfer_states}} | {{transfer_rate}}% | {{transfer_trigger}} | {{transfer_cost}} | {{transfer_planning}} |
| Stock Transfer / Documentary Tax | {{stock_transfer_states}} | {{stock_transfer_rate}}% | {{stock_transfer_trigger}} | {{stock_transfer_cost}} | {{stock_transfer_planning}} |
| Mortgage Recording Tax | {{mortgage_states}} | {{mortgage_rate}}% | {{mortgage_trigger}} | {{mortgage_cost}} | {{mortgage_planning}} |

### State Income / Franchise Tax Implications

| State | Apportionment Method | NOL Utilization Post-Change | Combined Reporting? | Estimated Tax Impact |
|:----:|:-------------------:|:-------------------------:|:------------------:|:-------------------:|
| {{state_it_1}} | {{apportionment_1}} | {{nol_treatment_1}} | {{combined_1}} | {{impact_1}} |
| {{state_it_2}} | {{apportionment_2}} | {{nol_treatment_2}} | {{combined_2}} | {{impact_2}} |

## output_format

Present as a transaction SALT planning report: 1. State Nexus & Filing Risk Matrix, 2. Sales & Use Tax Exposure by State, 3. Transfer Tax Analysis, 4. State Income/Franchise Tax Apportionment Impact, 5. Estimated Aggregate SALT Exposure, 6. Pre-Closing Compliance & Remediation Plan.

## constraints

- Stock acquisitions generally do not trigger sales/use tax on the transaction itself -- asset acquisitions may require bulk sale compliance
- Economic nexus thresholds vary by state (generally $100K-$500K in sales or 200 transactions) -- Wayfair standard applies to all states with remote seller rules
- Sales tax classification of products/services varies dramatically by state -- software as a service (SaaS) may be taxable in some states and exempt in others
- SALT due diligence should identify unregistered states (nexus exposure), unreported use tax on purchases, and historical tax liability
- State NOL limitations post-ownership change follow the IRC 382 framework but states may not fully conform -- check each state's rules
- Combined vs. separate reporting states: 28 states require combined reporting -- transaction structure affects how target income is apportioned and reported post-acquisition
- Real estate transfer taxes can be significant (1-3% of property value in some jurisdictions) and are often overlooked in deal modeling
- Bulk sale notification requirements: most states require notification to tax authorities before acquiring business assets -- failure can result in successor liability
- Payroll / unemployment tax implications: acquiring entity assumes state unemployment tax experience rating in some states
- State tax amnesty programs: evaluate whether target's historical state tax exposure can be resolved through voluntary disclosure or amnesty programs
