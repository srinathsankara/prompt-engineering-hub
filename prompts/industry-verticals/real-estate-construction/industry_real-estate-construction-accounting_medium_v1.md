---
title: Real Estate & Construction -- Accounting, Tax & Project Management
service_line: industry-verticals
subcategory: real-estate-construction
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: industry-sme
reviewer: industry-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["real-estate", "construction", "percentage-of-completion", "asc-606", "cost-plus", "wip", "1031-exchange", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand percentage-of-completion accounting (ASC 606 for construction, ASC 360 for real estate), cost segregation, 1031 exchanges, REIT taxation, and job cost management.

## context

- Client: {{client_name}}
- Business Type: {{business_type}} (developer / general contractor / subcontractor / property manager / real estate fund / REIT)
- Project Types: {{project_types}} (commercial / residential / infrastructure / industrial / mixed-use)
- Annual Revenue / Project Volume: {{annual_revenue}}
- Accounting Method: {{accounting_method}} (POC / completed contract / cash / accrual)
- Bonding Capacity: {{bonding_capacity}}

## user_prompt

Provide accounting, tax, and project management analysis for {{client_name}}, a {{business_type}}.

### Contract Revenue & Cost Recognition

| Project | Contract Value | % Complete | Recognized Revenue | Recognized Cost | Billings to Date | Over/Under Billed |
|---------|:------------:|:----------:|:-----------------:|:--------------:|:----------------:|:-----------------:|
| {{project_1}} | {{contract_1}} | {{pct_complete_1}}% | {{rev_1}} | {{cost_1}} | {{billings_1}} | {{over_under_1}} |
| {{project_2}} | {{contract_2}} | {{pct_complete_2}}% | {{rev_2}} | {{cost_2}} | {{billings_2}} | {{over_under_2}} |

### Job Cost Analysis

| Project | Original Budget | Current Budget | Actual Cost | Variance | Variance % | Explanation |
|---------|:-------------:|:-------------:|:----------:|:--------:|:---------:|-------------|
| {{jc_project_1}} | {{orig_budget_1}} | {{current_budget_1}} | {{actual_cost_1}} | {{variance_1}} | {{variance_pct_1}}% | {{explanation_1}} |
| {{jc_project_2}} | {{orig_budget_2}} | {{current_budget_2}} | {{actual_cost_2}} | {{variance_2}} | {{variance_pct_2}}% | {{explanation_2}} |

### Tax Considerations

| Topic | Applicable? | Current Approach | Recommendation |
|-------|:----------:|:----------------:|:--------------:|
| Section 1031 Like-Kind Exchange | {{lk_exchange_applicable}} | {{lk_exchange_current}} | {{lk_exchange_rec}} |
| Cost Segregation Study | {{cost_seg_applicable}} | {{cost_seg_current}} | {{cost_seg_rec}} |
| REIT Qualification (if applicable) | {{reit_applicable}} | {{reit_current}} | {{reit_rec}} |
| Opportunity Zone Fund | {{oz_applicable}} | {{oz_current}} | {{oz_rec}} |
| Payroll / Certified Payroll (Prevailing Wage) | {{prevailing_wage_applicable}} | {{prevailing_wage_current}} | {{prevailing_wage_rec}} |
| Sales & Use Tax on Materials | {{sales_tax_applicable}} | {{sales_tax_current}} | {{sales_tax_rec}} |

## output_format

Present as a real estate and construction engagement report: 1. Project Portfolio Summary, 2. Revenue Recognition Analysis (POC / Completed Contract), 3. Job Cost Variance Analysis, 4. WIP Schedule (Over/Under Billed), 5. Tax Planning Opportunities, 6. Bonding Capacity Review.

## constraints

- Percentage-of-completion accounting requires reliable cost estimates -- review quarterly for material changes
- Over/under-billed positions on the WIP schedule are a key audit area and banker/bonding concern
- Job cost systems must accurately track direct labor, material, equipment, and allocable overhead per contract
- Section 263A (UNICAP) may apply to real estate developers constructing for sale -- capitalizing indirect costs
- Prevailing wage (Davis-Bacon) on public works projects requires certified payroll reporting -- non-compliance carries debarment risk
- Real estate developers should track avoidable vs. unavoidable cost overruns for loan covenant compliance
- REIT qualification requires 90% of taxable income distribution and specific asset/income tests
