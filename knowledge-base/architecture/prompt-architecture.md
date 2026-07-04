# Prompt Architecture Standards

## Document Structure

Every prompt in the library follows a consistent architecture with three mandatory sections and three optional sections:

### Mandatory Sections

| Section | Purpose | Required Fields |
|---|---|---|
| `system_prompt` | Defines the AI's role, expertise, behavioral guardrails, and firm-specific context | Role definition, expertise domain, communication style, compliance guardrails |
| `user_prompt` | The task instruction with variable injection points | Task description, variables (double-brace), context references, specific requirements |
| `output_format` | Specifies the exact structure and format of the response | Format type, section headers, disclaimer requirements, length constraints |

### Optional Sections

| Section | When to Use |
|---|---|
| `context` | Complex prompts requiring upfront engagement-level data before the instruction |
| `examples` | Few-shot patterns where input-output pairs guide behavior |
| `constraints` | Additional guardrails beyond the system prompt (e.g., tone, length, prohibited content) |
| `fallback_instructions` | Advanced prompts specifying what to do when primary instructions cannot be followed |

## Frontmatter Metadata

Every prompt file must include YAML frontmatter with these fields:

```yaml
---
title: Human-readable prompt name
service_line: tax | assurance | advisory | wealth-management
subcategory: Specific domain subcategory
use_case_type: drafting | review | summarization | extraction | classification | calculation | research | decision-support | communication | code-generation
complexity_tier: basic | medium | advanced
validation_status: draft | in_review | validated | production | deprecated
version: semver (e.g., 1.2.0)
author: Creator or team name
reviewer: SME who validated the prompt
created_date: YYYY-MM-DD
last_modified: YYYY-MM-DD
tags: [keyword1, keyword2]
test_suites: [path/to/test-suite.json]
dependencies: [path/to/pattern-or-skill.md]
---
```

## Variable Injection

Use double-brace `{{variable_name}}` for all injection points. The naming convention for variables:

- `snake_case` for variable names
- Descriptive names matching the schema defined in the associated test suite
- Default values specified in square brackets when applicable: `{{materiality [$10,000]}}`

## Versioning Strategy

| Change Type | Version Bump | Example |
|---|---|---|
| Bug fix, wording clarification | Patch (0.0.x) | 1.0.0 -> 1.0.1 |
| New examples, optional sections, expanded coverage | Minor (0.x.0) | 1.0.0 -> 1.1.0 |
| Breaking changes to output format, required sections, or core behavior | Major (x.0.0) | 1.0.0 -> 2.0.0 |

## File Naming

```
{service-line}_{subcategory-use-case}_{complexity-tier}_v{version}.md
```

Examples:
- `tax_corporate-income_basic_v1.md`
- `assurance_audit-risk_advanced_v2.md`
- `advisory_transaction-diligence_medium_v1.md`

## Quality Gates by Tier

| Gate | Basic | Medium | Advanced |
|---|---|---|---|
| Accuracy validation | Required | Required | Required |
| Edge case testing | Optional | Required | Required |
| Hallucination detection | Optional | Optional | Required |
| Compliance check | Optional | Required | Required |
| SME review | Self | Peer | Architect |
| Response time SLA | 2s | 3s | 5s |
