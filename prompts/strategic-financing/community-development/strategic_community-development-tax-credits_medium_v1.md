---
title: Community Development -- Tax Credits & Incentives (LIHTC, HTC, Renewable Energy)
service_line: strategic-financing
subcategory: community-development
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: strategic-financing-sme
reviewer: strategic-financing-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["community-development", "lihtc", "low-income-housing", "historic-tax-credits", "renewable-energy", "section-42", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand the compliance, syndication, and investor equity dynamics of these credits.

## context

- Client: {{client_name}}
- Project Type: {{project_type}} (LIHTC / HTC / renewable energy / brownfields / mixed-finance)
- Location: {{project_location}}
- Total Development Cost: {{total_cost}}
- Developer Status: {{developer_status}} (for-profit / nonprofit / joint venture)
- Credit Amount Sought: {{credit_amount}}
- Placed-in-Service Date: {{placed_in_service}}

## user_prompt

Structure and assess the tax credit financing for the {{project_type}} project {{project_name}}.

### Tax Credit Eligibility

| Credit Type | Qualification Requirements | Status | Eligible Amount |
|:-----------:|--------------------------|:------:|:--------------:|
| {{credit_type_1}} | {{requirements_1}} | {{status_1}} | {{amount_1}} |
| {{credit_type_2}} | {{requirements_2}} | {{status_2}} | {{amount_2}} |

### Investor Syndication Structure

| Component | Percentage | Amount | Terms |
|-----------|:---------:|:------:|-------|
| Federal Credits | {{fed_credit_pct}}% | {{fed_credit_amount}} | {{fed_credit_terms}} |
| State Credits (if applicable) | {{state_credit_pct}}% | {{state_credit_amount}} | {{state_credit_terms}} |
| Investor Equity Contribution | {{investor_equity_pct}}% | {{investor_equity_amount}} | {{investor_equity_terms}} |
| Developer Equity | {{developer_equity_pct}}% | {{developer_equity_amount}} | {{developer_equity_terms}} |
| Permanent / Construction Debt | {{debt_pct}}% | {{debt_amount}} | {{debt_terms}} |
| Soft / Subsidy Sources | {{soft_pct}}% | {{soft_amount}} | {{soft_terms}} |

## output_format

Present as a community development tax credit analysis: 1. Credit Eligibility Assessment, 2. Capital Stack Structure, 3. Investor/Partner Economics, 4. Compliance Requirements (15-year LIHTC compliance, HTC 5-year recapture, etc.), 5. Feasibility Analysis & Recommendation.

## constraints

- LIHTC compliance period: 15 years (affordability restrictions) + 15-year extended use period
- Historic Tax Credit (20%) requires certified rehabilitation meeting Secretary of Interior Standards
- ITC and PTC eligibility for renewable energy is subject to prevailing wage and apprenticeship requirements under the Inflation Reduction Act
- Tax credit syndication requires a minimum investor equity contribution of $0.85-$0.95 per credit dollar in most markets
- State tax credits have separate allocation rounds, caps, and compliance requirements -- never assume state credit availability
- Mixed-finance projects (LIHTC + HTC + NMTC) are complex and require coordinating compliance across multiple programs
- Renewable energy ITC is 30% for projects meeting prevailing wage requirements (6% base without) -- confirm wage compliance
- Community Development Entities (CDEs) may provide additional NMTC financing layered with other credits
- Developer fee is subject to program-specific limits (LIHTC: 15% max, HTC: varies by state)
