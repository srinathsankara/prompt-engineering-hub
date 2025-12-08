---
title: Review Engagement -- Analytical Procedures & Inquiries
service_line: assurance
subcategory: review
use_case_type: drafting
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: assurance-sme
reviewer: assurance-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["review-engagement", "ssars-21", "ar-c-90", "analytical-procedures", "inquiry", "limited-assurance", "claude"]
test_suites: []
---

## system_prompt

I'm a . 21 (AR-C 90). You apply analytical procedures and management inquiries to obtain limited assurance that no material modifications are needed for the financial statements to conform to GAAP (or OCBOA).

## context

- Client: {{client_name}}
- Entity Type: {{entity_type}}
- Period Under Review: {{period_end}}
- Prior Period Auditor/Reviewer: {{prior_accountants}}
- Prior Opinion/Conclusion: {{prior_conclusion}}
- Known Risk Factors: {{risk_factors}}

## user_prompt

Perform a review engagement for {{client_name}} for the period ending {{period_end}}.

### 1. Inquiries of Management

| Inquiry Area | Questions | Management Response | Follow-Up Needed? |
|-------------|----------|-------------------|:-----------------:|
| Accounting Principles | Are all transactions recorded in accordance with GAAP/OCBOA? | {{inquiry_principles}} | {{followup_principles}} |
| Related Party Transactions | Have all related party transactions been identified and disclosed? | {{inquiry_rpt}} | {{followup_rpt}} |
| Contingencies & Commitments | Are there any pending litigation, claims, or commitments? | {{inquiry_contingencies}} | {{followup_contingencies}} |
| Subsequent Events | Have any events occurred after period end requiring adjustment/disclosure? | {{inquiry_subsequent}} | {{followup_subsequent}} |
| Fraud & Error | Is management aware of any fraud or suspected fraud? | {{inquiry_fraud}} | {{followup_fraud}} |
| Compliance | Has there been any non-compliance with laws and regulations? | {{inquiry_compliance}} | {{followup_compliance}} |
| Going Concern | Are there conditions that raise substantial doubt about ability to continue? | {{inquiry_gc}} | {{followup_gc}} |

### 2. Analytical Procedures

| Financial Line Item | Prior Period | Current Period | Expected Trend | Actual Variance | Acceptable? | Investigation |
|:------------------:|:-----------:|:--------------:|:--------------:|:--------------:|:----------:|:------------:|
| Revenue | {{rev_prior}} | {{rev_current}} | {{rev_expected}} | {{rev_variance}}% | {{rev_acceptable}} | {{rev_investigation}} |
| Gross Profit % | {{gp_prior}}% | {{gp_current}}% | {{gp_expected}}% | {{gp_variance}} | {{gp_acceptable}} | {{gp_investigation}} |
| Operating Expenses | {{opex_prior}} | {{opex_current}} | {{opex_expected}} | {{opex_variance}}% | {{opex_acceptable}} | {{opex_investigation}} |
| Other Income/Expense | {{other_prior}} | {{other_current}} | {{other_expected}} | {{other_variance}}% | {{other_acceptable}} | {{other_investigation}} |
| Net Income | {{ni_prior}} | {{ni_current}} | {{ni_expected}} | {{ni_variance}}% | {{ni_acceptable}} | {{ni_investigation}} |

| Ratio | Prior Period | Current Period | Industry Benchmark | Variance Explanation |
|:----:|:-----------:|:--------------:|:-----------------:|---------------------|
| Current Ratio | {{cr_prior}} | {{cr_current}} | {{cr_benchmark}} | {{cr_explanation}} |
| Debt-to-Equity | {{de_prior}} | {{de_current}} | {{de_benchmark}} | {{de_explanation}} |
| Gross Margin % | {{gm_prior}} | {{gm_current}} | {{gm_benchmark}} | {{gm_explanation}} |
| Days Sales Outstanding | {{dso_prior}} | {{dso_current}} | {{dso_benchmark}} | {{dso_explanation}} |

### 3. Review Conclusion

| Element | Status |
|---------|:------:|
| Financial statements prepared per applicable framework | {{fs_compliant}} |
| All material modifications considered | {{modifications_considered}} |
| Known departure from GAAP / OCBOA identified? | {{known_departure}} |
| Modified conclusion required? | {{modified_conclusion}} |
| Review report issued | {{review_issued}} |

## output_format

Present as a review engagement file: 1. Management Inquiry Documentation, 2. Analytical Procedures Results with Variance Investigation, 3. Ratio Analysis, 4. Review Conclusion, 5. Review Report, 6. Management Representation Letter.

## constraints

- Review provides limited assurance -- the report states "no material modifications should be necessary" rather than "presents fairly"
- Inquiry and analytical procedures are the primary procedures -- no confirmation, observation, or inspection is required
- If a known departure from GAAP is identified, the review report must be modified
- Review requires obtaining a management representation letter signed by appropriate management
- If prior period was audited, reference to predecessor auditor's report may be needed in current period financials
- Review procedures should be documented in accordance with AR-C 90 with sufficient detail for an experienced reviewer to understand the work performed
