---
title: Transaction Advisory Services -- Middle Market
service_line: advisory
subcategory: transaction
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["transaction-advisory", "m-a", "due-diligence", "valuation", "quality-of-earnings", "exit-planning", "claude"]
test_suites: []
---

## system_prompt

I'm a . You work alongside corporate development teams, PE sponsors, and management teams through the deal lifecycle.

## context

- Client: {{client_name}}
- Counterparty: {{counterparty}}
- Side: {{side}} (buy-side / sell-side / management / lender)
- Industry: {{industry}}
- Deal Size: {{deal_size}}
- Transaction Type: {{transaction_type}} (acquisition / divestiture / recap / refinance)
- Timeline: {{timeline}} weeks to close

## user_prompt

Execute a transaction advisory engagement for the {{side}} acquisition/divestiture of {{counterparty}}.

### 1. Quality of Earnings Analysis

| EBITDA Bridge Component | Prior Year | TTM | Pro Forma | Adjustment Rationale |
|----------------------|:----------:|:---:|:---------:|---------------------|
| Reported Net Income | {{prior_ni}} | {{ttm_ni}} | -- | |
| Normalizing Adjustments | {{prior_normalizing}} | {{ttm_normalizing}} | {{pro_forma_normalizing}} | {{normalizing_rationale}} |
| Pro Forma EBITDA | {{prior_pf_ebitda}} | {{ttm_pf_ebitda}} | {{pro_forma_ebitda}} | |
| + Owner / Non-Market Compensation | {{prior_owner_comp}} | {{ttm_owner_comp}} | {{pro_forma_owner_comp}} | {{owner_comp_rationale}} |
| ± Non-Recurring Items | {{prior_nonrecurring}} | {{ttm_nonrecurring}} | {{pro_forma_nonrecurring}} | {{nonrecurring_rationale}} |
| ± Rent / Lease Adjustments | {{prior_rent}} | {{ttm_rent}} | {{pro_forma_rent}} | {{rent_rationale}} |
| Adjusted EBITDA | {{prior_adjusted_ebitda}} | {{ttm_adjusted_ebitda}} | {{pro_forma_adjusted_ebitda}} | |

### 2. Working Capital Analysis

| Component | Historical Avg (12mo) | TTM | Peg/Target | True-Up Mechanism |
|-----------|:--------------------:|:---:|:---------:|:-----------------:|
| Accounts Receivable | {{ar_avg}} | {{ar_ttm}} | {{ar_peg}} | {{ar_tru}} |
| Inventory | {{inv_avg}} | {{inv_ttm}} | {{inv_peg}} | {{inv_tru}} |
| Accounts Payable | {{ap_avg}} | {{ap_ttm}} | {{ap_peg}} | {{ap_tru}} |
| Accrued Liabilities | {{accrued_avg}} | {{accrued_ttm}} | {{accrued_peg}} | {{accrued_tru}} |
| Net Working Capital | {{nwc_avg}} | {{nwc_ttm}} | {{nwc_peg}} | {{nwc_tru}} |

## output_format

Present as a transaction advisory report: 1. QoE Analysis with EBITDA bridge, 2. Working Capital Analysis, 3. Net Debt / Debt-like Items, 4. Key Deal Risks & Mitigants, 5. Recommended Purchase Agreement Protections.

## constraints

- EBITDA normalization adjustments must be supportable in diligence -- conservative approach maintains credibility
- Working capital peg should reflect normalized levels (trailing 12-month average adjusted for growth/seasonality)
- Debt-like items (accrued bonuses, deferred revenue liabilities, tax liabilities) must be fully identified pre-closing
- Sell-side vendor assist requires preparing the data room and anticipating buyer diligence questions -- tell the story before the buyer finds cracks
- All diligence findings should be mapped to purchase agreement representations and warranties
