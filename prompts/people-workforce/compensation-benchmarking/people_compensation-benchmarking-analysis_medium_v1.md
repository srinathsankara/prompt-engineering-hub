---
title: Compensation Benchmarking & Total Rewards Analysis
service_line: people-workforce
subcategory: compensation-benchmarking
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: people-sme
reviewer: people-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["compensation", "benchmarking", "total-rewards", "salary-survey", "radford", "mecer", "equity", "executive-comp", "claude"]
test_suites: ["testing/test-cases/people-workforce/compensation-medium.json"]
---

## system_prompt

I've benchmarked compensation for companies from 50 to 50,000 employees, and the survey data is only a starting point. Job matching is where benchmarking goes wrong -- mismatch the benchmark code and you'll systematically misprice roles. You use published survey data (Radford, Mercer, Willis Towers Watson, Korn Ferry), industry-specific compensation studies, and geographic differentials to evaluate market competitiveness and pay equity.

Your methodology:
1. **Job matching** -- map client roles to survey benchmark codes
2. **Market data analysis** -- pull base salary, bonus, total cash, and long-term incentive (LTI) data
3. **Geographic adjustment** -- apply cost-of-labor differentials for location
4. **Regression analysis** -- size-adjusted compensation (revenue, headcount, complexity)
5. **Pay equity assessment** -- identify disparities by gender, race, or tenure
6. **Total rewards modeling** -- quantify benefits, 401(k), equity, PTO value

## context

**Client Profile:**
- Name: {{client_name}}
- Industry: {{industry}}
- Revenue: {{revenue}}
- Headcount: {{headcount}}
- HQ Location: {{hq_location}}
- Geographic Footprint: {{geographic_footprint}} (locations where employees work)
- Funding Stage / Ownership: {{ownership}} (private / PE-backed / VC-backed / public / nonprofit)
- Compensation Philosophy: {{comp_philosophy}} (market leader / market competitive / lag market / pay-for-performance)
- Reference Market: {{reference_market}} (target percentile: {{target_percentile}}th)

**Roles to Benchmark:**
| Role Title | Incumbents | Current Base Salary Range | Current TCC Range | Benchmark Code |
|-----------|-----------|-------------------------|-------------------|---------------|
| {{role_1}} | {{incumbents_1}} | {{base_range_1}} | {{tcc_range_1}} | {{code_1}} |
| {{role_2}} | {{incumbents_2}} | {{base_range_2}} | {{tcc_range_2}} | {{code_2}} |
| {{role_3}} | {{incumbents_3}} | {{base_range_3}} | {{tcc_range_3}} | {{code_3}} |
| {{role_4}} | {{incumbents_4}} | {{base_range_4}} | {{tcc_range_4}} | {{code_4}} |

## user_prompt

Perform a compensation benchmarking and total rewards analysis for {{client_name}}.

### Step 1: Job Matching & Market Data

**Job Matching Validation:**
| Role | Survey Source | Benchmark Code | Level Match (1-5) | Scope Match (1-5) | Notes |
|------|-------------|---------------|-------------------|-------------------|-------|
| {{role_1}} | {{survey_source_1}} | {{code_1}} | {{level_match_1}} | {{scope_match_1}} | {{notes_1}} |
| {{role_2}} | {{survey_source_2}} | {{code_2}} | {{level_match_2}} | {{scope_match_2}} | {{notes_2}} |
| {{role_3}} | {{survey_source_3}} | {{code_3}} | {{level_match_3}} | {{scope_match_3}} | {{notes_3}} |

**Market Data (National, {{target_percentile}}th Percentile):**

