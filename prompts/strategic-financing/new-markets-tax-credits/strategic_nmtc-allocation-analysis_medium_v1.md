---
title: New Markets Tax Credit (NMTC) Allocation Analysis
service_line: strategic-financing
subcategory: new-markets-tax-credits
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: strategic-financing-sme
reviewer: strategic-financing-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["nmtc", "new-markets-tax-credits", "cdfi", "qualified-equity-investment", "community-development", "affordable-housing", "qalic", "section-45d", "claude"]
test_suites: ["testing/test-cases/strategic-financing/nmtc-medium.json"]
---

## system_prompt

I've prepared NMTC allocation applications and structured QEI capital stacks, and the application is the easy part -- the seven-year compliance period is where allocations get recaptured. You have deep expertise in NMTC allocation applications, Qualified Equity Investment (QEI) structuring, Qualified Active Low-Income Community Business (QALICB) qualification, and compliance reporting (Form 8873, CDFI Fund annual reports).

Your NMTC methodology covers:
- NMTC allocation application preparation (Round XX applications)
- QEI structuring (capital stack: NMTC equity, leverage loans, sub-CDE debt)
- QALICB qualification analysis (gross receipts, tangible asset, location tests)
- Qualified Low-Income Community (QLIC) census tract eligibility
- Compliance lifecycle (allocation agreement, 7-year compliance period, recapture risk)
- Leverage fund vs. equity fund structures

## context

**Project Profile:**
- Project Name: {{project_name}}
- Project Location: {{project_address}} (Census Tract: {{census_tract}})
- Project Type: {{project_type}} (real estate / operating business / mixed-use / manufacturing / healthcare / education / renewable energy)
- Total Project Cost: {{total_project_cost}}
- NMTC Allocation Sought: {{nmtc_allocation_sought}}
- Sponsor/Developer: {{sponsor_developer}}
- CDE Partner: {{cde_partner}} (Allocatee CDE)
- Prior Allocation History: {{prior_allocation_history}} (none / Round {{prior_round}})
- Projected Jobs Created/Retained: {{projected_jobs}}
- Distressed Area Indicators: {{distressed_indicators}} (poverty rate / median income / unemployment)

**Capital Stack (Proposed):**
| Source | Amount | % of Total | Terms |
|--------|:------:|:----------:|-------|
| NMTC equity (investor) | {{nmtc_equity}} | {{nmtc_equity_pct}}% | {{nmtc_equity_terms}} |
| NMTC leverage loan (bank) | {{leverage_loan}} | {{leverage_loan_pct}}% | {{leverage_loan_terms}} |
| Sub-CDE debt | {{sub_cde_debt}} | {{sub_cde_debt_pct}}% | {{sub_cde_debt_terms}} |
| Other federal/state incentives | {{other_incentives}} | {{other_incentives_pct}}% | {{other_incentives_terms}} |
| Developer equity | {{developer_equity}} | {{developer_equity_pct}}% | {{developer_equity_terms}} |
| Conventional debt (senior) | {{conventional_debt}} | {{conventional_debt_pct}}% | {{conventional_debt_terms}} |
| **Total** | **{{total_sources}}** | **100%** | |

## user_prompt

Analyze the NMTC allocation eligibility, structure, and projected benefits for {{project_name}}.

### Step 1: QALICB & QLIC Qualification

**Qualified Active Low-Income Community Business (QALICB) Tests:**

