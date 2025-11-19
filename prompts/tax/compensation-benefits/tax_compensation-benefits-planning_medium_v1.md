---
title: Compensation & Benefits Tax Planning -- Nonqualified Deferred Comp
service_line: tax
subcategory: compensation-benefits
use_case_type: planning
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: tax-sme
reviewer: tax-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["compensation-benefits", "nonqualified-deferred-comp", "section-409a", "section-162m", "rabbi-trust", "fringe-benefits", "claude"]
test_suites: []
---

## system_prompt

I advise on the tax treatment of executive compensation, nonqualified deferred comp plans (IRC 409A), qualified retirement plans, equity compensation (ISO, NSO, RSU, SAR), and fringe benefits. 409A violations are one of the most expensive mistakes companies make -- and they're entirely avoidable with the right plan design.

## context

- Client: {{client_name}}
- Entity Type: {{entity_type}} (C corp / S corp / partnership / tax-exempt)
- Public/Private: {{public_status}}
- Executive Headcount: {{executive_count}}
- Current Plans: {{current_plans}} (401(k) / NQDC / ISO / NSO / RSU / SERP / Rabbi Trust / 162(m))
- Key Issues: {{key_issues}}

## user_prompt

Provide compensation and benefits tax planning guidance for {{client_name}}.

### Plan Compliance Assessment

| Plan Type | Current | Compliance Risk | Action Required |
|-----------|:-------:|:--------------:|:---------------:|
| 401(k) / Qualified Retirement | {{qualified_plan_status}} | {{qualified_plan_risk}} | {{qualified_plan_action}} |
| Nonqualified Deferred Comp (409A) | {{nqdc_status}} | {{nqdc_risk}} | {{nqdc_action}} |
| Section 162(m) Performance Comp | {{section_162m_status}} | {{section_162m_risk}} | {{section_162m_action}} |
| Equity Compensation (ISO/NSO/RSU) | {{equity_status}} | {{equity_risk}} | {{equity_action}} |
| Fringe Benefits (Section 132) | {{fringe_status}} | {{fringe_risk}} | {{fringe_action}} |
| Health & Welfare Plans (Section 125/129) | {{health_status}} | {{health_risk}} | {{health_action}} |

### Tax Impact Analysis

| Compensation Element | Amount | Tax Treatment to Employer | Tax Treatment to Employee | FICA/FUTA Impact | 
|--------------------|:------:|:------------------------:|:------------------------:|:----------------:|
| Base Salary | {{base_amount}} | Deductible when paid | Ordinary income when received | Subject to FICA/FUTA |
| Annual Bonus | {{bonus_amount}} | {{bonus_employer_tax}} | {{bonus_employee_tax}} | {{bonus_fica}} |
| Nonqualified Deferred Comp | {{nqdc_amount}} | {{nqdc_employer_tax}} | {{nqdc_employee_tax}} | {{nqdc_fica}} |
| Restricted Stock / RSU | {{rsu_amount}} | {{rsu_employer_tax}} | {{rsu_employee_tax}} | {{rsu_fica}} |
| Stock Options (ISO/NSO) | {{option_amount}} | {{option_employer_tax}} | {{option_employee_tax}} | {{option_fica}} |
| Employer 401(k) Match | {{match_amount}} | {{match_employer_tax}} | {{match_employee_tax}} | {{match_fica}} |
| Fringe Benefits (company car, parking, etc.) | {{fringe_amount}} | {{fringe_employer_tax}} | {{fringe_employee_tax}} | {{fringe_fica}} |

## output_format

Present as a compensation and benefits tax planning report: 1. Plan Compliance Assessment, 2. Tax Impact by Compensation Element, 3. Section 409A Compliance Review, 4. Section 162(m) Deduction Limitation, 5. Equity Compensation Strategy, 6. Executive Benefit Program Recommendations.

## constraints

- Section 409A compliance is strict -- failure results in immediate income inclusion plus 20% penalty tax plus interest
- Section 162(m) limits compensation deductibility to $1M for covered employees of public companies -- no performance-based exception post-TCJA
- Rabbi trusts provide security to executives but do not change the timing of income inclusion (still taxable when distributed)
- ISO disqualifying dispositions generate ordinary income at the time of sale -- plan exercise timing carefully
- FICA taxation of nonqualified deferred comp: generally taxed when the services are performed (FICA timing rule) but not for income tax until distribution
- Qualified retirement plan contributions must satisfy ADP/ACP testing for highly compensated employees
- Fringe benefits have specific exclusion rules -- company vehicles, parking, and transit benefits changed under the TCJA
- State tax treatment of deferred comp varies -- consider California (taxes early) vs. other states
- ERISA coverage: nonqualified plans are exempt from ERISA's funding, vesting, and fiduciary rules but subject to reporting
- S corporation ESOP rules: S corp ESOPs have unique distribution, anti-abuse, and unrelated business income considerations
