---
title: HR Consulting -- Compliance, Benchmarking & Workforce Strategy
service_line: people-workforce
subcategory: hr-consulting
use_case_type: assessment
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: people-sme
reviewer: people-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["hr-consulting", "compliance", "workforce-planning", "employee-handbook", "flsa", "eeo", "leave-management", "claude"]
test_suites: []
---

## system_prompt

I help clients build compliant people operations that actually work -- employee handbooks, HR compliance (FLSA, FMLA, ADA, EEO, state-specific laws), workforce planning, and HR technology selection. The regulations change constantly, and what worked last year might put you at risk today.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Employees: {{employee_count}} (full-time: {{ft_count}}, part-time: {{pt_count}}, contractors: {{contractor_count}})
- Locations: {{locations}} (states)
- Current HR Staff: {{hr_staff_count}}
- Current HRIS / Payroll System: {{hris_system}}
- Top HR Challenges: {{hr_challenges}}

## user_prompt

Perform an HR compliance and operational assessment for {{client_name}}.

### HR Compliance Checklist

| Compliance Area | Current State | Risk Level | Required Action | Priority |
|-----------------|:------------:|:---------:|:---------------:|:--------:|
| Employee Classification (FLSA exempt/non-exempt) | {{flsa_status}} | {{flsa_risk}} | {{flsa_action}} | {{flsa_priority}} |
| Independent Contractor Classification | {{contractor_status}} | {{contractor_risk}} | {{contractor_action}} | {{contractor_priority}} |
| FMLA / Leave Administration | {{fmla_status}} | {{fmla_risk}} | {{fmla_action}} | {{fmla_priority}} |
| ADA / Reasonable Accommodation | {{ada_status}} | {{ada_risk}} | {{ada_action}} | {{ada_priority}} |
| EEO / OFCCP (if federal contractor) | {{eeo_status}} | {{eeo_risk}} | {{eeo_action}} | {{eeo_priority}} |
| State-Specific Compliance | {{state_status}} | {{state_risk}} | {{state_action}} | {{state_priority}} |
| Pay Transparency Laws | {{pay_transparency_status}} | {{pay_transparency_risk}} | {{pay_transparency_action}} | {{pay_transparency_priority}} |
| Employee Handbook (current?) | {{handbook_status}} | {{handbook_risk}} | {{handbook_action}} | {{handbook_priority}} |
| I-9 Compliance | {{i9_status}} | {{i9_risk}} | {{i9_action}} | {{i9_priority}} |

### Employee Handbook Content Checklist

| Section | Included? | Last Updated | Notes |
|---------|:---------:|:-----------:|-------|
| At-Will Employment Statement | {{at_will_included}} | {{at_will_updated}} | {{at_will_notes}} |
| Equal Employment Opportunity | {{eeo_included}} | {{eeo_updated}} | {{eeo_notes}} |
| Code of Conduct / Ethics | {{conduct_included}} | {{conduct_updated}} | {{conduct_notes}} |
| Compensation & Pay Practices | {{pay_included}} | {{pay_updated}} | {{pay_notes}} |
| Time Off / Leave Policies | {{leave_included}} | {{leave_updated}} | {{leave_notes}} |
| Remote Work / Hybrid Policy | {{remote_included}} | {{remote_updated}} | {{remote_notes}} |
| Anti-Harassment / Non-Discrimination | {{anti_harass_included}} | {{anti_harass_updated}} | {{anti_harass_notes}} |
| Technology & Social Media | {{tech_included}} | {{tech_updated}} | {{tech_notes}} |
| Employee Benefits Summary | {{benefits_included}} | {{benefits_updated}} | {{benefits_notes}} |
| Complaint / Grievance Procedure | {{grievance_included}} | {{grievance_updated}} | {{grievance_notes}} |

### HR Technology Recommendation

| Requirement | Current System | Recommended | Rationale |
|-------------|:-------------:|:-----------:|-----------|
| HRIS / Employee Records | {{hris_current}} | {{hris_recommended}} | {{hris_rationale}} |
| Payroll Processing | {{payroll_current}} | {{payroll_recommended}} | {{payroll_rationale}} |
| Time & Attendance | {{time_current}} | {{time_recommended}} | {{time_rationale}} |
| Performance Management | {{perf_current}} | {{perf_recommended}} | {{perf_rationale}} |
| Applicant Tracking (ATS) | {{ats_current}} | {{ats_recommended}} | {{ats_rationale}} |

## output_format

Present as an HR consulting report: 1. Compliance Risk Assessment Matrix, 2. Employee Handbook Content Audit, 3. FLSA / Worker Classification Review, 4. Multi-State Compliance Requirements, 5. HR Technology Evaluation, 6. Workforce Planning Recommendations, 7. Priority Action Plan.

## constraints

- Worker misclassification (FLSA / independent contractor) carries the highest financial risk -- back taxes, penalties, and wage claims
- Multi-state employers must comply with each state's unique laws: paid leave (CA, NY, WA, CO, MA), pay transparency (CA, CO, NY, WA), and non-compete restrictions
- Employee handbooks should be reviewed annually and updated for regulatory changes -- stale handbooks increase liability
- Federal contractors face additional OFCCP compliance requirements including affirmative action plans and EEO-1 reporting
- HR technology evaluation should prioritize the employee experience alongside compliance and reporting needs
- I-9 compliance: remote verification flexibilities under alternative procedures require careful documentation
- HR compliance is especially critical during M&A -- acquire the talent, not the employment liability
