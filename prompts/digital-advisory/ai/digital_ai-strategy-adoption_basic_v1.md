---
title: AI Strategy & Adoption -- Opportunity Assessment
service_line: digital-advisory
subcategory: ai
use_case_type: analysis
complexity_tier: basic
validation_status: draft
version: 1.0.0
author: digital-sme
reviewer: digital-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["ai-strategy", "machine-learning", "llm", "adoption", "use-case-prioritization", "claude"]
test_suites: ["testing/test-cases/digital-advisory/ai-strategy-basic.json"]
---

## system_prompt

I've helped middle-market companies adopt AI, and the pattern I keep seeing is a rush to buy before anyone defines the use case. The projects that deliver are the ones that start with the data and the problem, not the model. You understand the landscape of generative AI, traditional ML, RPA, and the practical considerations (data readiness, talent, governance, cost) for middle-market companies adopting AI.

## context

- Client: {{client_name}}
- Industry: {{industry}}
- Current AI Maturity: {{ai_maturity}} (Exploring / Experimenting / Operational / Scaled)
- Budget for AI Initiatives: {{ai_budget}}
- Data Environment: {{data_environment}} (cloud / on-prem / hybrid)
- Key Business Challenges: {{business_challenges}}

## user_prompt

Develop an AI strategy and adoption assessment for {{client_name}}.

### AI Opportunity Assessment

| Business Function | Use Case | Feasibility (1-5) | Impact (1-5) | Priority | Data Requirements | Implementation Approach |
|:----------------:|----------|:-----------------:|:-----------:|:--------:|-------------------|------------------------|
| Operations | {{ops_use_case}} | {{ops_feasibility}} | {{ops_impact}} | {{ops_priority}} | {{ops_data}} | {{ops_approach}} |
| Customer Service | {{cx_use_case}} | {{cx_feasibility}} | {{cx_impact}} | {{cx_priority}} | {{cx_data}} | {{cx_approach}} |
| Finance / Accounting | {{finance_use_case}} | {{finance_feasibility}} | {{finance_impact}} | {{finance_priority}} | {{finance_data}} | {{finance_approach}} |
| Marketing & Sales | {{marketing_use_case}} | {{marketing_feasibility}} | {{marketing_impact}} | {{marketing_priority}} | {{marketing_data}} | {{marketing_approach}} |
| HR / Talent | {{hr_use_case}} | {{hr_feasibility}} | {{hr_impact}} | {{hr_priority}} | {{hr_data}} | {{hr_approach}} |

### AI Readiness Assessment

| Readiness Factor | Current State | Gap | Remediation |
|-----------------|-------------|-----|-------------|
| Data Quality & Accessibility | {{data_readiness}} | {{data_gap}} | {{data_remediation}} |
| Technology Infrastructure | {{tech_readiness}} | {{tech_gap}} | {{tech_remediation}} |
| Talent & Skills | {{talent_readiness}} | {{talent_gap}} | {{talent_remediation}} |
| Governance & Risk Framework | {{gov_readiness}} | {{gov_gap}} | {{gov_remediation}} |
| Executive Sponsorship | {{exec_readiness}} | {{exec_gap}} | {{exec_remediation}} |

## output_format

Present as an AI strategy assessment: 1. Use Case Matrix (prioritized by feasibility/impact), 2. AI Readiness Assessment, 3. Technology & Vendor Landscape, 4. Risk & Governance Framework, 5. Implementation Roadmap, 6. Budget Estimate & ROI Projections.

## constraints

- Start with high-feasibility, medium-impact use cases for proof of concept -- build credibility before pursuing moonshots
- Data readiness is the #1 blocker: most organizations underestimate the data quality and accessibility effort
- AI governance (ethics, bias, privacy, security) should be established before production deployment, not retrofitted
- Generative AI requires a different implementation approach than traditional ML -- evaluate total cost of ownership including inference costs
- Vendor evaluation should consider data residency, privacy compliance (GDPR/CCPA), and model transparency
- Employee training and change management is often the largest underestimed cost in AI adoption
