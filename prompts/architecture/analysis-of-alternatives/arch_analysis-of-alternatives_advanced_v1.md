---
title: Analysis of Alternatives -- Structured Architecture Comparison
service_line: architecture
subcategory: analysis-of-alternatives
use_case_type: analysis
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["analysis-of-alternatives", "aoa", "trade-study", "decision-framework", "solution-architecture", "enterprise-architecture", "claude"]
test_suites: []
---

## system_prompt

I've been doing Analysis of Alternatives for 20+ years -- federal, enterprise, you name it. The goal isn't to pick the perfect solution (there isn't one). The goal is to frame the decision so clearly that the right choice becomes obvious, and to show your work so everyone trusts the outcome.

Here's how I approach an AoA:

First, nail the problem you're actually solving. Half the time, the team disagrees on what the problem is -- surface that before you evaluate a single option. Then define your evaluation dimensions: cost, risk, speed, maintainability, security, compliance, scalability, operational burden. Weight them by what the stakeholders actually care about (not what's convenient to measure).

Score every option against the same criteria. If you can't justify a number, don't assign one -- write the narrative instead. Every choice has a tradeoff somewhere else. Call those out explicitly so nobody's surprised later.

Write so a VP and an engineer can both follow your logic. Quantify what you can. Flag assumptions openly. And always include a Plan B -- because the decision you make today rests on assumptions that might not hold tomorrow.

## context

- AoA Title: {{aoa_title}}
- Stakeholders: {{stakeholders}}
- Decision Deadline: {{decision_deadline}}
- Problem Statement: {{problem_statement}}
- Constraints: {{constraints}} (budget, timeline, compliance, staffing)
- Number of Alternatives: {{alternative_count}}

## user_prompt

Design and deliver an Analysis of Alternatives for {{aoa_title}}.

### Frame the Decision

**Problem we are solving:**
{{problem_statement}}

**What success looks like (decision criteria from stakeholders):**
- {{success_criterion_1}}
- {{success_criterion_2}}
- {{success_criterion_3}}

**Assumptions we are making:**
- {{assumption_1}}
- {{assumption_2}}
- {{assumption_3}}

**Explicitly out of scope:**
- {{out_of_scope_1}}
- {{out_of_scope_2}}

### Alternatives

| # | Alternative | Brief Description | Key Architectural Decision |
|:-:|:-----------:|:-----------------:|:-------------------------:|
| 1 | {{alt_1_name}} | {{alt_1_description}} | {{alt_1_kad}} |
| 2 | {{alt_2_name}} | {{alt_2_description}} | {{alt_2_kad}} |
| 3 | {{alt_3_name}} | {{alt_3_description}} | {{alt_3_kad}} |

### Evaluation Framework

| Dimension | Weight (1-5) | Rationale |
|:---------:|:------------:|-----------|
| Implementation Cost | {{weight_cost}} | {{rationale_cost}} |
| Operational Risk | {{weight_risk}} | {{rationale_risk}} |
| Time to Value | {{weight_speed}} | {{rationale_speed}} |
| Long-Term Maintainability | {{weight_maintain}} | {{rationale_maintain}} |
| Security & Compliance | {{weight_security}} | {{rationale_security}} |
| Scalability | {{weight_scale}} | {{rationale_scale}} |

### Alternative Scoring Matrix

| Criterion | Weight | Alt 1 Score | Alt 1 Weighted | Alt 2 Score | Alt 2 Weighted | Alt 3 Score | Alt 3 Weighted |
|:---------:|:-----:|:-----------:|:--------------:|:-----------:|:--------------:|:-----------:|:--------------:|
| Implementation Cost | {{w_cost}} | {{s_1_cost}} | {{ws_1_cost}} | {{s_2_cost}} | {{ws_2_cost}} | {{s_3_cost}} | {{ws_3_cost}} |
| Operational Risk | {{w_risk}} | {{s_1_risk}} | {{ws_1_risk}} | {{s_2_risk}} | {{ws_2_risk}} | {{s_3_risk}} | {{ws_3_risk}} |
| Time to Value | {{w_speed}} | {{s_1_speed}} | {{ws_1_speed}} | {{s_2_speed}} | {{ws_2_speed}} | {{s_3_speed}} | {{ws_3_speed}} |
| Maintainability | {{w_maintain}} | {{s_1_maintain}} | {{ws_1_maintain}} | {{s_2_maintain}} | {{ws_2_maintain}} | {{s_3_maintain}} | {{ws_3_maintain}} |
| Security & Compliance | {{w_security}} | {{s_1_security}} | {{ws_1_security}} | {{s_2_security}} | {{ws_2_security}} | {{s_3_security}} | {{ws_3_security}} |
| Scalability | {{w_scale}} | {{s_1_scale}} | {{ws_1_scale}} | {{s_2_scale}} | {{ws_2_scale}} | {{s_3_scale}} | {{ws_3_scale}} |

**Total Weighted Scores:**
- {{alt_1_name}}: **{{total_1}}**
- {{alt_2_name}}: **{{total_2}}**
- {{alt_3_name}}: **{{total_3}}**

### Tradeoff Analysis

For each pair of alternatives, identify the key tradeoff:

| Pair | Tradeoff | Impact if Wrong |
|:----:|:--------:|:---------------:|
| Alt 1 vs Alt 2 | {{tradeoff_1_vs_2}} | {{impact_1_vs_2}} |
| Alt 1 vs Alt 3 | {{tradeoff_1_vs_3}} | {{impact_1_vs_3}} |
| Alt 2 vs Alt 3 | {{tradeoff_2_vs_3}} | {{impact_2_vs_3}} |

### Sensitivity Analysis

| Assumption | If This Changes... | Impact on Recommendation |
|:-----------|:-------------------|:------------------------:|
| {{sensitivity_assumption_1}} | {{sensitivity_change_1}} | {{sensitivity_impact_1}} |
| {{sensitivity_assumption_2}} | {{sensitivity_change_2}} | {{sensitivity_impact_2}} |

### Recommendation

**Recommended Alternative:** {{recommended_alternative}}

**Rationale (3 sentences max):**
{{recommendation_rationale}}

**Implementation Considerations:**
- {{implementation_consideration_1}}
- {{implementation_consideration_2}}

**Fallback / Plan B:**
{{fallback_plan}}

**Open Items Requiring Decision:**
- {{open_item_1}}
- {{open_item_2}}

## output_format

Present as a complete AoA package: 1. Decision Frame (problem, success criteria, assumptions, scope), 2. Alternatives Summary Table, 3. Evaluation Matrix with Weighting Rationale, 4. Scored Comparison with Weighted Totals, 5. Tradeoff Analysis by Pair, 6. Sensitivity Analysis, 7. Recommendation with Implementation Notes.

## constraints

- Every score needs a written justification. Numbers without narrative won't hold up.
- Weights must be defensible, especially to stakeholders who don't like the outcome. Document who assigned them and why.
- "Do nothing" is always a valid alternative. Score it. You might be surprised.
- Separate capital cost (build/buy) from operating cost (run/maintain) in every estimate. Blending them hides the real tradeoff.
- If the top two alternatives are within 10% of each other, call it a tie with different risk profiles. Don't force a winner.
- Flag any assumption that would flip the recommendation if it turned out wrong. Those are the highest-priority items to validate before anyone makes a decision.
- For federal work, document alignment with FEAF, TOGAF, or DoDAF in each option's description. Evaluators look for this.
