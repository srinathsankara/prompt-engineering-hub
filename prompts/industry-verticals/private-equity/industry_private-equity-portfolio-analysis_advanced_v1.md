---
title: Private Equity -- Portfolio Company Financial Analysis & Support
service_line: industry-verticals
subcategory: private-equity
use_case_type: analysis
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: industry-sme
reviewer: industry-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["private-equity", "portfolio-monitoring", "carried-interest", "fund-accounting", "management-company", "waterfall", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand fund structuring (carried interest, waterfall distributions, management fees), portfolio monitoring, tax compliance (K-1, 1065), and portfolio company financial performance analysis.

## context

- Client Type: {{client_type}} (fund / management company / portfolio company / GP)
- Fund Strategy: {{fund_strategy}} (buyout / growth / venture / real estate / credit / fund-of-funds)
- AUM: {{aum}}
- Fund Vintage: {{fund_vintage}}
- Portfolio Company Count: {{portfolio_count}}
- Key Engagement: {{key_engagement}}

## user_prompt

Perform financial analysis and support for the PE client engagement involving {{client_type}} {{client_name}}.

### Fund Performance Monitoring

| Metric | Fund | Benchmark (by vintage) | Quartile | Trend |
|--------|:---:|:---------------------:|:--------:|:-----:|
| Gross IRR | {{gross_irr}}% | {{benchmark_irr}}% | {{quartile_irr}} | {{trend_irr}} |
| Net IRR | {{net_irr}}% | {{benchmark_net_irr}}% | {{quartile_net}} | {{trend_net}} |
| MOIC (Gross) | {{gross_moic}}x | {{benchmark_moic}}x | {{quartile_moic}} | {{trend_moic}} |
| DPI (Distributions to Paid-In) | {{dpi}}x | {{benchmark_dpi}}x | {{quartile_dpi}} | {{trend_dpi}} |
| RVPI (Residual Value to Paid-In) | {{rvpi}}x | {{benchmark_rvpi}}x | {{quartile_rvpi}} | {{trend_rvpi}} |
| TVPI (Total Value to Paid-In) | {{tvpi}}x | {{benchmark_tvpi}}x | {{quartile_tvpi}} | {{trend_tvpi}} |

### Portfolio Company Health Dashboard

| Company | Revenue | EBITDA | Debt / EBITDA | Revenue Growth | Margin Trend | Watch List? |
|--------|:------:|:------:|:------------:|:-------------:|:-----------:|:----------:|
| {{port_co_1}} | {{revenue_1}} | {{ebitda_1}} | {{leverage_1}}x | {{revenue_growth_1}}% | {{margin_trend_1}} | {{watch_list_1}} |
| {{port_co_2}} | {{revenue_2}} | {{ebitda_2}} | {{leverage_2}}x | {{revenue_growth_2}}% | {{margin_trend_2}} | {{watch_list_2}} |

### Fund Economics & Waterfall

| Tier | Hurdle Rate | GP Catch-Up % | Carry Split | Current Waterfall Status | Projected GP Carry |
|:---:|:----------:|:-------------:|:----------:|:----------------------:|:-----------------:|
| 1 -- Return of Capital | -- | -- | 100% to LPs | {{tier_1_status}} | -- |
| 2 -- Preferred Return | {{hurdle}}% | -- | 100% to LPs | {{tier_2_status}} | -- |
| 3 -- GP Catch-Up | -- | {{catch_up}}% | 100% to GP | {{tier_3_status}} | {{projected_gp_carry}} |
| 4 -- Residual Split | -- | -- | {{lp_split}}% LP / {{gp_split}}% GP | {{tier_4_status}} | {{projected_residual_carry}} |

## output_format

Present as a PE client report: 1. Fund Performance Dashboard (IRR, MOIC, quartile rankings), 2. Portfolio Company Health Dashboard, 3. Fund Economics & Waterfall Analysis, 4. Management Company Assessment, 5. Tax & Compliance Calendar, 6. Key Recommendations.

## constraints

- IRR calculations should use the cash flow-based method consistent with ILPA reporting standards
- Fund expenses (management fees, organizational costs, deal expenses) must be tracked separately and allocated per LPA terms
- Carried interest waterfall distributions follow the LPA -- verify the order of tiers and GP catch-up percentage before modeling
- Portfolio company watch list triggers: debt/EBITDA >5x, negative revenue growth, EBITDA margin decline >500bps, covenant breach
- Management company tax structuring must address UBTI, ECI, and blocker corporation considerations for tax-exempt LPs
- Portfolio company add-on acquisitions require diligence integration planning and monitoring of combined covenant compliance
- SEC private fund adviser rules impose additional reporting, audit, and compliance requirements for registered advisers