| Test | Requirement | Project Status | Pass/Fail |
|------|------------|---------------|:---------:|
| **Gross Receipts Test** (>50% from active business in QLIC) | At least 50% of total gross revenue from active conduct of business in QLIC | {{gross_receipts_status}} | {{gross_receipts_result}} |
| **Tangible Asset Test** (>40% tangible property in QLIC) | At least 40% of tangible property (owned or leased) located in QLIC | {{tangible_asset_status}} | {{tangible_asset_result}} |
| **Services Test** (>50% services performed in QLIC) | At least 50% of total services performed by employees in QLIC | {{services_status}} | {{services_result}} |
| **Location Test** (tangible property in QLIC) | All tangible property located in QLIC (with de minimis exception) | {{location_status}} | {{location_result}} |
| **Collectibles Test** (<5% collectibles) | Collectibles (art, antiques, etc.) <5% of cost basis of assets | {{collectibles_status}} | {{collectibles_result}} |
| **Passive Income Test** (<5% passive income) | Passive income <5% of gross revenue | {{passive_income_status}} | {{passive_income_result}} |
| **Development Entity Test** (if applicable) | <3x developer fee contingency; proper cost certification | {{development_entity_status}} | {{development_entity_result}} |
| **for-profit Business Requirement** | Business is operated for profit (not residential rental beyond 80%) | {{for_profit_status}} | {{for_profit_result}} |

**Excluded Businesses (NMTC may not support):**
- [ ] Massage parlor / hot tub facility
- [ ] Tanning salon
- [ ] Country club / golf course
- [ ] Racetrack / gambling facility
- [ ] Liquor store / packaged goods (not restaurant serving)
- [ ] Residential rental (80%+ residential -- use Section 42 LIHTC instead)
- [ ] Farming (per IRS safe harbor; check specific rules)
- [ ] None -- business is eligible

**Qualified Low-Income Community (QLIC) -- Census Tract Analysis:**

| Criterion | Tract Value | Threshold | Eligible? |
|-----------|:----------:|:---------:|:---------:|
| Poverty Rate | {{poverty_rate}}% | ≥20% | {{poverty_eligible}} |
| Median Family Income (MFI) | {{mfi_dollar}} | <80% of area MFI ({{area_mfi}}) | {{mfi_eligible}} |
| Designated: Non-Metropolitan County | {{nonmetro_status}} | Low-income designation | {{nonmetro_eligible}} |
| Disaster Area Status | {{disaster_status}} | Presidentially declared disaster | {{disaster_eligible}} |
| Brownfield Remediation | {{brownfield_status}} | Designated brownfield site | {{brownfield_eligible}} |
| Federally Designated (Empowerment Zone, Renewal Community, HUBZone) | {{federal_designation}} | Active designation | {{federal_eligible}} |
| **Overall QLIC Eligibility** | | | **{{overall_qlic_eligible}}** |

### Step 2: NMTC Structure Analysis

**Standard Leverage Fund Structure:**

```
                  Investor (Tax Credit Investor)
                 $QEI (cash)  |  Tax Credits + Cash
                              ↓
                     CDE (Community Development Entity)
                    /                          \
            $QEI (note)                   $Loan Proceeds
                ↓                              ↓
        Leverage Lender                  Sub-CDE / Borrower
        (usually bank)                        ↓
                                         QALICB (Project)
```

| Structure Element | Description | Tax Impact | Financial Impact |
|-------------------|-------------|:----------:|:---------------:|
| QEI from Investor to CDE | {{qei_description}} | {{qei_tax_impact}} -- investor claims 39% credit over 7 years (5% x 3 + 6% x 4) | {{qei_financial_impact}} |
| CDE QLI (Qualified Low-Income Investment) to Sub-CDE | {{qli_description}} | {{qli_tax_impact}} | {{qli_financial_impact}} |
| Sub-CDE Loan to QALICB | {{sub_cde_description}} | {{sub_cde_tax_impact}} | {{sub_cde_financial_impact}} |
| Leverage Loan | {{leverage_description}} | {{leverage_tax_impact}} | {{leverage_financial_impact}} |
| NMTC Equity (Investor Return) | {{equity_description}} | {{equity_tax_impact}} | {{equity_financial_impact}} |

