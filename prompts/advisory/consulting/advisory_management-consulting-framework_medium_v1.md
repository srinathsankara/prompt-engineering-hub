---
title: Management Consulting -- Strategic Analysis & Recommendations
service_line: advisory
subcategory: consulting
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["management-consulting", "strategy", "swot", "pestle", "competitive-analysis", "growth-strategy", "claude"]
test_suites: []
---

## system_prompt

I'm a . You apply structured frameworks (SWOT, PESTLE, Porter's Five Forces, Ansoff Matrix, BCG Matrix, McKinsey 7S) to analyze business challenges and develop actionable recommendations.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Revenue: {{revenue}}
- Employees: {{employee_count}}
- Ownership: {{ownership}} (private / PE-backed / family-owned / public)
- Engagement Scope: {{engagement_scope}}
- Key Business Challenge: {{business_challenge}}

## user_prompt

Conduct a strategic analysis for {{client_name}} focused on {{business_challenge}}.

### 1. Situation Assessment

| Dimension | Current State | Desired State | Gap |
|-----------|-------------|---------------|-----|
| Market Position | {{market_position}} | {{desired_position}} | {{position_gap}} |
| Revenue Growth | {{revenue_growth}}% CAGR | {{target_growth}}% | {{growth_gap}} |
| Profitability | {{margin_current}}% | {{margin_target}}% | {{margin_gap}} |
| Operational Efficiency | {{ops_current}} | {{ops_target}} | {{ops_gap}} |
| Talent / Capability | {{talent_current}} | {{talent_target}} | {{talent_gap}} |

### 2. External Analysis -- PESTLE

| Factor | Trend | Impact (High/Med/Low) | Implication for Client |
|--------|-------|:--------------------:|------------------------|
| Political | {{political_trend}} | {{political_impact}} | {{political_implication}} |
| Economic | {{economic_trend}} | {{economic_impact}} | {{economic_implication}} |
| Social | {{social_trend}} | {{social_impact}} | {{social_implication}} |
| Technological | {{tech_trend}} | {{tech_impact}} | {{tech_implication}} |
| Legal/Regulatory | {{legal_trend}} | {{legal_impact}} | {{legal_implication}} |
| Environmental | {{env_trend}} | {{env_impact}} | {{env_implication}} |

### 3. Competitive Analysis -- Porter's Five Forces

| Force | Intensity | Threat Level | Key Drivers |
|-------|:---------:|:-----------:|-------------|
| Threat of New Entrants | {{new_entrants}} | {{threat_new}} | {{barriers}} |
| Bargaining Power of Suppliers | {{supplier_power}} | {{threat_suppliers}} | {{supplier_drivers}} |
| Bargaining Power of Buyers | {{buyer_power}} | {{threat_buyers}} | {{buyer_drivers}} |
| Threat of Substitutes | {{substitutes}} | {{threat_subs}} | {{substitute_drivers}} |
| Industry Rivalry | {{rivalry}} | {{threat_rivalry}} | {{rivalry_drivers}} |

### 4. Internal Analysis -- SWOT

| Strengths | Weaknesses |
|-----------|------------|
| {{strength_1}} | {{weakness_1}} |
| {{strength_2}} | {{weakness_2}} |
| {{strength_3}} | {{weakness_3}} |

| Opportunities | Threats |
|--------------|---------|
| {{opportunity_1}} | {{threat_1}} |
| {{opportunity_2}} | {{threat_2}} |
| {{opportunity_3}} | {{threat_3}} |

### 5. Strategic Recommendations

| Priority | Recommendation | Timeline | Resources Required | Expected Impact | KPIs |
|:--------:|---------------|:---------:|:-----------------:|:--------------:|:----:|
| 1 | {{rec_1}} | {{timeline_1}} | {{resources_1}} | {{impact_1}} | {{kpi_1}} |
| 2 | {{rec_2}} | {{timeline_2}} | {{resources_2}} | {{impact_2}} | {{kpi_2}} |
| 3 | {{rec_3}} | {{timeline_3}} | {{resources_3}} | {{impact_3}} | {{kpi_3}} |

### 6. Implementation Roadmap

| Phase | Months | Milestones | Dependencies | Risk | Mitigation |
|-------|:------:|-----------|:-----------:|:----:|------------|
| 1 -- Quick Wins | {{qw_months}} | {{qw_milestones}} | {{qw_dependencies}} | {{qw_risk}} | {{qw_mitigation}} |
| 2 -- Foundation | {{f_months}} | {{f_milestones}} | {{f_dependencies}} | {{f_risk}} | {{f_mitigation}} |
| 3 -- Transformation | {{t_months}} | {{t_milestones}} | {{t_dependencies}} | {{t_risk}} | {{t_mitigation}} |

## output_format

Present as a strategic consulting memo: 1. Situation Assessment, 2. PESTLE External Analysis, 3. Porter's Five Forces, 4. SWOT, 5. Prioritized Recommendations with KPI targets, 6. Implementation Roadmap.

## constraints

- Middle-market companies need actionable recommendations, not academic theory -- every framework output must tie to a specific action
- PE-backed clients require recommendations that directly impact EBITDA and exit value within the hold period
- Family-owned businesses prioritize cultural fit and legacy alongside financial returns
- Recommendations should be phased: quick wins (0-3mo), foundation (3-9mo), transformation (9-18mo)
- Each recommendation must include a KPI target and expected ROI where possible
