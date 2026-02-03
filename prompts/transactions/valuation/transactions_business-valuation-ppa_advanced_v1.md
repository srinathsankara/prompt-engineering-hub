---
title: Business Valuation & Purchase Price Allocation (ASC 805 / IRC 1060)
service_line: transactions
subcategory: valuation
use_case_type: analysis
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: transactions-sme
reviewer: transactions-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["valuation", "purchase-price-allocation", "asc-805", "irc-1060", "goodwill", "intangible-assets", "fair-value", "dlom", "dloc", "market-approach", "income-approach", "claude"]
test_suites: []
---

## system_prompt

I provide fair value opinions, purchase price allocations (ASC 805), goodwill impairment testing (ASC 350), and portfolio valuation for financial reporting and tax purposes. I use income approach (DCF, multi-period excess earnings), market approach (guideline public company, guideline transaction), and asset-based approach. The methodology depends on the asset you're valuing -- using a DCF for a startup with no revenue history is a waste of everyone's time.

Core areas I work in:
- ASC 805 business combinations -- identifying intangible assets, goodwill, bargain purchase
- ASC 350 goodwill impairment -- qualitative assessment, quantitative testing, DCF
- IRC 1060 / 338 residual allocation -- Class I-IV asset classification
- Equity valuation -- common/preferred stock, options, warrants, equity vs liability classification
- Control premiums and DLOC/DLOM quantification

## context

**Transaction:**
- Transaction Type: {{transaction_type}} (business combination / asset acquisition / 338 / tax restructuring)
- Target: {{target_name}}
- Industry: {{industry}}
- Transaction Date: {{transaction_date}}
- Consideration Transferred: {{consideration_value}}
- Consideration Form: {{consideration_form}} (cash / stock / contingent consideration / earnout / mix)
- Acquisition Method: {{acquisition_method}} (full goodwill / partial goodwill)
- Public / Private: {{target_public_status}}

**Target Financials (as of {{valuation_date}}):**
- Revenue (TTM): {{revenue_ttm}}
- EBITDA (TTM): {{ebitda_ttm}}
- Net Assets (Book Basis): {{net_assets_book}}
- Identifiable Intangible Assets (on balance sheet): {{identified_intangibles}}
- Goodwill (on balance sheet): {{goodwill_balance}}
- Projections available: {{projections_available}} (Yes / No; duration: {{projection_period}} years)

## user_prompt

Perform a business valuation and purchase price allocation analysis for the acquisition of {{target_name}}.

### Phase 1: Business Enterprise Value

**Income Approach -- Discounted Cash Flow Method:**

| Input | Value | Source / Support |
|-------|-------|-----------------|
| Projection period | {{projection_years}} years | |
| Terminal value method | {{terminal_value_method}} (Gordon Growth / Exit EBITDA) | |
| Terminal growth rate | {{terminal_growth}}% | |
| WACC | {{wacc}}% | |
| Cost of equity (CAPM) | {{cost_of_equity}}% | |
| Risk-free rate | {{risk_free}}% | |
| Beta (levered) | {{beta_levered}} | |
| Equity risk premium | {{equity_risk_premium}}% | |
| Size premium | {{size_premium}}% | |
| Cost of debt (pre-tax) | {{cost_of_debt}}% | |
| Debt / Total Capital | {{debt_to_capital}}% | |

**DCF Projection:**
| Line Item | Year 1 | Year 2 | Year 3 | Year 4 | Year 5 | Terminal |
|-----------|--------|--------|--------|--------|--------|----------|
| Revenue | {{dcf_rev_1}} | {{dcf_rev_2}} | {{dcf_rev_3}} | {{dcf_rev_4}} | {{dcf_rev_5}} | |
| Revenue growth | {{dcf_growth_1}}% | {{dcf_growth_2}}% | {{dcf_growth_3}}% | {{dcf_growth_4}}% | {{dcf_growth_5}}% | {{terminal_growth}}% |
| EBITDA margin | {{dcf_margin_1}}% | {{dcf_margin_2}}% | {{dcf_margin_3}}% | {{dcf_margin_4}}% | {{dcf_margin_5}}% | {{terminal_margin}}% |
| NOPAT | {{dcf_nopat_1}} | {{dcf_nopat_2}} | {{dcf_nopat_3}} | {{dcf_nopat_4}} | {{dcf_nopat_5}} | |
| D&A | {{dcf_da_1}} | {{dcf_da_2}} | {{dcf_da_3}} | {{dcf_da_4}} | {{dcf_da_5}} | |
| Capex | {{dcf_capex_1}} | {{dcf_capex_2}} | {{dcf_capex_3}} | {{dcf_capex_4}} | {{dcf_capex_5}} | |
| Δ Working Capital | {{dcf_wc_1}} | {{dcf_wc_2}} | {{dcf_wc_3}} | {{dcf_wc_4}} | {{dcf_wc_5}} | |
| Free Cash Flow | {{dcf_fcf_1}} | {{dcf_fcf_2}} | {{dcf_fcf_3}} | {{dcf_fcf_4}} | {{dcf_fcf_5}} | {{dcf_terminal_value}} |
| Discount factor | {{dcf_df_1}} | {{dcf_df_2}} | {{dcf_df_3}} | {{dcf_df_4}} | {{dcf_df_5}} | {{dcf_df_terminal}} |
| PV of Cash Flow | {{dcf_pv_1}} | {{dcf_pv_2}} | {{dcf_pv_3}} | {{dcf_pv_4}} | {{dcf_pv_5}} | {{dcf_pv_terminal}} |

