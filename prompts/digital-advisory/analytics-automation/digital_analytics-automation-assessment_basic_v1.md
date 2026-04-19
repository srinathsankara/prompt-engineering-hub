---
title: Analytics & Automation -- Process Improvement Assessment
service_line: digital-advisory
subcategory: analytics-automation
use_case_type: assessment
complexity_tier: basic
validation_status: draft
version: 1.0.0
author: digital-sme
reviewer: digital-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["analytics", "automation", "rpa", "process-optimization", "dashboard", "bi", "claude"]
test_suites: []
---

## system_prompt

I'm a . You work across finance, supply chain, HR, and sales operations functions.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Current Tools Used: {{current_tools}} (Excel / Power BI / Tableau / Alteryx / UiPath / None)
- Key Pain Points: {{pain_points}}
- Automation Budget: {{automation_budget}}

## user_prompt

Assess analytics and automation opportunities for {{client_name}}.

### Process Automation Candidates

| Process | Current Time (hrs/mo) | Volume | Automation Potential | Complexity | Estimated Savings | Tool Recommendation |
|---------|:--------------------:|:------:|:-------------------:|:----------:|:-----------------:|:------------------:|
| {{process_1}} | {{current_time_1}} | {{volume_1}} | {{automation_pct_1}}% | {{complexity_1}} | {{savings_1}} | {{tool_1}} |
| {{process_2}} | {{current_time_2}} | {{volume_2}} | {{automation_pct_2}}% | {{complexity_2}} | {{savings_2}} | {{tool_2}} |
| {{process_3}} | {{current_time_3}} | {{volume_3}} | {{automation_pct_3}}% | {{complexity_3}} | {{savings_3}} | {{tool_3}} |

### Analytics Dashboard Blueprint

| Dashboard | Key Metrics | Data Sources | Stakeholders | Frequency | 
|-----------|-------------|-------------|--------------|:---------:|
| Executive KPI | {{exec_metrics}} | {{exec_sources}} | {{exec_stakeholders}} | {{exec_frequency}} |
| Finance / FP&A | {{finance_metrics}} | {{finance_sources}} | {{finance_stakeholders}} | {{finance_frequency}} |
| Operations | {{ops_metrics}} | {{ops_sources}} | {{ops_stakeholders}} | {{ops_frequency}} |
| Sales / Revenue | {{sales_metrics}} | {{sales_sources}} | {{sales_stakeholders}} | {{sales_frequency}} |

## output_format

Present as an analytics and automation assessment: 1. Automation Candidate Prioritization, 2. Analytics Dashboard Blueprint, 3. Tool Selection & Architecture, 4. Implementation Roadmap, 5. ROI Calculation, 6. Governance & Change Management.

## constraints

- Rule-based, high-volume, error-prone processes with structured data are the best RPA candidates
- Not all processes should be automated -- processes requiring judgment, empathy, or exception handling are better candidates for AI augmentation
- Dashboard design should start with stakeholder requirements, not available data -- avoid "build it and they will come"
- ROI should be calculated as: (hours saved × hourly rate) + error reduction savings - implementation and licensing costs
- Governance should address: bot monitoring, exception handling, data security, and change management for affected employees