| Role | Base Salary (P25) | Base Salary (P50) | Base Salary (P75) | TCC (P25) | TCC (P50) | TCC (P75) |
|------|:-:|:-:|:-:|:-:|:-:|:-:|
| {{role_1}} | {{base_p25_1}} | {{base_p50_1}} | {{base_p75_1}} | {{tcc_p25_1}} | {{tcc_p50_1}} | {{tcc_p75_1}} |
| {{role_2}} | {{base_p25_2}} | {{base_p50_2}} | {{base_p75_2}} | {{tcc_p25_2}} | {{tcc_p50_2}} | {{tcc_p75_2}} |
| {{role_3}} | {{base_p25_3}} | {{base_p50_3}} | {{base_p75_3}} | {{tcc_p25_3}} | {{tcc_p50_3}} | {{tcc_p75_3}} |
| {{role_4}} | {{base_p25_4}} | {{base_p50_4}} | {{base_p75_4}} | {{tcc_p25_4}} | {{tcc_p50_4}} | {{tcc_p75_4}} |

### Step 2: Geographic Adjustment

| Location | Cost-of-Labor Index | Adjustment | Role | Adjusted P50 Base |
|----------|:------------------:|:----------:|------|:-----------------:|
| {{geo_1_location}} | {{geo_1_index}} | {{geo_1_adjustment}}% | {{geo_1_role}} | {{geo_1_adjusted_p50}} |
| {{geo_2_location}} | {{geo_2_index}} | {{geo_2_adjustment}}% | {{geo_2_role}} | {{geo_2_adjusted_p50}} |
| {{geo_3_location}} | {{geo_3_index}} | {{geo_3_adjustment}}% | {{geo_3_role}} | {{geo_3_adjusted_p50}} |

### Step 3: Current vs. Market Comparison

**Compa-Ratio Analysis:**

| Role | Current Base Salary | Market P50 (Adj) | Compa-Ratio | Current TCC | Market TCC P50 | TCC Compa-Ratio |
|------|:------------------:|:----------------:|:-----------:|:-----------:|:--------------:|:---------------:|
| {{role_1}} | {{current_base_1}} | {{market_base_1}} | {{compa_ratio_1}}% | {{current_tcc_1}} | {{market_tcc_1}} | {{tcc_compa_1}}% |
| {{role_2}} | {{current_base_2}} | {{market_base_2}} | {{compa_ratio_2}}% | {{current_tcc_2}} | {{market_tcc_2}} | {{tcc_compa_2}}% |
| {{role_3}} | {{current_base_3}} | {{market_base_3}} | {{compa_ratio_3}}% | {{current_tcc_3}} | {{market_tcc_3}} | {{tcc_compa_3}}% |
| {{role_4}} | {{current_base_4}} | {{market_base_4}} | {{compa_ratio_4}}% | {{current_tcc_4}} | {{market_tcc_4}} | {{tcc_compa_4}}% |

**Compa-Ratio Interpretation:**
| Compa-Ratio Range | Classification | Action |
|:-----------------:|---------------|--------|
| <80% | Significantly below market | Critical retention risk -- immediate adjustment needed |
| 80-90% | Below market | Review within 6 months; consider equity grants |
| 90-95% | Slightly below market | Monitor; consider adjustment in annual cycle |
| 95-105% | At market (competitive) | Maintain |
| 105-115% | Slightly above market | Monitor; consider merit freeze for high performers |
| 115-120% | Above market | Red circle / review role scope or performance |
| >120% | Significantly above market | Range adjustment required or job re-leveling |

### Step 4: Pay Equity Analysis

| Dimension | Group A | Group B | Base Salary Gap | TCC Gap | Statistically Significant? | Action Required? |
|-----------|---------|---------|:---------------:|:-------:|:-------------------------:|:----------------:|
| Gender | {{gender_a}} | {{gender_b}} | {{gender_base_gap}}% | {{gender_tcc_gap}}% | {{gender_significant}} | {{gender_action}} |
| Race/ethnicity | {{race_a}} | {{race_b}} | {{race_base_gap}}% | {{race_tcc_gap}}% | {{race_significant}} | {{race_action}} |
| Tenure (<2yr / >5yr) | {{tenure_a}} | {{tenure_b}} | {{tenure_base_gap}}% | {{tenure_tcc_gap}}% | {{tenure_significant}} | {{tenure_action}} |
| Exempt vs Non-exempt | {{exempt_a}} | {{exempt_b}} | {{exempt_base_gap}}% | {{exempt_tcc_gap}}% | {{exempt_significant}} | {{exempt_action}} |

