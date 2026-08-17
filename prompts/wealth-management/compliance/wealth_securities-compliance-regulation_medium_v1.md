---
title: Wealth Management -- Securities & Regulatory Compliance
service_line: wealth-management
subcategory: compliance
use_case_type: compliance
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: wealth-sme
reviewer: wealth-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["wealth-management", "securities-compliance", "regulatory-compliance", "sec", "finra", "ria", "broker-dealer", "claude"]
test_suites: ["testing/test-cases/wealth-management/compliance-medium.json"]
---

## system_prompt

I've built and tested compliance programs for RIAs and broker-dealers -- and watched which policies survive an SEC exam versus which just sit in a binder. The difference is usually whether the program has teeth: real oversight, real testing, real consequences. You understand SEC and FINRA regulatory requirements, fiduciary standards (Regulation Best Interest, Investment Advisers Act), compliance program design, and examination preparation.

## context

- Client: {{client_name}}
- Firm Type: {{firm_type}} (RIA / broker-dealer / hybrid / dual registrant)
- AUM / AUA: {{aum}}
- Number of Clients: {{client_count}}
- Regulatory Jurisdiction: {{regulatory_jurisdiction}} (SEC / state / FINRA / dual)
- Custodian(s): {{custodians}}
- Primary Compliance Concerns: {{compliance_concerns}}

## user_prompt

Conduct a compliance review for {{client_name}}, a {{firm_type}}.

### Regulatory Compliance Assessment

| Requirement | Current Status | Gap | Remediation Plan | Priority |
|-------------|:------------:|:---:|:----------------:|:--------:|
| Form ADV (annual updating amendment + Part 2 brochure) | {{adv_status}} | {{adv_gap}} | {{adv_remediation}} | {{adv_priority}} |
| Form CRS Relationship Summary | {{crs_status}} | {{crs_gap}} | {{crs_remediation}} | {{crs_priority}} |
| Regulation Best Interest (Reg BI) | {{reg_bi_status}} | {{reg_bi_gap}} | {{reg_bi_remediation}} | {{reg_bi_priority}} |
| Custody Rule (Rule 206(4)-2) | {{custody_status}} | {{custody_gap}} | {{custody_remediation}} | {{custody_priority}} |
| Code of Ethics / Personal Trading | {{ethics_status}} | {{ethics_gap}} | {{ethics_remediation}} | {{ethics_priority}} |
| Advertising Rule (Rule 206(4)-1) | {{advertising_status}} | {{advertising_gap}} | {{advertising_remediation}} | {{advertising_priority}} |
| Proxy Voting | {{proxy_status}} | {{proxy_gap}} | {{proxy_remediation}} | {{proxy_priority}} |
| Privacy / Reg S-P | {{privacy_status}} | {{privacy_gap}} | {{privacy_remediation}} | {{privacy_priority}} |
| Anti-Money Laundering (AML) | {{aml_status}} | {{aml_gap}} | {{aml_remediation}} | {{aml_priority}} |
| Business Continuity / Disaster Recovery | {{bcp_status}} | {{bcp_gap}} | {{bcp_remediation}} | {{bcp_priority}} |
| Books & Records (Rule 204-2) | {{books_status}} | {{books_gap}} | {{books_remediation}} | {{books_priority}} |
| Annual Compliance Review | {{annual_review_status}} | {{annual_review_gap}} | {{annual_review_remediation}} | {{annual_review_priority}} |

### Exam Readiness Checklist

| Document / Policy | Current Version | Last Reviewed | Ready for Exam |
|------------------|:--------------:|:-------------:|:-------------:|
| Compliance Manual | {{compliance_manual_version}} | {{compliance_manual_review}} | {{compliance_manual_ready}} |
| Business Continuity Plan | {{bcp_version}} | {{bcp_review}} | {{bcp_ready}} |
| Code of Ethics | {{ethics_version}} | {{ethics_review}} | {{ethics_ready}} |
| AML Program | {{aml_version}} | {{aml_review}} | {{aml_ready}} |
| Client Advisory Board / Conflicts Register | {{cab_version}} | {{cab_review}} | {{cab_ready}} |
| Vendor Due Diligence Files | {{vendor_version}} | {{vendor_review}} | {{vendor_ready}} |
| Employee Supervisory Files | {{supervision_version}} | {{supervision_review}} | {{supervision_ready}} |

## output_format

Present as a wealth management compliance review: 1. Regulatory Compliance Matrix with Priority Actions, 2. Exam Readiness Checklist, 3. Fiduciary / Reg BI Assessment, 4. Marketing & Advertising Review, 5. Custody & Safekeeping, 6. Remediation Timeline.

## constraints

- Form ADV must be updated annually within 90 days of fiscal year end -- amendments for material changes must be filed promptly
- Regulation Best Interest (Reg BI) requires broker-dealers to act in the retail customer's best interest -- compliance includes disclosure, care, conflict of interest, and compliance obligations
- Custody Rule: RIAs with custody of client funds or securities must maintain qualified custodian, send account statements, and undergo annual surprise examination
- Marketing Rule: prohibits misleading statements, requires fair and balanced treatment of performance, and mandates substantiation of claims
- SEC exams focus on: fiduciary duty, conflicts of interest, custody, valuation, performance advertising, and cybersecurity
- Privacy notices must be delivered annually under Reg S-P -- opt-out rights must be provided before sharing nonpublic personal information
- Electronic communication supervision requirements continue to be a hot button in FINRA and SEC examinations
- Cybersecurity has become a cornerstone of SEC examinations -- every firm must demonstrate a written information security program (WISP)
- Best execution: RIAs must periodically review whether execution costs are reasonable in the context of the client's investment objectives
- Recordkeeping: electronic communications (including text messages, WhatsApp, personal device usage) are subject to books and records requirements
