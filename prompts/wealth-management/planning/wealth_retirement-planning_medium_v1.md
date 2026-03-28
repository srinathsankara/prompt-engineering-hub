---
title: Retirement Planning Needs Analysis
service_line: wealth-management
subcategory: planning
use_case_type: decision-support
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: prompt-engineering-team
reviewer: wealth-sme
created_date: 2026-02-20
last_modified: 2026-03-10
tags: ["retirement", "financial-planning", "claude"]
test_suites: ["test-cases/wealth-management/retirement-medium.json"]
---

## system_prompt

I'm a . You provide retirement planning analysis tailored to each client's financial situation, goals, and risk tolerance. Your advice is grounded in current tax law and investment principles. Always include appropriate disclaimers about projections and assumptions.

## context

Client profile:
- Age: {{client_age}}
- Annual income: {{annual_income}}
- Current retirement savings: {{current_savings}}
- Monthly contribution: {{monthly_contribution}}
- Risk tolerance: {{risk_tolerance}}
- Retirement age goal: {{retirement_age_goal}}
- Life expectancy estimate: {{life_expectancy}}
- Other income sources: {{other_income_sources}}

## user_prompt

Perform a retirement planning needs analysis for the client described above.

### Analysis Requirements

1. **Retirement Income Target** -- Estimate the annual income needed in retirement based on current lifestyle and inflation assumptions

2. **Savings Gap Analysis** -- Project the value of current savings at retirement age using {{growth_rate_assumption}}% annual return. Calculate the shortfall against the income target.

3. **Contribution Optimization** -- Recommend adjustments to monthly contributions to close any gap. Show the impact of:
   - Increasing contributions by {{increase_option_1}}% and {{increase_option_2}}%
   - Catching up contributions for clients aged 50+
   - Roth vs Traditional tax treatment

4. **Asset Allocation** -- Suggest a target allocation for the accumulation phase and transition to retirement phase based on risk tolerance

5. **Tax Efficiency** -- Identify tax-efficient withdrawal strategies including:
   - Order of withdrawals (taxable, tax-deferred, tax-free)
   - Roth conversion ladder opportunities
   - Required Minimum Distribution (RMD) planning

### Assumptions to State

Clearly document all assumptions used:
- Inflation rate: {{inflation_assumption}}%
- Rate of return pre-retirement: {{growth_rate_assumption}}%
- Rate of return post-retirement: {{post_retirement_return}}%
- Social Security COLA estimates
- Tax rate assumptions at withdrawal

## output_format

Structure the analysis as a client-ready report with:

1. **Executive Summary** -- One-page overview with key numbers and recommendations
2. **Detailed Analysis** -- Section-by-section breakdown with tables
3. **Scenario Comparison** -- Side-by-side comparison of {{increase_option_1}}% vs {{increase_option_2}}% contribution strategies
4. **Action Plan** -- Prioritized steps for the client to implement
5. **Assumptions and Disclaimers** -- Full disclosure of methodology and limitations

Use tables for numerical comparisons. Use clear section headers for readability. End with the standard wealth management disclaimer.
