---
title: Compilation Engagement -- Financial Statement Preparation
service_line: assurance
subcategory: compilations
use_case_type: drafting
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: assurance-sme
reviewer: assurance-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["compilation", "ssars-21", "financial-statements", "preparation", "reporting", "claude"]
test_suites: []
---

## system_prompt

I've prepared and compiled financial statements under SSARS 21 for small businesses that will never need an audit. The trap is over-servicing -- doing procedures that push the engagement beyond its scope and change what the report can say. You understand the distinction between preparation engagements, compilation engagements, and reviews, and know when each is appropriate.

## context

- Client: {{client_name}}
- Entity Type: {{entity_type}} (LLC / S corp / C corp / partnership / sole prop)
- Industry: {{industry}}
- Reporting Basis: {{reporting_basis}} (GAAP / tax basis / cash basis / modified cash / OCBOA)
- Engagement Type: {{engagement_type}} (preparation / compilation)
- Period: {{period_end}}
- Prior Period Comparative: {{prior_comparative}} (Yes / No)

## user_prompt

Perform a compilation engagement for {{client_name}} for the period ending {{period_end}}.

### Engagement Administration

| Item | Detail |
|------|--------|
| Engagement Letter Executed | {{engagement_letter_date}} |
| Independence Determination | {{independent_status}} (independent / not independent -- disclose) |
| Acceptance / Continuance Evaluation | {{acceptance_evaluation}} |
| Management Responsibilities Acknowledged | {{management_acknowledgment}} |

### Financial Statement Preparation

| Statement | Included? | Notes |
|-----------|:---------:|-------|
| Balance Sheet | {{bs_included}} | {{bs_notes}} |
| Income Statement | {{is_included}} | {{is_notes}} |
| Statement of Changes in Equity / Members' Equity | {{equity_included}} | {{equity_notes}} |
| Statement of Cash Flows | {{cf_included}} | {{cf_notes}} |
| Notes to Financial Statements | {{notes_included}} | {{notes_notes}} |

### Compilation Report

Accountant's Compilation Report -- Standard Wording Checklist:
- [ ] Appropriate addressee
- [ ] Statement that management is responsible for financial statements and internal controls
- [ ] Statement that accountant performed compilation in accordance with SSARS
- [ ] Description of compilation procedures (reading financial statements, limited inquiries, no opinion or assurance)
- [ ] Accountant's responsibility is to conduct compilation and issue report
- [ ] Date of report
- [ ] Accountant's signature
- [ ] If not independent -- disclosure statement appended

### Known Departures from GAAP / OCBOA

| Departure | Effect on Financial Statements | Disclosure in Notes? |
|-----------|-------------------------------|:-------------------:|
| {{departure_1}} | {{departure_effect_1}} | {{departure_disclosed_1}} |
| {{departure_2}} | {{departure_effect_2}} | {{departure_disclosed_2}} |

## output_format

Present as a compilation engagement file: 1. Engagement Administration Checklist, 2. Trial Balance / Working Trial Balance, 3. Compiled Financial Statements, 4. Compilation Report, 5. Accounting Policies Note, 6. Management Representation Letter.

## constraints

- Compilation provides NO assurance -- report language must explicitly state that no audit or review was performed
- If the accountant is not independent, the compilation report must disclose the lack of independence
- SSARS 21 distinguishes between preparation (no report required) and compilation (report required) -- confirm engagement type
- Financial statements must be clearly labeled "unaudited"
- Compilation does not require an understanding of internal controls or performing verification procedures
- Prior period comparative financial statements require consistency with prior year presentation or disclosure of change
- OCBOA (e.g., tax basis, cash basis) is common for non-GAAP reporting entities -- ensure basis is consistently applied
