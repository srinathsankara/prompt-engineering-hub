---
title: Month-End Close Support & General Accounting
service_line: assurance
subcategory: accounting-services
use_case_type: workflow
complexity_tier: basic
validation_status: draft
version: 1.0.0
author: assurance-sme
reviewer: assurance-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["month-end-close", "general-accounting", "reconciliation", "journal-entries", "financial-statements", "claude"]
test_suites: []
---

## system_prompt

I'm a . You work across multiple accounting systems (QuickBooks, Xero, NetSuite, Sage, Dynamics) and ensure all deliverables meet GAAP standards.

## context

- Client: {{client_name}}
- Accounting System: {{accounting_system}}
- Reporting Currency: {{reporting_currency}}
- Fiscal Month Closing: {{closing_month}}
- Prior Month Close Completed: {{prior_close_date}}
- Open Items from Prior Month: {{open_items}}

## user_prompt

Execute the month-end close process for {{client_name}} for {{closing_month}}.

### Month-End Close Checklist

| # | Task | Owner | Due Date | Status | Notes |
|:-:|------|:-----:|:--------:|:------:|-------|
| 1 | Import/record all bank statements and perform reconciliation | {{owner_bank}} | {{due_bank}} | {{status_bank}} | {{notes_bank}} |
| 2 | Post credit card transactions; reconcile statements | {{owner_cc}} | {{due_cc}} | {{status_cc}} | {{notes_cc}} |
| 3 | Record accounts payable invoices received | {{owner_ap}} | {{due_ap}} | {{status_ap}} | {{notes_ap}} |
| 4 | Process accounts receivable invoices and credit memos | {{owner_ar}} | {{due_ar}} | {{status_ar}} | {{notes_ar}} |
| 5 | Record payroll journal entries (compensation, taxes, benefits) | {{owner_payroll}} | {{due_payroll}} | {{status_payroll}} | {{notes_payroll}} |
| 6 | Record depreciation / amortization entries | {{owner_depr}} | {{due_depr}} | {{status_depr}} | {{notes_depr}} |
| 7 | Post prepaid expense amortization | {{owner_prepaid}} | {{due_prepaid}} | {{status_prepaid}} | {{notes_prepaid}} |
| 8 | Record accrued expenses (bonuses, interest, professional fees) | {{owner_accruals}} | {{due_accruals}} | {{status_accruals}} | {{notes_accruals}} |
| 9 | Reconcile intercompany accounts (if multi-entity) | {{owner_intercompany}} | {{due_intercompany}} | {{status_intercompany}} | {{notes_intercompany}} |
| 10 | Review and post adjusting journal entries | {{owner_je}} | {{due_je}} | {{status_je}} | {{notes_je}} |
| 11 | Run trial balance and review for anomalies | {{owner_tb}} | {{due_tb}} | {{status_tb}} | {{notes_tb}} |
| 12 | Prepare financial statements (P&L, Balance Sheet, Cash Flow) | {{owner_fs}} | {{due_fs}} | {{status_fs}} | {{notes_fs}} |
| 13 | Prepare management reporting package | {{owner_report}} | {{due_report}} | {{status_report}} | {{notes_report}} |

### Journal Entry Log

| Date | JE # | Description | Account (Debit) | Amount | Account (Credit) | Amount | Prepared By | Reviewed By |
|:----:|:----:|-------------|:---------------:|:------:|:----------------:|:------:|:-----------:|:-----------:|
| {{je_date_1}} | {{je_num_1}} | {{je_desc_1}} | {{je_debit_acct_1}} | {{je_debit_amt_1}} | {{je_credit_acct_1}} | {{je_credit_amt_1}} | {{je_preparer_1}} | {{je_reviewer_1}} |
| {{je_date_2}} | {{je_num_2}} | {{je_desc_2}} | {{je_debit_acct_2}} | {{je_debit_amt_2}} | {{je_credit_acct_2}} | {{je_credit_amt_2}} | {{je_preparer_2}} | {{je_reviewer_2}} |

## output_format

Present as a month-end close status report: 1. Reconciliation Status by Account, 2. Journal Entry Log, 3. Trial Balance Summary, 4. Adjusted Trial Balance vs Prior Month Variance Report, 5. Financial Statements, 6. Open Items List.

## constraints

- All bank and credit card reconciliations must be completed before posting adjusting entries
- Supporting documentation (invoices, receipts, contracts) must be attached to all journal entries
- Financial statements should show both current month and year-to-date with prior period comparatives
- Review all material variances (>10% or >$5,000) against prior month and budget
- Close is not complete until all reconciling items are cleared or documented as open with a resolution plan
