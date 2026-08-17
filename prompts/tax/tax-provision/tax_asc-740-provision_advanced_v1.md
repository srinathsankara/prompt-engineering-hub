---
title: ASC 740 Tax Provision Analysis & Review
service_line: tax
subcategory: tax-provision
use_case_type: review
complexity_tier: advanced
validation_status: validated
version: 1.0.0
author: tax-sme
reviewer: assurance-sme
created_date: 2026-05-08
last_modified: 2026-06-15
tags: ["asc-740", "tax-provision", "income-tax", "gaap", "sec", "corporate-tax", "claude"]
test_suites: ["testing/test-cases/tax/asc-740-provision.json"]
---

## system_prompt

I've reviewed tax provisions for both SEC registrants and private companies, and the biggest source of errors is undisciplined schedules. Valuation allowances and uncertain tax positions get the attention, but the deferred balances are where mistakes compound. You help companies calculate their current and deferred income tax provision, evaluate uncertain tax positions, and prepare financial statement disclosures. You work with both public (SEC) and private companies.

Your core responsibilities:
1. Calculate current tax expense -- taxable income × applicable tax rate
2. Calculate deferred tax expense -- temporary differences × enacted future tax rates
3. Evaluate valuation allowances -- more-likely-than-not standard under ASC 740-10-30-5
4. Assess uncertain tax positions -- two-step process under ASC 740-10-25
5. Prepare financial statement disclosures -- annual and interim

## context

**Company Profile:**
- Name: {{company_name}}
- Entity Type: {{entity_type}}
- SEC Filer: {{sec_filer}} (Yes / No)
- Reporting Standard: {{reporting_standard}} (ASC 740 / IFRS IAS 12)
- Fiscal Year End: {{fiscal_year_end}}
- Tax Jurisdictions: {{tax_jurisdictions}} (federal, states, international)

**Trial Balance Data:**
- Book Income (Pre-Tax): {{book_income}}
- Permanent Differences: {{permanent_differences}}
- Temporary Differences: {{temporary_differences}}
- NOL / Credit Carryforwards: {{nol_carryforwards}}
- Tax Credits: {{tax_credits}}
- Current Tax Expense (prior year): {{prior_current_tax}}
- Deferred Tax Asset/(Liability) (prior year): {{prior_dta_dtl}}
- Effective Tax Rate (prior year): {{prior_etr}}

## user_prompt

Prepare or review the ASC 740 tax provision for {{company_name}}.

### Phase 1: Current Tax Expense

**Reconcile book income to taxable income:**
| Line Item | Book Amount | Tax Amount | Difference | Permanent/Temporary |
|-----------|-------------|------------|------------|-------------------|
| Pre-tax book income | {{book_income}} | {{taxable_income_start}} | {{start_difference}} | -- |
| Meals & entertainment (50% disallowance) | {{meals_amount}} | {{meals_tax}} | {{meals_diff}} | Permanent |
| Section 174 capitalization adjustment | {{s174_book}} | {{s174_tax}} | {{s174_diff}} | Temporary |
| Depreciation (book vs MACRS) | {{depr_book}} | {{depr_tax}} | {{depr_diff}} | Temporary |
| Stock-based compensation | {{sbc_book}} | {{sbc_tax}} | {{sbc_diff}} | Temporary/Tax |
| NOL utilization | -- | {{nol_used}} | {{nol_diff}} | Temporary |
| **Taxable income** | | {{taxable_income_final}} | | |

**Current Tax Calculation:**
- Federal tax at 21%: {{federal_tax}}
- State tax (apportioned): {{state_tax}}
- Foreign tax: {{foreign_tax}}
- Tax credits: {{tax_credits}}
- Less: estimated payments: {{estimated_payments}}
- **Current tax payable/(receivable):** {{current_tax_payable}}

### Phase 2: Deferred Tax Expense

**Identify and classify temporary differences:**

| Temporary Difference | Book Basis | Tax Basis | Difference | DTA/(DTL) | Future Reversal Pattern |
|--------------------|------------|-----------|------------|------------|------------------------|
| Fixed assets (book vs tax) | {{book_fa}} | {{tax_fa}} | {{fa_diff}} | {{fa_dta_dtl}} | {{fa_pattern}} |
| Accruals/reserves | {{book_reserves}} | {{tax_reserves}} | {{reserve_diff}} | {{reserve_dta}} | {{reserve_pattern}} |
| NOL carryforward | 0 | {{nol_available}} | {{nol_diff}} | {{nol_dta}} | {{nol_pattern}} |
| Tax credit carryforward | 0 | {{credit_available}} | {{credit_diff}} | {{credit_dta}} | {{credit_pattern}} |
| Lease liability (ASC 842) | {{lease_liability}} | {{lease_tax}} | {{lease_diff}} | {{lease_dta}} | {{lease_pattern}} |
| Right-of-use asset (ASC 842) | {{rou_asset}} | {{rou_tax}} | {{rou_diff}} | {{rou_dtl}} | {{rou_pattern}} |
| **Net DTA/(DTL) before valuation allowance** | | | | {{net_dta_dtl}} | |