### Step 5: Total Rewards Valuation

**Cash Compensation:**
| Role | Base Salary | Annual Bonus (Target %) | Annual Bonus (Target $) | Total Cash |
|------|:----------:|:----------------------:|:----------------------:|:----------:|
| {{role_1}} | {{base_1}} | {{bonus_pct_1}}% | {{bonus_1}} | {{total_cash_1}} |
| {{role_2}} | {{base_2}} | {{bonus_pct_2}}% | {{bonus_2}} | {{total_cash_2}} |
| {{role_3}} | {{base_3}} | {{bonus_pct_3}}% | {{bonus_3}} | {{total_cash_3}} |

**Long-Term Incentives (LTI):**
| Role | LTI Vehicle | Grant Value | Vesting Schedule | Annualized Value |
|------|:-----------:|:-----------:|:----------------:|:----------------:|
| {{role_1}} | {{lti_type_1}} | {{lti_grant_1}} | {{lti_vesting_1}} | {{lti_annual_1}} |
| {{role_2}} | {{lti_type_2}} | {{lti_grant_2}} | {{lti_vesting_2}} | {{lti_annual_2}} |
| {{role_3}} | {{lti_type_3}} | {{lti_grant_3}} | {{lti_vesting_3}} | {{lti_annual_3}} |

**Benefits Valuation (Annualized):**
| Benefit Component | Value per Employee (% of Base) | Notes |
|------------------|:------------------------------:|-------|
| 401(k) match / employer contribution | {{benefit_401k_value}} ({{benefit_401k_pct}}%) | {{benefit_401k_notes}} |
| Health insurance (medical/dental/vision) | {{benefit_health_value}} ({{benefit_health_pct}}%) | {{benefit_health_notes}} |
| Disability / life insurance | {{benefit_insurance_value}} ({{benefit_insurance_pct}}%) | {{benefit_insurance_notes}} |
| PTO (vacation, sick, holidays) | {{benefit_pto_value}} ({{benefit_pto_pct}}%) | {{benefit_pto_notes}} |
| Tuition reimbursement / L&D | {{benefit_tuition_value}} ({{benefit_tuition_pct}}%) | {{benefit_tuition_notes}} |
| Other perks (wellness, stipends, etc.) | {{benefit_other_value}} ({{benefit_other_pct}}%) | {{benefit_other_notes}} |
| **Total Benefits as % of Base Salary** | | **{{total_benefits_pct}}%** |

**Total Rewards Summary:**
| Role | Base Salary | Bonus | LTI | Benefits | **Total Rewards** | Market P50 (Adj) | Competitive? |
|------|:----------:|:----:|:---:|:--------:|:-----------------:|:----------------:|:-----------:|
| {{role_1}} | {{tr_base_1}} | {{tr_bonus_1}} | {{tr_lti_1}} | {{tr_benefits_1}} | **{{tr_total_1}}** | {{tr_market_1}} | {{tr_competitive_1}} |
| {{role_2}} | {{tr_base_2}} | {{tr_bonus_2}} | {{tr_lti_2}} | {{tr_benefits_2}} | **{{tr_total_2}}** | {{tr_market_2}} | {{tr_competitive_2}} |
| {{role_3}} | {{tr_base_3}} | {{tr_bonus_3}} | {{tr_lti_3}} | {{tr_benefits_3}} | **{{tr_total_3}}** | {{tr_market_3}} | {{tr_competitive_3}} |

### Step 6: Executive Compensation (if applicable)

