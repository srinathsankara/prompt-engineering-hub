---
title: Prompt Engineering Reference
type: reference
version: 1.0.0
---

## Key Concepts

| Concept | Description |
|---------|-------------|
| System Prompt | Sets the expert persona, methodology, and constraints |
| User Prompt | Template with `{{variable}}` placeholders for task-specific inputs |
| Output Format | Defines the structure the model should follow |
| Constraints | Hard rules and lessons learned from practice |
| Temperature | Controls creativity; 0.2-0.3 for factual, 0.5-0.7 for creative |

## File Naming Convention

`{service-line}_{use-case-type}_{complexity-tier}_v{version}.md`

Examples: `tax_corporate-income_basic_v1.md`, `infra_k8s-debugging_medium_v1.md`

## Frontmatter Requirements

- title, service_line, subcategory, use_case_type, complexity_tier
- validation_status, version, author, reviewer
- created_date, last_modified, tags, test_suites

See `config/prompt-standards.json` for the complete schema.