**Enterprise Value (Income Approach):** {{ev_income}} = Sum of PV FCFs + PV Terminal Value

**Market Approach -- Guideline Public Company Method:**

| Guideline Company | Ticker | Revenue | EBITDA | EV/Revenue | EV/EBITDA | EV/EBIT | P/E |
|------------------|--------|---------|--------|-----------|-----------|---------|-----|
| {{guideline_1}} | {{ticker_1}} | {{g_rev_1}} | {{g_ebitda_1}} | {{g_ev_rev_1}}x | {{g_ev_ebitda_1}}x | {{g_ev_ebit_1}}x | {{g_pe_1}}x |
| {{guideline_2}} | {{ticker_2}} | {{g_rev_2}} | {{g_ebitda_2}} | {{g_ev_rev_2}}x | {{g_ev_ebitda_2}}x | {{g_ev_ebit_2}}x | {{g_pe_2}}x |
| {{guideline_3}} | {{ticker_3}} | {{g_rev_3}} | {{g_ebitda_3}} | {{g_ev_rev_3}}x | {{g_ev_ebitda_3}}x | {{g_ev_ebit_3}}x | {{g_pe_3}}x |

| Statistic | EV/Revenue | EV/EBITDA | EV/EBIT |
|-----------|-----------|-----------|---------|
| Mean | {{mean_ev_rev}}x | {{mean_ev_ebitda}}x | {{mean_ev_ebit}}x |
| Median | {{median_ev_rev}}x | {{median_ev_ebitda}}x | {{median_ev_ebit}}x |
| Selected Multiple | {{selected_ev_rev}}x | {{selected_ev_ebitda}}x | {{selected_ev_ebit}}x |

**Enterprise Value (Market Approach -- Revenue):** {{ev_market_revenue}}
**Enterprise Value (Market Approach -- EBITDA):** {{ev_market_ebitda}}
**Enterprise Value (Market Approach -- EBIT):** {{ev_market_ebit}}

**Enterprise Value (Market Approach -- Guideline Transactions):**
| Transaction | Target | EV | EV/Revenue | EV/EBITDA | Date |
|------------|--------|----|-----------|-----------|------|
| {{guideline_transaction_1}} | {{gt_target_1}} | {{gt_ev_1}} | {{gt_ev_rev_1}}x | {{gt_ev_ebitda_1}}x | {{gt_date_1}} |
| {{guideline_transaction_2}} | {{gt_target_2}} | {{gt_ev_2}} | {{gt_ev_rev_2}}x | {{gt_ev_ebitda_2}}x | {{gt_date_2}} |

**Enterprise Value (Market Approach -- Transactions):** {{ev_market_transactions}}

**Market Approach -- Control / Marketability Adjustments:**
| Adjustment | Value | Basis |
|-----------|-------|-------|
| Control premium (acquirer perspective) | {{control_premium}}% | {{control_premium_basis}} |
| DLOC / lack of control (minority) | {{dloc}}% | {{dloc_basis}} |
| DLOM / illiquidity discount | {{dlom}}% | {{dlom_basis}} |

**Selected Enterprise Value:** {{selected_ev}} (weighting: {{income_weight}}% income / {{market_weight}}% market)

**Enterprise Value to Equity Value Bridge:**
| Component | Amount | Notes |
|-----------|--------|-------|
| Enterprise Value | {{selected_ev}} | |
| Plus: Excess cash | {{excess_cash}} | |
| Plus: Non-operating assets | {{non_operating_assets}} | |
| Less: Interest-bearing debt | {{interest_bearing_debt}} | |
| Less: Preferred stock | {{preferred_stock}} | |
| Less: Non-controlling interest | {{nci}} | |
| **Equity Value** | {{equity_value}} | |

