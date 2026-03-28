---
title: Wealth Management -- Client Reporting & Portfolio Analysis
service_line: wealth-management
subcategory: reporting
use_case_type: drafting
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: wealth-sme
reviewer: wealth-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["wealth-management", "client-reporting", "portfolio-analysis", "performance-reporting", "asset-allocation", "claude"]
test_suites: []
---

## system_prompt

I'm a . You present complex investment data in clear, actionable formats that support advisor-client conversations.

## context

- Client Name: {{client_name}}
- Account Type(s): {{account_types}} (taxable / IRA / Roth / trust / joint / corporate)
- Custodian(s): {{custodian}}
- Portfolio Value: {{portfolio_value}}
- Benchmark(s): {{benchmarks}} (S&P 500 / Bloomberg Agg / MSCI EAFE / Custom)
- Reporting Period: {{reporting_period}}
- Client Goal / Time Horizon: {{client_goal}} (retirement / education / wealth transfer / liquidity)

## user_prompt

Prepare a client portfolio reporting and analysis package for {{client_name}}.

### Portfolio Summary

| Account | Beginning Value | Contributions / Withdrawals | Market Appreciation | Ending Value | Allocation % |
|---------|:--------------:|:--------------------------:|:------------------:|:------------:|:-----------:|
| {{acct_1}} | {{begin_1}} | {{net_flows_1}} | {{appreciation_1}} | {{end_1}} | {{allocation_1}}% |
| {{acct_2}} | {{begin_2}} | {{net_flows_2}} | {{appreciation_2}} | {{end_2}} | {{allocation_2}}% |
| **Total** | **{{total_begin}}** | **{{total_flows}}** | **{{total_appreciation}}** | **{{total_end}}** | **100%** |

### Performance Analysis

| Portfolio / Benchmark | 1 Month | 3 Month | YTD | 1 Year | 3 Year (Annualized) | Since Inception |
|:--------------------:|:-------:|:-------:|:---:|:------:|:------------------:|:--------------:|
| Portfolio (Net of Fees) | {{p_1m}}% | {{p_3m}}% | {{p_ytd}}% | {{p_1y}}% | {{p_3y}}% | {{p_si}}% |
| Benchmark ({{benchmark_name}}) | {{b_1m}}% | {{b_3m}}% | {{b_ytd}}% | {{b_1y}}% | {{b_3y}}% | {{b_si}}% |
| Excess Return | {{excess_1m}}% | {{excess_3m}}% | {{excess_ytd}}% | {{excess_1y}}% | {{excess_3y}}% | {{excess_si}}% |

### Asset Allocation vs. Target

| Asset Class | Current % | Target % | Difference | Tactical Commentary |
|:-----------:|:--------:|:--------:|:---------:|:-------------------:|
| US Large Cap Equity | {{us_lc_pct}}% | {{us_lc_target}}% | {{us_lc_diff}}% | {{us_lc_commentary}} |
| US Small/Mid Cap Equity | {{us_sm_pct}}% | {{us_sm_target}}% | {{us_sm_diff}}% | {{us_sm_commentary}} |
| International Equity | {{intl_pct}}% | {{intl_target}}% | {{intl_diff}}% | {{intl_commentary}} |
| Fixed Income | {{fi_pct}}% | {{fi_target}}% | {{fi_diff}}% | {{fi_commentary}} |
| Alternatives | {{alt_pct}}% | {{alt_target}}% | {{alt_diff}}% | {{alt_commentary}} |
| Cash & Equivalents | {{cash_pct}}% | {{cash_target}}% | {{cash_diff}}% | {{cash_commentary}} |

### Top Holdings (Top 10)

| Ticker | Security Name | % of Portfolio | Sector | Market Value |
|:------:|:-------------:|:-------------:|:------:|:-----------:|
| {{ticker_1}} | {{security_1}} | {{pct_1}}% | {{sector_1}} | {{value_1}} |
| {{ticker_2}} | {{security_2}} | {{pct_2}}% | {{sector_2}} | {{value_2}} |
| {{ticker_3}} | {{security_3}} | {{pct_3}}% | {{sector_3}} | {{value_3}} |

### Risk Statistics

| Metric | Portfolio | Benchmark | 
|:------:|:---------:|:---------:|
| Standard Deviation (Annualized) | {{stdev}}% | {{bench_stdev}}% |
| Sharpe Ratio | {{sharpe}} | {{bench_sharpe}} |
| Beta | {{beta}} | 1.00 |
| R-Squared | {{r_squared}}% | 100% |
| Tracking Error | {{tracking_error}}% | -- |
| Information Ratio | {{info_ratio}} | -- |
| Maximum Drawdown (trailing 12mo) | {{max_dd}}% | {{bench_max_dd}}% |

## output_format

Present as a client reporting package: 1. Portfolio Summary, 2. Performance Summary vs. Benchmarks, 3. Asset Allocation vs. Target, 4. Top Holdings, 5. Risk Statistics, 6. Income & Distribution Summary, 7. Rebalancing Recommendations, 8. Market Commentary.

## constraints

- Performance should be calculated using time-weighted return (TWR) for comparative purposes and dollar-weighted return (IRR) for cash-flow heavy accounts
- Net-of-fee performance must be clearly labeled and calculated after deducting advisory fees
- Benchmark selection should match the portfolio's strategic asset allocation and be disclosed
- Holdings-based analysis is recommended when complete account data is available; returns-based when only returns data is available
- Risk statistics (standard deviation, Sharpe, beta) should use trailing 36-month data minimum for meaningful results
- Taxable account reporting should be separated from tax-advantaged to support tax-efficient rebalancing discussions
- Concentrated positions (>10% of portfolio) should be highlighted with risk implications and diversification recommendations
- Performance reporting periods should be consistent -- avoid cherry-picking favorable time periods
- SEC requirements: advertising and performance reporting must be fair, balanced, and not misleading -- no cherry-picking of performance periods
- Rebalancing recommendations should consider trading costs, tax implications (in taxable accounts), and the band-with-rebalancing approach (5% absolute bands typically)
- Client reporting should follow a consistent format and delivery cadence (quarterly standard, monthly for institutional or >$5M accounts)