**Capital Structure -- Investor Economics:**
| Line Item | Year 1 | Year 2 | Year 3 | Year 4 | Year 5 | Year 6 | Year 7 | Total |
|-----------|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:-----:|
| NMTC Credit (5% × 3, 6% × 4) | {{yr1_credit}} | {{yr2_credit}} | {{yr3_credit}} | {{yr4_credit}} | {{yr5_credit}} | {{yr6_credit}} | {{yr7_credit}} | {{total_credits}} |
| Cash flow from CDE (interest) | {{yr1_cash}} | {{yr2_cash}} | {{yr3_cash}} | {{yr4_cash}} | {{yr5_cash}} | {{yr6_cash}} | {{yr7_cash}} | {{total_cash}} |
| QEI repayment at exit | -- | -- | -- | -- | -- | -- | {{exit_repayment}} | {{exit_repayment}} |
| Total investor return | {{yr1_return}} | {{yr2_return}} | {{yr3_return}} | {{yr4_return}} | {{yr5_return}} | {{yr6_return}} | {{yr7_return}} | {{total_return}} |
| Investor IRR | | | | | | | | **{{investor_irr}}%** |
| Investor net benefit after tax | | | | | | | | **{{investor_net_benefit}}** |

**Developer / Borrower Economics:**
| Line Item | Amount |
|-----------|:------:|
| Total project cost | {{dev_total_cost}} |
| NMTC equity proceeds to project | {{dev_nmtc_proceeds}} |
| Below-market rate on Sub-CDE loan ({{sub_cde_rate}}% vs. market {{market_rate}}%) | {{dev_interest_savings}} (NPV) |
| Fees (CDE fees, legal, structuring, compliance) | {{dev_total_fees}} |
| Net benefit to project / developer | {{dev_net_benefit}} |
| Effective interest rate (blended capital stack) | {{dev_blended_rate}}% |
| Blended rate without NMTC | {{dev_market_rate}}% |

### Step 3: Compliance & Recapture Risk Assessment

| Compliance Requirement | Frequency | Owner | Risk Level | Escalation if Failed |
|----------------------|-----------|-------|:----------:|---------------------|
| QALICB annual certification | Annual | {{comp_qalicb_owner}} | {{comp_qalicb_risk}} | {{comp_qalicb_escalation}} |
| CDE annual report (CDFI Fund) | Annual | {{comp_cde_report_owner}} | {{comp_cde_report_risk}} | {{comp_cde_report_escalation}} |
| Form 8873 (NMTC allocation tax return) | Annual (7 years) | {{comp_8873_owner}} | {{comp_8873_risk}} | {{comp_8873_escalation}} |
| QLIC census tract monitoring | Throughout | {{comp_qlic_owner}} | {{comp_qlic_risk}} | {{comp_qlic_escalation}} |
| Use of proceeds tracking | Quarterly | {{comp_proceeds_owner}} | {{comp_proceeds_risk}} | {{comp_proceeds_escalation}} |
| Jobs reporting (actual jobs created/retained) | Annual | {{comp_jobs_owner}} | {{comp_jobs_risk}} | {{comp_jobs_escalation}} |
| Recapture event monitoring (disposition, non-compliance) | Ongoing | {{comp_recapture_owner}} | {{comp_recapture_risk}} | {{comp_recapture_escalation}} |

**Recapture Events:**
- [ ] CDE ceases to qualify as a CDE (QEI recapture)
- [ ] QALICB ceases to be a QALICB during the 7-year compliance period
- [ ] Use of proceeds diverted to non-qualified purposes
- [ ] Tax credit investor sells / transfers QEI within compliance period
- [ ] Leverage lender forecloses / exercises creditors' remedies
- [ ] Material deviation from allocation agreement

### Step 4: Application Strategy

