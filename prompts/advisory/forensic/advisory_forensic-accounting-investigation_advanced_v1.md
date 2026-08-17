---
title: Forensic Accounting & Fraud Investigation
service_line: advisory
subcategory: forensic
use_case_type: investigation
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["forensic-accounting", "fraud-investigation", "financial-crimes", "asset-tracing", "expert-witness", "litigation-support", "claude"]
test_suites: []
---

## system_prompt

I've led fraud investigations and litigation support engagements where the evidence was buried in a decade of journal entries. Benford's Law and analytics get you to the anomaly; the hard work is turning it into evidence that survives cross-examination. You apply the ACFE Fraud Tree framework, Benford's Law analysis, and data analytics to detect anomalies and build evidentiary support for civil and criminal proceedings.

## context

- Engagement Type: {{engagement_type}} (fraud investigation / litigation support / asset tracing / expert witness / compliance review)
- Client: {{client_name}}
- Subject / Target: {{subject}}
- Allegation / Issue: {{allegation}}
- Affected Period: {{period_start}} to {{period_end}}
- Estimated Financial Impact: {{estimated_impact}}
- Legal Counsel: {{legal_counsel}}
- Regulatory Body (if applicable): {{regulatory_body}}

## user_prompt

Plan and execute a forensic accounting investigation into {{allegation}}.

### 1. Investigation Scope & Objectives

| Objective | Priority | Methodology | Expected Deliverable |
|-----------|:--------:|-------------|---------------------|
| {{objective_1}} | {{priority_1}} | {{methodology_1}} | {{deliverable_1}} |
| {{objective_2}} | {{priority_2}} | {{methodology_2}} | {{deliverable_2}} |
| {{objective_3}} | {{priority_3}} | {{methodology_3}} | {{deliverable_3}} |

### 2. Data Collection Plan

| Data Source | Type | Owner | Request Status | Chain of Custody |
|-------------|------|-------|:--------------:|:----------------:|
| {{data_source_1}} | {{data_type_1}} | {{data_owner_1}} | {{request_status_1}} | {{coc_1}} |
| {{data_source_2}} | {{data_type_2}} | {{data_owner_2}} | {{request_status_2}} | {{coc_2}} |
| {{data_source_3}} | {{data_type_3}} | {{data_owner_3}} | {{request_status_3}} | {{coc_3}} |

### 3. Red Flag & Anomaly Detection

| Red Flag Category | Specific Test | Result | Investigative Action |
|------------------|--------------|--------|---------------------|
| Journal Entry Anomalies | Unusual entries at period end / weekends / by unauthorized users | {{je_result}} | {{je_action}} |
| Vendor / Payee | Duplicate payments, shell companies, address matches with employees | {{vendor_result}} | {{vendor_action}} |
| Employee / Payroll | Ghost employees, unusual overtime, commission anomalies | {{payroll_result}} | {{payroll_action}} |
| Revenue Recognition | Bill-and-hold, side agreements, channel stuffing indicators | {{revenue_result}} | {{revenue_action}} |
| Expense Reimbursement | Duplicate submissions, personal expenses, policy violations | {{expense_result}} | {{expense_action}} |
| Asset Misappropriation | Inventory shrinkage, fixed asset disappearances, unusual write-offs | {{asset_result}} | {{asset_action}} |

### 4. Financial Analysis

| Analysis Performed | Period 1 | Period 2 | Variance | Explanation | 
|-------------------|:--------:|:--------:|:--------:|-------------|
| Revenue Trends | {{rev_p1}} | {{rev_p2}} | {{rev_var}} | {{rev_explanation}} |
| Gross Margin % | {{gm_p1}}% | {{gm_p2}}% | {{gm_var}} | {{gm_explanation}} |
| OpEx as % of Revenue | {{opex_p1}}% | {{opex_p2}}% | {{opex_var}} | {{opex_explanation}} |
| Cash Conversion Cycle | {{ccc_p1}} days | {{ccc_p2}} days | {{ccc_var}} | {{ccc_explanation}} |

### 5. Findings & Report Structure

| Finding | Evidence Type | Weight (Preponderance / Clear & Convincing) | Impact | Recommended Action |
|---------|:------------:|:------------------------------------------:|:------:|:-----------------:|
| {{finding_1}} | {{evidence_type_1}} | {{evidence_weight_1}} | {{impact_1}} | {{action_1}} |
| {{finding_2}} | {{evidence_type_2}} | {{evidence_weight_2}} | {{impact_2}} | {{action_2}} |

## output_format

Present as a forensic investigation plan and findings report: 1. Scope & Objectives, 2. Data Collection with Chain of Custody, 3. Anomaly Detection Results, 4. Financial Analysis, 5. Findings & Conclusions, 6. Recommended Remediation.

## constraints

- Chain of custody documentation is critical for admissibility -- all data acquisition must be logged with date, time, and handler
- Attorney-client privilege: work product may be protected if directed by legal counsel -- document engagement through counsel
- The fraud examiner standard (ACFE / AICPA) requires independence, objectivity, and due professional care
- All findings must be supported by evidence -- opinions based on incomplete data should be qualified
- Report should clearly distinguish between facts (supported by evidence), findings (analyst conclusions), and opinions (expert testimony)
- Consider spoliation holds -- instruct client to preserve all relevant data immediately upon engagement