**Valuation Allowance Assessment (ASC 740-10-30-5):**
- Positive evidence: {{positive_evidence}} (history of profitability, projections, existing contracts)
- Negative evidence: {{negative_evidence}} (recent losses, projected losses, expired carryforwards)
- More-likely-than-not conclusion: {{valuation_allowance_required}} (Yes / No / Partial)
- Valuation allowance adjustment: {{valuation_allowance_amount}}

**Deferred Tax Expense:**
- Gross deferred tax expense/(benefit): {{gross_dta_dtl_change}}
- Valuation allowance change: {{va_change}}
- **Net deferred tax expense/(benefit):** {{net_deferred_expense}}

### Phase 3: Effective Tax Rate Reconciliation

| Item | Amount | Rate |
|------|--------|------|
| Statutory federal rate | {{statutory_fed}} | 21.0% |
| State taxes (net of federal benefit) | {{state_net}} | {{state_rate_pct}}% |
| Permanent differences | {{permanent_items}} | {{permanent_rate}}% |
| Tax credits | {{credit_impact}} | {{credit_rate}}% |
| Foreign rate differential | {{foreign_diff}} | {{foreign_rate}}% |
| Valuation allowance change | {{va_impact}} | {{va_rate}}% |
| Uncertain tax positions | {{utp_impact}} | {{utp_rate}}% |
| Other | {{other_items}} | {{other_rate}}% |
| **Effective Tax Rate** | {{total_tax_expense}} | {{etr_pct}}% |

### Phase 4: Uncertain Tax Positions (ASC 740-10-25/FIN 48)

For each uncertain position:

| Position | Description | Amount | Recognition Threshold Met? | Measurement (Largest Amt > 50%) | Liability | Interest & Penalties |
|----------|-------------|--------|---------------------------|-------------------------------|-----------|---------------------|
| {{position_1}} | {{desc_1}} | {{amount_1}} | {{recognized_1}} | {{measure_1}} | {{liability_1}} | {{ip_1}} |
| {{position_2}} | {{desc_2}} | {{amount_2}} | {{recognized_2}} | {{measure_2}} | {{liability_2}} | {{ip_2}} |

### Phase 5: Financial Statement Disclosures

Draft the required disclosures:

**Annual Disclosure Checklist:**
- [ ] Components of income tax expense (current, deferred, foreign, state)
- [ ] Reconciliation of statutory to effective rate (public companies -- dollar and percentage)
- [ ] Components of deferred tax assets and liabilities (by type)
- [ ] Valuation allowance rollforward
- [ ] Unrecognized tax benefits rollforward (UTB tabular reconciliation)
- [ ] Interest and penalties policy
- [ ] Tax years that remain subject to examination
- [ ] NOL and tax credit carryforward schedules with expiration dates
- [ ] Interim period tax rate reconciliation (public companies quarterly)

**Interim Disclosure Requirements (SEC filers):**
- [ ] Estimated annual effective tax rate applied to YTD ordinary income
- [ ] Significant unusual or infrequent items reported discretely
- [ ] Changes in tax laws or rates, enacted during the period
- [ ] Changes in valuation allowance or unrecognized tax benefits

## output_format

Present as a complete tax provision workpaper package:
1. **Summary** -- current expense, deferred expense, total tax expense, ETR
2. **Current Tax Workpapers** -- book-to-tax reconciliation, tax calculation by jurisdiction
3. **Deferred Tax Workpapers** -- temporary difference schedule, DTA/DTL rollforward, valuation allowance analysis
4. **ETR Reconciliation** -- full waterfall chart
5. **FIN 48 / Uncertain Tax Positions** -- position-by-position analysis
6. **Disclosure Drafts** -- draft footnote language for financial statements
7. **Review Notes** -- questions for management, open items, supporting documentation needed

## constraints

- Valuation allowance must be assessed annually and reassessed at each interim period
- Tax law changes must be reflected in the period enacted (not prospective)
- State taxes are computed on apportioned income -- verify state apportionment methodology
- Interim period ETR can be volatile -- apply discrete treatment for significant unusual items
- Uncertain tax positions must be reassessed at each reporting date
- Section 174 capitalization creates a new temporary difference starting in 2022
- GILTI, FDII, and BEAT (Tax Cuts and Jobs Act provisions) must be modeled separately
