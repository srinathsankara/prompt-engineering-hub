---
title: IT Due Diligence -- Software Capitalization, Tech Stack & Cybersecurity
service_line: transactions
subcategory: it-due-diligence
use_case_type: assessment
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: transactions-sme
reviewer: transactions-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["it-due-diligence", "software-capitalization", "asc-350-40", "tech-stack", "cybersecurity-diligence", "saas", "claude"]
test_suites: []
---

## system_prompt

I'm a . You work alongside financial and tax due diligence teams.

## context

- Transaction: {{transaction_name}}
- Target: {{target_company}}
- Industry: {{industry}}
- Target IT Spend: {{it_spend}} (annual)
- Target Engineering Headcount: {{engineering_headcount}}
- Key Software Products: {{key_software_products}}
- Target's Cloud Provider: {{cloud_provider}} (AWS / Azure / GCP / on-prem / hybrid)
- Key Diligence Concern: {{diligence_concern}}

## user_prompt

Perform IT due diligence for the acquisition of {{target_company}}.

### Software Capitalization (ASC 350-40) Assessment

| Project | Capitalized Costs | Amortization Life | Status | POC/GAAP Compliance | Risk Rating |
|---------|:--------------:|:-----------------:|:-----:|:-----------------:|:----------:|
| {{project_1}} | {{capitalized_1}} | {{life_1}} years | {{status_1}} | {{compliance_1}} | {{risk_1}} |
| {{project_2}} | {{capitalized_2}} | {{life_2}} years | {{status_2}} | {{compliance_2}} | {{risk_2}} |

| ASC 350-40 Criteria | Project 1 | Project 2 | Notes |
|:-------------------:|:---------:|:---------:|-------|
| Preliminary project stage completed | {{prelim_1}} | {{prelim_2}} | Costs in this stage must be expensed |
| Application development stage | {{app_dev_1}} | {{app_dev_2}} | Costs eligible for capitalization |
| Post-implementation / operations stage | {{post_impl_1}} | {{post_impl_2}} | Costs must be expensed |
| Capitalization threshold met | {{threshold_1}} | {{threshold_2}} | {{threshold_notes}} |
| Amortization start date appropriate | {{amort_start_1}} | {{amort_start_2}} | Begins when software is ready for intended use |

### Technology Stack Assessment

| Assessment Area | Current State | Risk Level | Finding |
|----------------|:------------:|:---------:|---------|
| Architecture (monolith vs. microservices) | {{architecture_status}} | {{architecture_risk}} | {{architecture_finding}} |
| Technical Debt Assessment | {{tech_debt_status}} | {{tech_debt_risk}} | {{tech_debt_finding}} |
| API Ecosystem / Integration Maturity | {{api_status}} | {{api_risk}} | {{api_finding}} |
| Cloud Infrastructure (scalability, cost efficiency) | {{cloud_status}} | {{cloud_risk}} | {{cloud_finding}} |
| DevOps / CI/CD Maturity | {{devops_status}} | {{devops_risk}} | {{devops_finding}} |
| Database / Data Architecture | {{db_status}} | {{db_risk}} | {{db_finding}} |
| Key Person Dependency (technical) | {{key_person_status}} | {{key_person_risk}} | {{key_person_finding}} |
| IP / Code Ownership Verification | {{ip_status}} | {{ip_risk}} | {{ip_finding}} |
| Open Source / Third-Party Licensing | {{oss_status}} | {{oss_risk}} | {{oss_finding}} |

### Post-Merger IT Integration Plan

| Workstream | Target State | Complexity | Timeline | Cost Estimate | 
|-----------|:-----------:|:---------:|:--------:|:------------:|
| Infrastructure Integration | {{infra_target}} | {{infra_complexity}} | {{infra_timeline}} | {{infra_cost}} |
| Application Integration / Migration | {{app_target}} | {{app_complexity}} | {{app_timeline}} | {{app_cost}} |
| Data Integration | {{data_target}} | {{data_complexity}} | {{data_timeline}} | {{data_cost}} |
| Security Integration | {{security_target}} | {{security_complexity}} | {{security_timeline}} | {{security_cost}} |
| IT Organization / Team Integration | {{org_target}} | {{org_complexity}} | {{org_timeline}} | {{org_cost}} |

## output_format

Present as an IT due diligence report: 1. Software Capitalization Analysis (ASC 350-40), 2. Tech Stack Assessment with Key Person Risk, 3. Cybersecurity / Privacy Diligence, 4. IT Organizational Capability, 5. Post-Merger IT Integration Roadmap, 6. Risk & Deal Recommendation.

## constraints

- ASC 350-40: internal-use software costs capitalized during application development stage; preliminary and post-implementation costs are expensed
- Cloud computing arrangements (hosting) are service contracts under ASC 350-40 -- implementation costs (setup, data migration) follow specific guidance
- Tech debt should be quantified in terms of remediation effort (developer hours) and its impact on the acquisition thesis
- Key person risk: identify developers with unique domain knowledge, no documentation, or sole ownership of critical systems
- Open source license compliance (GPL, AGPL) can create IP exposure -- inventory OSS components and verify license compatibility with business model
- Post-merger IT integration cost should be estimated at 3-8% of deal value for technology-heavy acquisitions
- Cybersecurity diligence should include penetration test results, incident history, and regulatory compliance status (SOC 2, ISO 27001, PCI, HIPAA)
- SaaS targets: evaluate customer churn, infrastructure scalability, single-tenant vs. multi-tenant architecture, SOC 2 Type II reports, and revenue recognition (ASC 606)
- IT due diligence findings should be incorporated into the purchase agreement representations and warranties related to IT systems and cybersecurity
