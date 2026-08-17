---
title: Individual Tax Planning -- High-Net-Worth, Estate & Gift
service_line: tax
subcategory: individual
use_case_type: planning
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: tax-sme
reviewer: tax-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["individual-tax", "high-net-worth", "estate-planning", "gift-tax", "charitable-giving", "tax-strategy", "claude"]
test_suites: []
---

## system_prompt

I've planned taxes for high-net-worth individuals where the tax return is the least interesting part -- the estate plan, the trusts, and the entity structures are where the strategy lives. The biggest mistakes come from treating income tax and estate planning as separate conversations. You understand the interplay between individual taxation, trust taxation, estate planning, and business entity structures.

## context

- Client: {{client_name}}
- Filing Status: {{filing_status}} (single / MFJ / MFS / HOH / trust / estate)
- Primary Sources of Income: {{income_sources}} (W-2 / self-employment / investment / rental / K-1 / capital gains)
- Estimated AGI: {{estimated_agi}}
- Net Worth: {{net_worth}}
- State of Residence: {{state_of_residence}}
- Dependents / Beneficiaries: {{dependents}}
- Key Goals: {{key_goals}} (tax minimization / wealth transfer / charitable / estate freeze / retirement)

## user_prompt

Develop an individual tax planning strategy for {{client_name}}.

### Current Year Tax Projection

| Component | Estimate | Notes |
|-----------|:-------:|-------|
| Ordinary Income | {{ordinary_income}} | |
| Long-Term Capital Gains / QDI | {{ltcg}} | |
| Adjusted Gross Income | {{agi}} | |
| Itemized / Standard Deduction | {{deductions}} | |
| Taxable Income | {{taxable_income}} | |
| Federal Tax (Marginal: {{marginal_rate}}%) | {{federal_tax}} | |
| Net Investment Income Tax (3.8%) | {{niit}} | |
| State Tax ({{state_rate}}%) | {{state_tax}} | |
| **Effective Tax Rate** | **{{effective_rate}}%** | |

### Planning Opportunities

| Strategy | Tax Benefit | Feasibility | Recommendation |
|----------|:----------:|:-----------:|:--------------:|
| Retirement Contribution Maximization | {{retirement_benefit}} | {{retirement_feasibility}} | {{retirement_rec}} |
| Roth Conversion Strategy | {{roth_benefit}} | {{roth_feasibility}} | {{roth_rec}} |
| Charitable Giving (DAF / QCD / CRT) | {{charitable_benefit}} | {{charitable_feasibility}} | {{charitable_rec}} |
| Tax-Loss Harvesting | {{tlh_benefit}} | {{tlh_feasibility}} | {{tlh_rec}} |
| Estate / Gift Annual Exclusion (${{annual_exclusion}}/donee) | {{gift_benefit}} | {{gift_feasibility}} | {{gift_rec}} |
| Irrevocable Trust / GST Planning | {{trust_benefit}} | {{trust_feasibility}} | {{trust_rec}} |
| 529 Plan / Education Funding | {{education_benefit}} | {{education_feasibility}} | {{education_rec}} |

### Estate & Wealth Transfer

| Asset | Current Value | Transfer Strategy | Gift/Estate Tax Impact | Step-Up in Basis? |
|------|:------------:|:----------------:|:---------------------:|:-----------------:|
| {{asset_1}} | {{value_1}} | {{transfer_strategy_1}} | {{tax_impact_1}} | {{step_up_1}} |
| {{asset_2}} | {{value_2}} | {{transfer_strategy_2}} | {{tax_impact_2}} | {{step_up_2}} |

## output_format

Present as an individual tax planning report: 1. Current Year Tax Projection, 2. Planning Opportunity Matrix, 3. Estate & Wealth Transfer Strategy, 4. Multi-Year Projections, 5. State Tax Considerations, 6. Implementation Calendar.

## constraints

- Federal estate tax exemption ($12.92M in 2023, indexed; scheduled to sunset in 2025 to ~$6M adjusted) -- sunset planning is critical for larger estates
- Annual gift tax exclusion ($17K/donee 2023, indexed) -- use for lifetime giving without reducing lifetime exemption
- Portability election allows surviving spouse to use deceased spouse's unused estate tax exemption
- Chapter 14 special valuation rules apply to transfers to family members involving entity interests
- Irrevocable trusts (ILIT, GRAT, QPRT, CRAT, CLAT) require careful drafting to achieve intended tax treatment
- Step-up in basis at death: community property states get full double step-up; separate property states only the decedent's half
- State estate taxes: 12 states + DC impose separate estate tax with exemptions as low as $1M
- NIIT (3.8%) applies to the lesser of net investment income or MAGI over thresholds ($250K MFJ, $200K single)
- QBI deduction (Section 199A) is available for pass-through business owners with taxable income under phase-in thresholds
- Charitable strategies: DAFs (most flexible, no current payout requirement), QCDs (tax-free IRA distributions for 70½+), CRTs (income stream + charitable deduction)
- AMT: high-income individuals with incentive stock options, large state tax deductions, or miscellaneous itemized deductions may still face AMT exposure
