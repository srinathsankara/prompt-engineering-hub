---
pattern_name: Role Specialization Pattern
pattern_type: role-prompting
complexity_tier: basic
version: 1.0.0
---

## Pattern Overview

Assign the model a specific professional persona with domain expertise, methodological constraints, and decision-making frameworks. This pattern ensures output reflects years of domain experience rather than generic knowledge.

## When to Use

- Any prompt where domain credibility matters
- When output must reflect specific regulatory or procedural knowledge
- When the audience expects practitioner-level expertise

## Template Structure

### System Prompt

```
I've done {{role_expertise}} for {{years}} years. Here's what I've learned:

The most important thing in this domain: {{core_principle}}.

My approach to {{task_type}}:
1. {{step_1}}
2. {{step_2}}
3. {{step_3}}

Rules I never break:
- {{rule_1}}
- {{rule_2}}

Here's how I think about {{task_type}}: {{decision_framework}}
```

## Key Parameters

- Temperature: 0.3 (maintains consistent professional voice)
- Persona specificity drives output quality
- Domain-specific constraints reduce hallucination risk
