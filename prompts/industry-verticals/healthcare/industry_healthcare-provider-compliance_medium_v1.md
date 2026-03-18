---
title: Healthcare -- Provider Compliance, Reimbursement & Operations
service_line: industry-verticals
subcategory: healthcare
use_case_type: assessment
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: industry-sme
reviewer: industry-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["healthcare", "hipaa", "cms", "reimbursement", "compliance", "providers", "hospitals", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand regulatory compliance (HIPAA, Stark Law, Anti-Kickback), reimbursement models, revenue cycle management, and healthcare-specific financial reporting.

## context

- Client: {{client_name}}
- Provider Type: {{provider_type}} (hospital / physician group / LTC / behavioral health / DME / health tech)
- Beds / Providers: {{beds_or_providers}}
- Primary Revenue Sources: {{revenue_sources}} (Medicare / Medicaid / Commercial / Self-pay / Capitation)
- Annual Revenue: {{annual_revenue}}
- Key Compliance Concern: {{compliance_concern}}

## user_prompt

Assess compliance, reimbursement, and operational areas for {{client_name}}, a {{provider_type}}.

### Compliance Assessment

| Area | Requirements | Current Status | Risk Level | Remediation |
|------|-------------|:--------------:|:---------:|:-----------:|
| HIPAA Privacy & Security | {{hipaa_requirements}} | {{hipaa_status}} | {{hipaa_risk}} | {{hipaa_remediation}} |
| Stark Law / Anti-Kickback | {{stark_requirements}} | {{stark_status}} | {{stark_risk}} | {{stark_remediation}} |
| Medicare Conditions of Participation | {{mcr_cop_requirements}} | {{mcr_cop_status}} | {{mcr_cop_risk}} | {{mcr_cop_remediation}} |
| False Claims Act | {{fca_requirements}} | {{fca_status}} | {{fca_risk}} | {{fca_remediation}} |
| Licensure & Accreditation | {{license_requirements}} | {{license_status}} | {{license_risk}} | {{license_remediation}} |
| 340B Drug Pricing (if applicable) | {{340b_requirements}} | {{340b_status}} | {{340b_risk}} | {{340b_remediation}} |

### Revenue Cycle Assessment

| Metric | Current | Benchmark | Gap | Improvement Opportunity |
|--------|:------:|:---------:|:---:|------------------------|
| Days in A/R | {{dar_current}} | {{dar_benchmark}} | {{dar_gap}} | {{dar_opportunity}} |
| Clean Claim Rate | {{ccr_current}}% | {{ccr_benchmark}}% | {{ccr_gap}} | {{ccr_opportunity}} |
| Denial Rate | {{denial_current}}% | {{denial_benchmark}}% | {{denial_gap}} | {{denial_opportunity}} |
| Net Collection Rate | {{ncr_current}}% | {{ncr_benchmark}}% | {{ncr_gap}} | {{ncr_opportunity}} |
| Cost to Collect | {{ctc_current}}% | {{ctc_benchmark}}% | {{ctc_gap}} | {{ctc_opportunity}} |

## output_format

Present as a healthcare provider assessment: 1. Compliance Matrix with Risk Ratings, 2. Revenue Cycle Performance, 3. Reimbursement Analysis, 4. Regulatory Exposure Assessment, 5. Operational Improvement Recommendations.

## constraints

- HIPAA breach notification: report to HHS and affected individuals within 60 days for breaches affecting 500+ records
- Stark Law prohibits physician referrals to entities where the physician has a financial relationship -- exceptions require specific structuring
- Medicare reimbursement is shifting toward value-based models (MIPS, ACOs, bundled payments) -- providers must invest in quality reporting infrastructure
- Revenue cycle KPIs should be benchmarked against peer organizations of similar size and case mix
- 340B program compliance requires auditable tracking of drug purchases, dispensing, and patient eligibility
- Telehealth expansion has created new compliance considerations around licensure, privacy, and reimbursement across state lines
