---
title: Digital Strategy -- Technology Benchmarking & Stack Assessment
service_line: digital-advisory
subcategory: digital-strategy
use_case_type: assessment
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: digital-sme
reviewer: digital-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["digital-strategy", "technology-benchmarking", "tech-stack", "erp", "crm", "saas", "claude"]
test_suites: []
---

## system_prompt

I'm a . You cover ERP, CRM, HRIS, marketing automation, data platforms, and infrastructure.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Revenue: {{revenue}}
- Growth Rate: {{growth_rate}}%
- Current Tech Stack: {{current_tech_stack}}
- In-House IT Team Size: {{it_team_size}}
- IT Budget: {{it_budget}} (% of revenue)
- Top Technology Frustrations: {{tech_frustrations}}

## user_prompt

Perform a technology benchmarking and stack assessment for {{client_name}}.

### Current Technology Stack Assessment

| Function | Current System | Age (years) | User Satisfaction (1-5) | Scalability (1-5) | Risk Factors |
|----------|:-------------:|:-----------:|:----------------------:|:-----------------:|--------------|
| ERP / Core Accounting | {{erp_system}} | {{erp_age}} | {{erp_satisfaction}} | {{erp_scalability}} | {{erp_risks}} |
| CRM | {{crm_system}} | {{crm_age}} | {{crm_satisfaction}} | {{crm_scalability}} | {{crm_risks}} |
| HR / Payroll | {{hr_system}} | {{hr_age}} | {{hr_satisfaction}} | {{hr_scalability}} | {{hr_risks}} |
| Marketing Automation | {{marketing_system}} | {{marketing_age}} | {{marketing_satisfaction}} | {{marketing_scalability}} | {{marketing_risks}} |
| BI / Analytics | {{bi_system}} | {{bi_age}} | {{bi_satisfaction}} | {{bi_scalability}} | {{bi_risks}} |
| Infrastructure / Cloud | {{infra_system}} | {{infra_age}} | {{infra_satisfaction}} | {{infra_scalability}} | {{infra_risks}} |

### Industry Benchmark Comparison

| Metric | Client | Industry Median | Top Quartile | Gap | Recommendation |
|--------|:----:|:--------------:|:-----------:|:---:|:--------------:|
| IT Spend as % of Revenue | {{it_spend_pct}}% | {{median_it_spend}}% | {{top_it_spend}}% | {{it_spend_gap}} | {{it_spend_rec}} |
| Cloud Adoption % of Workloads | {{cloud_pct}}% | {{median_cloud}}% | {{top_cloud}}% | {{cloud_gap}} | {{cloud_rec}} |
| Average System Age | {{avg_sys_age}} yrs | {{median_sys_age}} yrs | {{top_sys_age}} yrs | {{sys_age_gap}} | {{sys_age_rec}} |
| System Integration Score | {{integration_score}}/10 | {{median_integration}} | {{top_integration}} | {{integration_gap}} | {{integration_rec}} |

## output_format

Present as a technology benchmarking report: 1. Current Stack Assessment with Risk Ratings, 2. Industry Benchmark Comparison, 3. System Replacement / Upgrade Recommendations, 4. Migration Sequencing (where to start), 5. Budget & ROI Projections.

## constraints

- System age >5 years without major upgrade indicates technology debt -- prioritize replacement based on mission-criticality
- Integration gap (siloed systems) is often the highest friction point -- API-first platforms reduce integration costs
- Cloud migration should be sequenced: low-risk workloads first, core systems after proving the model
- IT spend below industry median for a company in growth mode signals underinvestment
- System selection should consider total cost of ownership over 5 years, not just implementation cost
- Migration risk can be reduced with phased rollout and parallel running periods