### Phase 2: Purchase Price Allocation (ASC 805 / IRC 1060)

**Step 1: Determine the Acquirer**
Acquirer: {{acquirer_name}}
Control determination: {{control_basis}} (voting interest / variable interest / contract)

**Step 2: Determine the Acquisition Date**
Acquisition Date: {{acquisition_date}}

**Step 3: Recognize & Measure Assets Acquired and Liabilities Assumed**

| Asset/Liability Class | Fair Value at Acquisition | Pre-Acquisition Carrying Value | Gain/(Loss) |
|----------------------|--------------------------|-------------------------------|-------------|
| Cash & cash equivalents | {{fv_cash}} | {{book_cash}} | {{adj_cash}} |
| Accounts receivable | {{fv_ar}} | {{book_ar}} | {{adj_ar}} |
| Inventory (adjusted to NRV/market) | {{fv_inventory}} | {{book_inventory}} | {{adj_inventory}} |
| PP&E (land, building, machinery) | {{fv_ppe}} | {{book_ppe}} | {{adj_ppe}} |
| Identifiable intangible assets | {{fv_intangibles}} | {{book_intangibles}} | {{adj_intangibles}} |
| Goodwill (pre-existing) | -- | {{book_goodwill_acq}} | -- (eliminated) |
| Other assets | {{fv_other_assets}} | {{book_other_assets}} | {{adj_other_assets}} |
| Accounts payable & accrued | {{fv_ap}} | {{book_ap}} | {{adj_ap}} |
| Debt (assumed) | {{fv_debt}} | {{book_debt}} | {{adj_debt}} |
| Deferred revenue | {{fv_deferred_rev}} | {{book_deferred_rev}} | {{adj_deferred_rev}} |
| Deferred tax assets / liabilities | {{fv_dta_dtl}} | {{book_dta_dtl}} | {{adj_dta_dtl}} |
| Contingent consideration (liability) | {{fv_contingent}} | -- | -- |
| Other liabilities | {{fv_other_liabilities}} | {{book_other_liabilities}} | {{adj_other_liabilities}} |
| **Net Assets Acquired** | {{fv_net_assets}} | {{book_net_assets}} | {{adj_net_assets}} |

**Step 4: Identifiable Intangible Assets Valuation**

| Intangible Category | Fair Value | Useful Life | Amortization Method | Valuation Method |
|--------------------|------------|-------------|--------------------|------------------|
| Customer relationships | {{fv_customer_relationships}} | {{life_customer_relationships}} years | {{amort_customer_relationships}} | MEEM / MPEEM |
| Trade name / trademark | {{fv_tradename}} | {{life_tradename}} years (indefinite: {{tradename_indefinite}}) | {{amort_tradename}} | Relief from Royalty |
| Developed technology | {{fv_developed_technology}} | {{life_developed_technology}} years | {{amort_developed_technology}} | RFR / MEEM |
| Patents / IP | {{fv_patents}} | {{life_patents}} years | {{amort_patents}} | RFR / MEEM |
| Non-compete agreements | {{fv_noncompete}} | {{life_noncompete}} years | {{amort_noncompete}} | With-and-Without / MEEM |
| Assembled workforce | {{fv_workforce}} | -- | Not recognized (ASC 805) | -- |
| Backlog | {{fv_backlog}} | {{life_backlog}} years | {{amort_backlog}} | MEEM |
| In-process R&D | {{fv_iprd}} | Indefinite until completion | -- | RFR / MEEM |
| Supplier relationships | {{fv_supplier_relationships}} | {{life_supplier_relationships}} years | {{amort_supplier_relationships}} | MEEM |
| Favorable leaseholds | {{fv_favorable_leases}} | {{life_favorable_leases}} years | {{amort_favorable_leases}} | Differential |

**Step 5: Residual Goodwill Calculation**

| Line Item | Amount |
|-----------|--------|
| Consideration transferred (total purchase price) | {{consideration_transferred}} |
| Plus: NCI at fair value (full goodwill method) | {{nci_fv}} |
| Plus: Previously held equity interest (step acquisition) | {{previously_held}} |
| Total acquisition-date fair value | {{total_acquisition_fv}} |
| Less: Recognized net assets at fair value | {{fv_net_assets}} |
| Less: Intangible assets recognized | {{fv_intangibles}} |
| **Residual Goodwill (bargain purchase if negative)** | {{residual_goodwill}} |

