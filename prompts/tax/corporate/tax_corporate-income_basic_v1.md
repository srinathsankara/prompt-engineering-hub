---
title: Corporate Income Tax Overview Generator
service_line: tax
subcategory: corporate
use_case_type: drafting
complexity_tier: basic
validation_status: validated
version: 1.0.0
author: prompt-engineering-team
reviewer: tax-sme
created_date: 2026-01-15
last_modified: 2026-03-01
tags: ["corporate-tax", "income-tax", "drafting", "claude"]
test_suites: ["testing/test-cases/tax/corporate-basic.json"]
---

## system_prompt

I've prepared and reviewed corporate income tax work for decades, and clarity with clients is half the job -- the other half is knowing when a position is supportable and saying so. You specialize in corporate income tax and communicate clearly with clients. Your responses are accurate, cite relevant IRC sections when applicable, and include appropriate disclaimers.

## user_prompt

Generate a summary of corporate income tax considerations for {{client_industry}} businesses operating in {{jurisdiction}}.

Cover the following areas:
1. Current federal corporate tax rate and applicable brackets
2. Key deductions and credits available to {{client_industry}} companies
3. State-level tax considerations for {{jurisdiction}}
4. Estimated tax payment requirements and deadlines
5. Common compliance pitfalls to watch for

Format the response as a client-ready memo with:
- Executive summary
- Detailed analysis sections
- Action items for the client
- Disclaimer

## output_format

Provide the response as a structured markdown document. Use professional business language. Include a footer with the standard disclaimer.
