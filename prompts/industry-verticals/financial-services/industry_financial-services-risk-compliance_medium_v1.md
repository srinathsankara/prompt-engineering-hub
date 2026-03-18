---
title: Financial Services -- Risk, Regulatory & Compliance Framework
service_line: industry-verticals
subcategory: financial-services
use_case_type: assessment
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: industry-sme
reviewer: industry-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["financial-services", "banking", "regulatory-compliance", "risk-management", "capital-markets", "sec", "finra", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand the regulatory landscape (SEC, FINRA, FRB, OCC, FDIC, state regulators), risk management frameworks, capital requirements, and financial reporting specific to these entities.

## context

- Client: {{client_name}}
- Subsector: {{subsector}} (bank / credit union / asset manager / broker-dealer / fintech / insurance / REIT)
- Regulatory Bodies: {{regulatory_bodies}}
- Assets Under Management / Total Assets: {{aua}}
- Key Regulatory Concern: {{regulatory_concern}}

## user_prompt

Conduct a compliance and risk assessment for {{client_name}}, a {{subsector}}.

### Regulatory Compliance Status

| Regulation | Applicable? | Current Status | Examination Findings | Remediation | 
|------------|:-----------:|:--------------:|:-------------------:|:-----------:|
| SEC / FINRA (if applicable) | {{sec_applicable}} | {{sec_status}} | {{sec_findings}} | {{sec_remediation}} |
| BSA / AML Program | {{bsa_applicable}} | {{bsa_status}} | {{bsa_findings}} | {{bsa_remediation}} |
| OFAC Sanctions Screening | {{ofac_applicable}} | {{ofac_status}} | {{ofac_findings}} | {{ofac_remediation}} |
| Consumer Protection (Reg B, E, Z, CC) | {{consumer_applicable}} | {{consumer_status}} | {{consumer_findings}} | {{consumer_remediation}} |
| Privacy / GLBA | {{glba_applicable}} | {{glba_status}} | {{glba_findings}} | {{glba_remediation}} |
| Capital Adequacy (Basel III) | {{capital_applicable}} | {{capital_status}} | {{capital_findings}} | {{capital_remediation}} |
| Liquidity / Contingency Funding | {{liquidity_applicable}} | {{liquidity_status}} | {{liquidity_findings}} | {{liquidity_remediation}} |
| Fintech / State Licensing | {{fintech_applicable}} | {{fintech_status}} | {{fintech_findings}} | {{fintech_remediation}} |

### Risk Assessment

| Risk Type | Inherent Risk | Control Effectiveness | Residual Risk | Trend |
|-----------|:------------:|:--------------------:|:-------------:|:----:|
| Credit Risk | {{credit_inherent}} | {{credit_controls}} | {{credit_residual}} | {{credit_trend}} |
| Market Risk | {{market_inherent}} | {{market_controls}} | {{market_residual}} | {{market_trend}} |
| Operational Risk | {{ops_inherent}} | {{ops_controls}} | {{ops_residual}} | {{ops_trend}} |
| Compliance Risk | {{comp_inherent}} | {{comp_controls}} | {{comp_residual}} | {{comp_trend}} |
| Reputational Risk | {{reputation_inherent}} | {{reputation_controls}} | {{reputation_residual}} | {{reputation_trend}} |
| Cybersecurity Risk | {{cyber_inherent}} | {{cyber_controls}} | {{cyber_residual}} | {{cyber_trend}} |

## output_format

Present as a financial services compliance and risk assessment: 1. Regulatory Compliance Matrix, 2. Risk Assessment Heat Map, 3. Capital / Liquidity Adequacy, 4. Examination Readiness Assessment, 5. Remediation Roadmap.

## constraints

- BSA/AML program must be risk-based and commensurate with the institution's size and complexity -- there is no one-size-fits-all
- SEC and FINRA have specific reporting deadlines (Form ADV, Form PF, Form CRS) -- timely filing is a compliance requirement
- Fintech companies face dual regulatory tracks: state money transmitter licensing and potential federal oversight (CFPB, SEC)
- Capital adequacy assessment should include stress testing under adverse economic scenarios for banks >$250B
- Privacy rule compliance includes annual privacy notice delivery and opt-out mechanisms under GLBA
- Third-party vendor risk management is a top regulatory priority for all financial services subsectors