**Step 6: Deferred Tax Implications**

| Tax Item | DTA/DTL | Amount | Rationale |
|----------|---------|--------|-----------|
| Step-up in tax basis (asset sale) vs. carryover (stock sale) | {{tax_basis_treatment}} | {{tax_basis_amount}} | |
| Goodwill tax deductibility | {{goodwill_tax_deductible}} | {{goodwill_tax_amount}} | 15-year amortization vs. non-amortizable |
| Tax amortization of identified intangibles | {{intangible_tax_amort}} | {{intangible_tax_amount}} | |
| NOL / tax credit carryforwards | {{nol_credit_dta}} | {{nol_credit_amount}} | Subject to 382 analysis |
| Valuation allowance assessment | {{valuation_allowance}} | {{valuation_allowance_amount}} | More likely than not standard |
| Net deferred tax impact | {{net_dta_dtl}} | {{net_dta_dtl_amount}} | |

### Phase 3: Goodwill Impairment Testing (if applicable)

**Qualitative Assessment (Step 0):**
- [ ] Macroeconomic conditions (interest rates, inflation, GDP)
- [ ] Industry-specific factors (regulatory, competitive, technological)
- [ ] Entity-specific events (change in key personnel, loss of major customer, restructuring)
- [ ] Market considerations (stock price decline, market cap below book equity)
- [ ] Financial performance (revenue/earnings decline, budget variance)

**Quantitative Assessment:**
| Reporting Unit | Carrying Value | Fair Value | Excess/(Deficit) | Impairment? |
|---------------|---------------|------------|-----------------|-------------|
| {{reporting_unit_1}} | {{carrying_1}} | {{fair_value_1}} | {{excess_1}} | {{impairment_1}} |
| {{reporting_unit_2}} | {{carrying_2}} | {{fair_value_2}} | {{excess_2}} | {{impairment_2}} |

### Phase 4: Reporting & Disclosure

**ASC 805 Disclosure Requirements:**
- [ ] Acquisition date and consideration transferred
- [ ] Assets acquired and liabilities assumed (by major class)
- [ ] Identifiable intangible assets (by class, fair value, useful life)
- [ ] Goodwill allocated (by reporting unit)
- [ ] Contingent consideration terms and fair value
- [ ] Pro forma revenue and earnings (period + comparable prior period)
- [ ] Acquisition costs (expensed as incurred)
- [ ] Step-acquisition accounting (if applicable)
- [ ] Bargain purchase gain (if applicable) and supporting rationale

## output_format

Present as a complete valuation and PPA report:
1. **Executive Summary** -- concluded enterprise/equity value, goodwill, identified intangibles
2. **Business Enterprise Valuation** -- income approach (DCF), market approach (guideline companies + transactions), reconciliation
3. **Purchase Price Allocation** -- ASC 805 fair value by asset/liability class
4. **Intangible Asset Valuation** -- MEEM, RFR, with-and-without methodology outputs
5. **Goodwill Reconciliation** -- residual calculation, impairment assessment
6. **Tax Impact** -- DTA/DTL schedule, 382 analysis, tax amortization benefit
7. **Disclosure Checklist** -- ASC 805 / IRC 1060 disclosure requirements

## constraints

- ASC 805 requires fair value measurement for all identifiable assets and liabilities assumed -- assembled workforce is NOT a recognized intangible
- MEEM (Multi-Period Excess Earnings Method) is the preferred method for customer relationships and certain intangibles with identifiable cash flows
- Relief from Royalty (RFR) method applies to trade names, trademarks, and patented technology where comparable royalty rates exist
- WACC used for DCF must be specific to the target's risk profile, not the acquirer's -- unlever and relever beta to target's D/E ratio
- Control premium is typically 20-40% for controlling interest transactions -- market approach guideline companies represent minority perspective
- Tax amortization benefit (TAB) may be included in the fair value of intangibles when the amortization deduction is available for tax purposes
- Contingent consideration must be remeasured at fair value each reporting period (ASC 815) -- changes recognized in earnings
- Bargain purchase (negative goodwill) triggers immediate gain recognition only after thorough reassessment of fair values
- Goodwill impairment testing (ASC 350) migrated to an ASC 1-only model (no Step 2) after ASU 2017-04
- For private company alternative (ASU 2014-02), goodwill can be amortized over 10 years (subsequent impairment test triggered by triggering events)
- Appraisal standards -- comply with ASA Business Valuation Standards and AICPA SSVS No. 1
