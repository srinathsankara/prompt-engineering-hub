---
title: Quality of Earnings Analysis for M&A
service_line: transactions
subcategory: deal-advisory
use_case_type: analysis
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: transactions-sme
reviewer: advisory-sme
created_date: 2026-05-15
last_modified: 2026-06-15
tags: ["quality-of-earnings", "qoe", "m&a", "deal-advisory", "due-diligence", "buy-side", "sell-side", "claude"]
test_suites: ["testing/test-cases/transactions/qoe-analysis.json"]
---

## system_prompt

I've performed 100+ Quality of Earnings analyses for private equity, strategic buyers, and seller-side engagements. QoE is not about finding the "right" EBITDA number -- it's about showing the buyer what earnings look like on a normal, sustainable basis, and flagging what's likely to change after the deal closes.

My QoE approach:
1. **Recast EBITDA** -- normalize earnings by stripping out non-recurring, non-operating, and discretionary items. The goal is a clear picture of run-rate earnings.
2. **Normalize working capital** -- identify the sustainable baseline and define target levels. This is where most deal disputes happen after closing.
3. **Identify debt-like items** -- liabilities that transfer with the business. These are easy to miss and expensive to discover post-close.
4. **Assess sustainability** -- recurring revenue quality, customer concentration, margin trends, competitive position.
5. **Highlight risks** -- accounting policy changes, aggressive revenue recognition, one-time benefits, pending claims.

## context

**Transaction Overview:**
- Target Company: {{target_name}}
- Industry: {{industry}}
- Buyer Type: {{buyer_type}} (financial sponsor / strategic / management)
- Transaction Structure: {{deal_structure}} (stock sale / asset sale / merger)
- Valuation Metric: {{valuation_metric}} (EBITDA multiple / revenue multiple / DCF)
- Target EBITDA Multiple: {{target_multiple}}x
- LOI Date: {{loi_date}}
- Exclusivity Period: {{exclusivity_period}} days

**Historical Financials ({{period}}):**
- Revenue: {{revenue_yr1}}, {{revenue_yr2}}, {{revenue_latest}}
- Gross Margin: {{gm_yr1}}%, {{gm_yr2}}%, {{gm_latest}}%
- EBITDA (as reported): {{ebitda_yr1}}, {{ebitda_yr2}}, {{ebitda_latest}}%
- EBITDA Margin: {{ebitda_margin_yr1}}%, {{ebitda_margin_yr2}}%, {{ebitda_margin_latest}}%
- Capital Expenditures: {{capex_yr1}}, {{capex_yr2}}, {{capex_latest}}
- Working Capital: {{wc_yr1}}, {{wc_yr2}}, {{wc_latest}}

## user_prompt

Perform a Quality of Earnings analysis on {{target_name}} for a {{buyer_type}} transaction.

### Phase 1: EBITDA Normalization

**Adjustments to Reported EBITDA:**

| Adjustment Category | Description | Year 1 | Year 2 | Latest Period | Recurring? |
|--------------------|-------------|--------|--------|---------------|------------|
| **Owner/Manager Compensation** | Above-market comp, personal expenses, discretionary bonuses | {{adj_owner_yr1}} | {{adj_owner_yr2}} | {{adj_owner_latest}} | Add-back |
| **Non-Recurring Items** | Legal settlements, severance, moving costs, acquisition costs | {{adj_nonrec_yr1}} | {{adj_nonrec_yr2}} | {{adj_nonrec_latest}} | Add-back |
| **Non-Operating Income** | Rent from sublease, interest income, insurance proceeds | {{adj_nonop_yr1}} | {{adj_nonop_yr2}} | {{adj_nonop_latest}} | Deduct |
| **Accounting Policy Changes** | Revenue recognition timing, depreciation method, inventory costing | {{adj_acct_yr1}} | {{adj_acct_yr2}} | {{adj_acct_latest}} | Varies |
| **Rent Adjustments** | Below/above market lease terms, related party leases | {{adj_rent_yr1}} | {{adj_rent_yr2}} | {{adj_rent_latest}} | Normalize |
| **Share-Based Compensation** | Non-cash equity grants | {{adj_sbc_yr1}} | {{adj_sbc_yr2}} | {{adj_sbc_latest}} | Add-back |
| **Pro Forma Adjustments** | Cost synergies, new management, public company costs | {{adj_proforma_yr1}} | {{adj_proforma_yr2}} | {{adj_proforma_latest}} | Pro forma |
| **FX/Extraordinary** | Foreign exchange gains/losses, natural disasters | {{adj_fx_yr1}} | {{adj_fx_yr2}} | {{adj_fx_latest}} | Add-back |
| **Total Adjustments** | | {{total_adj_yr1}} | {{total_adj_yr2}} | {{total_adj_latest}} | |

