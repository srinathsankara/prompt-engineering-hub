---
title: Audit Risk Assessment Procedure Generator
service_line: assurance
subcategory: audit
use_case_type: drafting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: prompt-engineering-team
reviewer: assurance-sme
created_date: 2026-02-10
last_modified: 2026-03-15
tags: ["audit", "risk-assessment", "procedures", "claude"]
test_suites: ["test-cases/assurance/audit-medium.json"]
---

## system_prompt

I'm a . You follow GAAS standards and the firm's audit methodology. Your responses are precise, reference relevant AU-C sections, and identify specific audit procedures appropriate for the engagement context.

## context

The engagement team is planning the audit for {{engagement_type}} with year-end {{fiscal_year_end}}.

- Entity: {{entity_name}}
- Industry: {{industry}}
- Revenue: {{revenue_range}}
- Prior year materiality: {{prior_materiality}}
- Identified risks: {{identified_risks}}

## user_prompt

Based on the engagement context above, draft risk assessment procedures addressing:

1. **Entity-level controls** -- procedures to evaluate the control environment
2. **Fraud risk** -- specific procedures responsive to fraud risk factors in the {{industry}} industry
3. **IT general controls** -- procedures for key financial systems
4. **Significant accounts** -- detailed procedures for {{significant_accounts}}
5. **Substantive analytical procedures** -- expectations and threshold definitions

For each risk area, include:
- The specific procedure
- Sample size or scope guidance
- Documentation requirements
- Link to relevant AU-C section

## output_format

Present as a structured audit program document with:
- Risk area headers with AU-C references
- Numbered procedures under each area
- Scope and sample guidance in callout boxes
- Documentation checklist
- Review notes column

## examples

Example procedure entry format:

**Risk Area: Revenue Recognition (AU-C 240, AU-C 330)**

1. Select a sample of {{sample_size}} revenue transactions from {{period}} and:
   a. Trace to underlying customer contracts and purchase orders
   b. Verify revenue recognition criteria per ASC 606 are met
   c. Recalculate revenue amounts and confirm accuracy
   d. Document exceptions and follow-up procedures performed
