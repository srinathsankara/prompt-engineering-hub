---
pattern_name: Few-Shot Tax Classification
pattern_type: few-shot
complexity_tier: basic
version: 1.0.0
---

## Pattern Overview

Use few-shot examples to classify tax transactions, entities, or documents into predefined categories. This pattern is effective when the classification taxonomy is well-defined but the input variations are numerous.

## When to Use

- Classifying expense categories for deduction eligibility
- Identifying applicable tax forms based on entity structure
- Categorizing client inquiries by service line
- Sorting audit findings by risk level

## Template Structure

### System Prompt

Define the classifier role, the taxonomy, and the output format.

```
You are a tax classification specialist. Classify each transaction into exactly one of the following categories:

Categories:
- {{category_1}}: {{description_1}}
- {{category_2}}: {{description_2}}
- {{category_3}}: {{description_3}}

Respond with only the category label and a one-sentence justification.
```

### Few-Shot Examples

Provide 3-5 representative examples covering edge cases.

```
Examples:

Transaction: "Payment for annual software subscription - SaaS platform"
Classification: Software & Technology
Justification: Cloud-based software subscription qualifying under Section 174.

Transaction: "Legal retainer for merger agreement review"
Classification: Professional Fees
Justification: Outside legal counsel for transaction advisory, not capitalized.

Transaction: "Office furniture - 10 desks and chairs"
Classification: Fixed Assets
Justification: Tangible property with useful life exceeding one year, subject to depreciation.

Transaction: "Employee holiday party catering"
Classification: Meals & Entertainment
Justification: 50% deductible under Section 274(n) as business-related entertainment.
```

### User Prompt

```
Transaction: {{transaction_description}}
Classification:
```

## Key Parameters

- Temperature: 0.0 (deterministic classification)
- Examples count: 3-5
- Label format: Consistent capitalization and structure

## Validation

- Test with ambiguous transactions near category boundaries
- Verify no false positives on out-of-scope inputs
- Ensure justification references correct tax authority