**Adjusted EBITDA:**
| Metric | Year 1 | Year 2 | Latest Period | Trend |
|--------|--------|--------|---------------|-------|
| Reported EBITDA | {{reported_ebitda_yr1}} | {{reported_ebitda_yr2}} | {{reported_ebitda_latest}} | |
| Total Adjustments | {{total_adj_yr1}} | {{total_adj_yr2}} | {{total_adj_latest}} | |
| **Adjusted EBITDA** | {{adjusted_ebitda_yr1}} | {{adjusted_ebitda_yr2}} | {{adjusted_ebitda_latest}} | {{trend}} |
| Adjusted EBITDA Margin | {{adj_margin_yr1}}% | {{adj_margin_yr2}}% | {{adj_margin_latest}}% | {{margin_trend}} |

### Phase 2: Normalized Working Capital Analysis

| WC Component | Historical Avg | % of Revenue | Target Level | Proposed Normalized | Buyer/ Seller Risk |
|-------------|---------------|--------------|-------------|-------------------|-------------------|
| Accounts Receivable | {{ar_avg}} | {{ar_pct_rev}}% | {{ar_target}} | {{ar_normalized}} | {{ar_risk}} |
| Inventory | {{inv_avg}} | {{inv_pct_rev}}% | {{inv_target}} | {{inv_normalized}} | {{inv_risk}} |
| Accounts Payable | {{ap_avg}} | {{ap_pct_rev}}% | {{ap_target}} | {{ap_normalized}} | {{ap_risk}} |
| Accrued Liabilities | {{accrued_avg}} | {{accrued_pct_rev}}% | {{accrued_target}} | {{accrued_normalized}} | {{accrued_risk}} |
| Deferred Revenue | {{dr_avg}} | {{dr_pct_rev}}% | {{dr_target}} | {{dr_normalized}} | {{dr_risk}} |
| **Net Working Capital** | {{nwc_avg}} | **--** | **{{nwc_target}}** | **{{nwc_normalized}}** | **--** |

**Key NWC observations:**
- Seasonality: {{seasonality_factors}}
- One-time WC fluctuations: {{wc_fluctuations}}
- Target peg vs actual at close: {{wc_peg_vs_actual}}
- Risk: {{wc_risk}} (buyer/seller exposure based on peg structure)

### Phase 3: Debt-Like Items & Indebtedness

| Item | Amount | Description | Pre-Close Required? |
|------|--------|-------------|-------------------|
| Outstanding bank debt | {{bank_debt}} | {{bank_debt_desc}} | Yes -- paid at close |
| Shareholder loans | {{shareholder_loans}} | {{shareholder_desc}} | Yes |
| Related party payables | {{rp_payables}} | {{rp_desc}} | Varies |
| Unpaid management fees | {{mgmt_fees}} | {{mgmt_fees_desc}} | Yes |
| Transaction bonuses | {{transaction_bonuses}} | {{bonus_desc}} | Yes |
| Seller notes | {{seller_notes}} | {{seller_notes_desc}} | No -- rolls/forgiven |
| Deferred tax liability (asset sale) | {{dtl}} | {{dtl_desc}} | Yes -- structural |
| **Total Debt-Like Items** | **{{total_debt_like}}** | | |

