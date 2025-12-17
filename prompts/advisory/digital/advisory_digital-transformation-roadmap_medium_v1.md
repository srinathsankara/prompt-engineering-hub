---
title: Digital Transformation Roadmap -- Strategy & Execution
service_line: advisory
subcategory: digital
use_case_type: planning
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["digital-transformation", "strategy", "change-management", "technology-adoption", "digital-maturity", "claude"]
test_suites: []
---

## system_prompt

I'm a . You cover digital strategy, process automation, cloud adoption, data analytics, and customer experience transformation.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Employees: {{employee_count}}
- Current Digital Maturity: {{current_maturity}} (Level 1-Ad Hoc / Level 2-Emerging / Level 3-Scaling / Level 4-Optimized)
- Primary Drivers: {{transformation_drivers}} (growth / cost reduction / customer experience / compliance / competitive pressure)
- Budget Range: {{budget_range}}
- Timeline: {{transformation_timeline}} months

## user_prompt

Develop a digital transformation roadmap for {{client_name}}.

### 1. Digital Maturity Assessment

| Dimension | Current State | Score (1-4) | Target State | Target Score | Priority |
|-----------|-------------|:----------:|-------------|:------------:|:--------:|
| Strategy & Leadership | {{digit_strategy_current}} | {{digit_strategy_score}} | {{digit_strategy_target}} | {{digit_strategy_target_score}} | {{digit_strategy_priority}} |
| Customer Experience | {{cx_current}} | {{cx_score}} | {{cx_target}} | {{cx_target_score}} | {{cx_priority}} |
| Operations & Process | {{ops_current}} | {{ops_score}} | {{ops_target}} | {{ops_target_score}} | {{ops_priority}} |
| Data & Analytics | {{data_current}} | {{data_score}} | {{data_target}} | {{data_target_score}} | {{data_priority}} |
| Technology Infrastructure | {{tech_current}} | {{tech_score}} | {{tech_target}} | {{tech_target_score}} | {{tech_priority}} |
| People & Culture | {{people_current}} | {{people_score}} | {{people_target}} | {{people_target_score}} | {{people_priority}} |

### 2. Transformation Pillars

| Pillar | Initiatives | Estimated Cost | ROI | Timeline | Dependencies |
|--------|------------|:-------------:|:---:|:--------:|:-----------:|
| Cloud & Infrastructure | {{cloud_initiatives}} | {{cloud_cost}} | {{cloud_roi}} | {{cloud_timeline}} | {{cloud_deps}} |
| Process Automation | {{automation_initiatives}} | {{automation_cost}} | {{automation_roi}} | {{automation_timeline}} | {{automation_deps}} |
| Data & Analytics | {{analytics_initiatives}} | {{analytics_cost}} | {{analytics_roi}} | {{analytics_timeline}} | {{analytics_deps}} |
| Digital Customer Experience | {{cx_initiatives}} | {{cx_cost}} | {{cx_roi}} | {{cx_timeline}} | {{cx_deps}} |

### 3. Technology Stack Recommendations

| Domain | Recommended Solution(s) | Alternatives | Selection Criteria |
|--------|-----------------------|-------------|-------------------|
| ERP / Core Systems | {{erp_solution}} | {{erp_alternatives}} | {{erp_criteria}} |
| CRM | {{crm_solution}} | {{crm_alternatives}} | {{crm_criteria}} |
| Data Platform | {{data_solution}} | {{data_alternatives}} | {{data_criteria}} |
| Automation Tools | {{automation_solution}} | {{automation_alternatives}} | {{automation_criteria}} |

## output_format

Present as a digital transformation roadmap: 1. Maturity Assessment, 2. Transformation Pillars with ROI, 3. Technology Stack Recommendations, 4. Implementation Phasing, 5. Change Management & Governance, 6. Risk & Dependencies.

## constraints

- Middle-market companies typically lack dedicated digital teams -- implementation support and change management are critical
- Budget should include a 20% contingency for integration and unanticipated scope
- Quick wins (0-3 months) build momentum and executive sponsorship -- prioritize visible, measurable improvements
- Data migration and system integration are the primary failure points in transformation projects
- Organizational change management budget should be a minimum of 10% of total transformation budget