| Application Element | Strategy | Notes |
|--------------------|----------|-------|
| Allocation Request Amount | {{allocation_request}} | {{allocation_strategy_notes}} |
| CDE Track Record (# prior allocations) | {{cde_track_record}} | {{cde_track_record_notes}} |
| Community Impact Score | {{impact_score}}/100 | {{impact_notes}} |
| Distress Score | {{distress_score}}/100 | {{distress_notes}} |
| Leverage / Subsidy Ratio | {{leverage_ratio}}:1 | {{leverage_notes}} |
| Expected Allocation Probability | {{allocation_probability}}% | {{probability_notes}} |

**Impact Metrics (CDFI Fund Priority):**
| Metric | Projected | Verification Method |
|--------|:---------:|-------------------|
| Direct jobs created (FTE) | {{jobs_created}} | {{jobs_verification}} |
| Direct jobs retained (FTE) | {{jobs_retained}} | {{jobs_retained_verification}} |
| Construction jobs (temporary) | {{construction_jobs}} | {{construction_verification}} |
| Affordable housing units (if applicable) | {{affordable_units}} | {{housing_verification}} |
| Community facility SF (healthcare, education) | {{community_sf}} | {{facility_verification}} |
| Sq ft of commercial / retail space | {{commercial_sf}} | {{commercial_verification}} |
| Minority-owned / woman-owned business contracting | {{mbe_wbe_pct}}% | {{mbe_wbe_verification}} |

### Step 5: State NMTC Compatibility

| State | State NMTC Program? | State Credit % | Combined Fed + State | Recapture Rules |
|:-----:|:------------------:|:-------------:|:-------------------:|:--------------:|
| {{state_1}} | {{state_program_1}} | {{state_rate_1}}% | {{combined_rate_1}}% | {{state_recapture_1}} |
| {{state_2}} | {{state_program_2}} | {{state_rate_2}}% | {{combined_rate_2}}% | {{state_recapture_2}} |

## output_format

Present as a comprehensive NMTC allocation analysis:
1. **Executive Summary** -- project description, QALICB/QLIC eligibility, capital stack, net benefit to project
2. **Qualification Analysis** -- 7 QALICB tests plus census tract eligibility
3. **Structure Analysis** -- leverage fund structure diagram, investor economics (7-year IRR), developer benefit
4. **Compliance Plan** -- annual reporting requirements, recapture risk, mitigation strategies
5. **Application Strategy** -- allocation request, impact metrics, probability assessment
6. **State NMTC Compatibility** -- combined credit rate analysis
7. **Recommendation** -- proceed / restructure / alternative financing

## constraints

- NMTC provides 39% federal tax credit over 7 years (5% per year for first 3 years, 6% per year for last 4 years) -- credit is claimed on Form 8873
- Credit is non-refundable -- investor must have sufficient tax appetite to utilize credits
- The 7-year compliance period begins on the date the QEI is made -- recapture applies for any non-compliance during this period
- CDE must use at least 85% of QEI proceeds to make QLIs to QALICBs within 12 months of QEI receipt (working capital safe harbor available)
- At least 20% of NMTC allocation must be invested in non-real estate operating businesses (CDFI Fund priority)
- Developer fee is limited (typically <15% of total project cost) -- excess fees may jeopardize QALICB status
- Lease pass-through structures may be used when the operating business cannot qualify as QALICB -- real estate entity serves as QALICB
- QLIC census tracts are updated every 5 years -- confirm current eligibility at the time of investment
- Application scoring prioritizes: business characteristics, community impact, distress indicators, CDE track record, leverage ratio
- CDFI Fund rounds are highly oversubscribed (typically 3:1-10:1 request-to-allocation) -- realistic probability assessment is critical
- State NMTC programs (OH, MO, NY, FL, MS, GA, KY, etc.) have separate application processes and compliance rules
- NMTC and LIHTC (Low-Income Housing Tax Credit) may be combined on mixed-use projects -- but residential >80% disqualifies NMTC
- Compliance period reporting requires documentation retention for 7+3 (statute of limitations) = 10 years minimum
- The Inflation Reduction Act (2022) and subsequent extending legislation should be reviewed for NMTC allocation availability
