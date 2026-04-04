---
title: Opportunity Zone (OZ) Fund Investment & Tax Deferral Analysis
service_line: strategic-financing
subcategory: opportunity-zones
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: strategic-financing-sme
reviewer: strategic-financing-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["opportunity-zone", "section-1400z", "capital-gains", "tax-deferral", "qualified-opportunity-fund", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand the interplay between OZ investments and other community development incentives.

## context

- Client: {{client_name}}
- Investment Type: {{investment_type}} (direct QOF / fund-of-funds / self-certified)
- Capital Gain Amount Deferred: {{capital_gain_amount}}
- Gain Recognition Date: {{gain_date}} (realized gain triggering OZ investment)
- OZ Investment Date: {{oz_investment_date}} (must be within 180 days)
- Project Location: {{census_tract}} (must be designated OZ)
- Project Type: {{project_type}} (real estate / operating business / fund)

## user_prompt

Analyze the OZ investment structure and tax benefits for {{client_name}}.

### Capital Gain Deferral & Exclusion

| Component | Calculation | Amount |
|-----------|:----------:|:------:|
| Eligible Capital Gain | {{eligible_gain}} | {{eligible_gain_amount}} |
| Maximum Investment in QOF | 180-day window from gain realization | {{maximum_investment}} |
| **Year 2 (12/31/2026)** | Basis step-up ends | 10% of deferred gain excluded if held 5 years |
| **Year 5 (12/31/2029)** | Basis step-up ends | 15% of deferred gain excluded if held 7 years |
| **Year 7 (12/31/2031)** | Inclusion of remaining deferred gain | Deferred gain recognized (net of step-ups) |
| **Year 10 (12/31/2034)** | Post-2026 indefinite deferral ends | Gain included on 12/31/2026 |
| **Year 10+** | QOF held 10+ years | Exclusion of post-acquisition appreciation |

### OZ Compliance Requirements

| Requirement | Status | Notes |
|-------------|:------:|-------|
| QOF self-certification (Form 8996) | {{qof_cert_status}} | Filed annually with tax return |
| 90% Asset Test: Substantially all assets in OZ | {{asset_test_status}} | {{asset_test_notes}} |
| 50% Gross Income Test (operating business) | {{income_test_status}} | {{income_test_notes}} |
| 70% Tangible Property Test (operating business) | {{property_test_status}} | {{property_test_notes}} |
| Original Use / Substantial Improvement (real estate) | {{improvement_test_status}} | {{improvement_test_notes}} |
| Semi-annual QOF asset compliance testing | {{compliance_testing_status}} | {{compliance_testing_notes}} |
| Form 8997 (OZ investment tracking) | {{8997_status}} | {{8997_notes}} |

## output_format

Present as an OZ investment analysis: 1. Capital Gain Deferral & Exclusion Calculation, 2. QOF Compliance Status, 3. Project Feasibility & Tax Benefits, 4. Interim Period (2026 inclusion) Planning, 5. Exit Strategy & QOF Rollover Options.

## constraints

- Capital gain must be invested in a QOF within 180 days of the gain realization date
- The deferred gain is recognized on December 31, 2026 (or earlier if the QOF investment is disposed) -- plan for inclusion
- Basis step-up: 10% for investments held 5+ years, additional 5% (15% total) for 7+ years
- Post-2026 QOF investments receive the 10% step-up only for year-7 holding period if applicable
- Post-acquisition appreciation exclusion is available after 10-year holding period
- QOF must hold 90% of assets in qualified opportunity zone property (tested semi-annually at calendar year end)
- Real estate developments must satisfy the "original use" or "substantial improvement" test (increase basis by 100% within 30 months)
- Operating businesses must meet the 50% gross income and 70% tangible property tests
- OZ designation lasts until December 31, 2028 -- investments must be made before this date
- State tax treatment of OZ investments varies -- some states conform to federal treatment, others do not