| Element | Current | Market P50 | Market P75 | Gap | Recommendation |
|---------|:-------:|:----------:|:----------:|:---:|:--------------:|
| Base Salary | {{exec_base_current}} | {{exec_base_p50}} | {{exec_base_p75}} | {{exec_base_gap}} | {{exec_base_rec}} |
| Annual Bonus (target) | {{exec_bonus_current}}% | {{exec_bonus_p50}}% | {{exec_bonus_p75}}% | {{exec_bonus_gap}} | {{exec_bonus_rec}} |
| LTI Grant Value | {{exec_lti_current}} | {{exec_lti_p50}} | {{exec_lti_p75}} | {{exec_lti_gap}} | {{exec_lti_rec}} |
| Benefits / Perquisites | {{exec_perks_current}} | {{exec_perks_p50}} | {{exec_perks_p75}} | {{exec_perks_gap}} | {{exec_perks_rec}} |

**IRC 162(m) Deduction Limit:** {{exec_162m_applicable}} (public company / no)
**Section 280G / Parachute Payment Analysis:** {{exec_280g_applicable}}
**Clawback Policy in Place:** {{exec_clawback_policy}}
**Change-in-Control / Severance:** {{exec_cic_severance}}

### Step 7: Recommendations

| Recommendation | Roles Impacted | Estimated Cost | Priority | Implementation Timeline |
|:--------------|:-------------:|:--------------:|:--------:|:----------------------:|
| {{rec_1_title}} | {{rec_1_roles}} | {{rec_1_cost}} | {{rec_1_priority}} | {{rec_1_timeline}} |
| {{rec_2_title}} | {{rec_2_roles}} | {{rec_2_cost}} | {{rec_2_priority}} | {{rec_2_timeline}} |
| {{rec_3_title}} | {{rec_3_roles}} | {{rec_3_cost}} | {{rec_3_priority}} | {{rec_3_timeline}} |

**Budget Impact Summary:**
| Adjustment Scenario | Annualized Cost | % of Current Payroll | % of Revenue |
|:------------------:|:--------------:|:-------------------:|:-----------:|
| Bring all to market P50 | {{cost_to_p50}} | {{payroll_pct_p50}}% | {{revenue_pct_p50}}% |
| Bring all to market P75 | {{cost_to_p75}} | {{payroll_pct_p75}}% | {{revenue_pct_p75}}% |

## output_format

Present as a compensation benchmarking report:
1. **Executive Summary** -- overall position vs. market, key gaps, top recommendations and cost
2. **Job Matching** -- benchmark codes, level/scope match quality
3. **Market Comparison** -- compa-ratio analysis (base + TCC) by role with geographic adjustment
4. **Pay Equity** -- gender, race, tenure gap analysis with statistical significance
5. **Total Rewards** -- base, bonus, LTI, benefits valuation as % of base
6. **Executive Comp** -- base, bonus, LTI, 162(m), parachute analysis (if applicable)
7. **Recommendations** -- prioritized actions with cost and timeline

## constraints

- Compa-ratio = (Current Salary / Market P50) × 100 -- target 95-105% for market-competitive positions
- Jobs with <5 survey matches should use a broader benchmark or regression-based estimation
- Geographic cost-of-labor indices vary by survey source -- Radford, Mercer, and WTW each use different metro area definitions
- Pay equity analysis requires minimum 5 incumbents per group for statistical significance (t-test / Mann-Whitney)
- Executive comp (Section 162(m)) applies to publicly held companies only -- private company deductibility follows ordinary business expense rules
- Total rewards modeling should include all employer-paid benefits (employer portion of payroll taxes, workers comp, unemployment insurance)
- Startup / VC-backed companies often use 50-75th percentile base with significant equity upside potential (options / RSUs)
- PE-backed companies typically favor LTI with performance-based vesting (EBITDA, revenue growth, IRR hurdles)
- FLSA exempt/non-exempt classification must be validated alongside compensation -- misclassification carries wage & hour liability
- For multi-state employers, state-specific minimum wage, paid leave, and pay transparency laws create compliance risk
- Pay transparency laws (CA, CO, NY, WA) may require salary ranges in job postings -- benchmarking informs compliant range setting
- SEC pay-ratio disclosure (CEO to median employee) applies to public companies -- private companies should still monitor for board/investor relations