### Phase 4: Revenue Quality Assessment

**Recurring Revenue Analysis:**
| Metric | Year 1 | Year 2 | Latest | Benchmark |
|--------|--------|--------|--------|-----------|
| % Recurring Revenue | {{recurring_pct_yr1}}% | {{recurring_pct_yr2}}% | {{recurring_pct_latest}}% | {{recurring_benchmark}}% |
| Customer Churn Rate | {{churn_yr1}}% | {{churn_yr2}}% | {{churn_latest}}% | {{churn_benchmark}}% |
| Net Revenue Retention | {{nrr_yr1}}% | {{nrr_yr2}}% | {{nrr_latest}}% | {{nrr_benchmark}}% |
| Top 5 Customer % Revenue | {{c5_pct_yr1}}% | {{c5_pct_yr2}}% | {{c5_pct_latest}}% | {{c5_benchmark}}% |

**Key Revenue Risks:**
- Customer concentration: {{customer_concentration_risk}}
- Contract backlog: {{backlog_analysis}}
- Pricing power: {{pricing_trend}}
- Revenue recognition policy: {{revenue_recognition_risk}}

### Phase 5: Quality of Earnings Conclusion

**Adjusted EBITDA Bridge:**
| Component | Amount |
|-----------|--------|
| Reported EBITDA (LTM) | {{ltm_reported_ebitda}} |
| Non-recurring add-backs | {{total_nonrecurring}} |
| Owner comp normalization | {{owner_comp_adjustment}} |
| Rent normalization | {{rent_adjustment}} |
| Other normalized adjustments | {{other_adjustments}} |
| **Adjusted EBITDA (LTM)** | **{{ltm_adjusted_ebitda}}** |
| Implied Valuation at {{multiple}}x | **{{implied_valuation}}** |

**Quality Rating: {{quality_rating}} (High / Medium / Low / Watch)**
- High: Clean financials, recurring revenue, consistent margins, minimal adjustments
- Medium: Some adjustments needed, moderate customer concentration, acceptable trends
- Low: Significant adjustments, declining margins, high customer concentration
- Watch: Potential accounting issues, going concern risks, material pending litigation

### Phase 6: Deal Structuring Recommendations

Based on QoE findings:
- EBITDA for purchase price: ${{valuation_ebitda}}
- Normalized NWC peg: ${{nwc_peg}}
- Indemnification escrow: {{escrow_pct}}% for {{escrow_period}} months
- Earnout structure: {{earnout_description}} (if applicable)
- Representations & warranties insurance: {{rwi_recommendation}}

## output_format

Present as a comprehensive QoE report:
1. **Executive Summary** -- adjusted EBITDA bridge, valuation implications, key risks
2. **Adjusted EBITDA Detail** -- reconciliation by year with support for each adjustment
3. **Normalized Working Capital** -- historical analysis, target peg, risk assessment
4. **Debt-Like Items Schedule** -- complete inventory of assumed liabilities
5. **Revenue Quality Analysis** -- recurring revenue, churn, concentration, backlog
6. **Trend Analysis** -- margins, growth rates, expense leverage, cash conversion
7. **Key Risks & Concerns** -- top 5 risks flagged for buyer consideration
8. **Deal Structure Implications** -- pricing, escrow, earnout, R&W insurance recommendations
9. **Appendices** -- detailed adjustment schedules, interview notes, accounting policy review

## constraints

- Adjustments must be objectively supportable -- classify as "debatable" if reasonable minds could disagree
- Working capital peg should reflect normalized ongoing operations, not a period-end snapshot
- Distinguish between GAAP EBITDA and adjusted EBITDA -- GAAP is not negotiable
- Seasonality must be considered in trailing twelve month (TTM) analysis
- QoE is not an audit -- scope limitation must be clearly stated in methodology
- Forward-looking EBITDA adjustments require explicit buyer representation
- Indemnification structure depends heavily on QoE findings -- higher risk means more escrow
- Private equity buyers typically require normalized adjustments; strategic buyers may be more flexible
