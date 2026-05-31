---
pattern_name: Structured JSON Data Extraction
pattern_type: structured-output
complexity_tier: medium
version: 1.0.0
---

## Pattern Overview

Extract structured data from unstructured financial documents (tax returns, financial statements, contracts) into a defined JSON schema for downstream processing and analysis.

## When to Use

- Extracting line items from tax returns for comparison
- Parsing financial statement footnotes into structured disclosures
- Extracting contract terms for compliance analysis
- Converting client-submitted documents into standardized data

## Template Structure

### System Prompt

```
You are a data extraction specialist for professional services. Extract the requested fields from the provided document. Output valid JSON only. Do not include any text outside the JSON response.

Rules:
1. Extract values exactly as presented in the source document
2. Use null for missing fields -- do not infer or estimate
3. Use the exact field names specified in the schema
4. For monetary amounts, extract as numbers without symbols or commas
5. For dates, use ISO format YYYY-MM-DD
6. Flag uncertain extractions with confidence: "low" in the extraction metadata
```

### Schema Definition

Define the output schema inline in the user prompt.

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "entity_name": { "type": "string" },
    "tax_year": { "type": "integer" },
    "return_type": { "type": "string", "enum": ["1120", "1120-S", "1065", "1040"] },
    "financials": {
      "type": "object",
      "properties": {
        "total_revenue": { "type": ["number", "null"] },
        "cost_of_goods_sold": { "type": ["number", "null"] },
        "gross_profit": { "type": ["number", "null"] },
        "net_income": { "type": ["number", "null"] },
        "total_assets": { "type": ["number", "null"] },
        "total_liabilities": { "type": ["number", "null"] }
      }
    },
    "extraction_metadata": {
      "type": "object",
      "properties": {
        "source_document": { "type": "string" },
        "extraction_date": { "type": "string", "format": "date" },
        "confidence": { "type": "string", "enum": ["high", "medium", "low"] },
        "uncertain_fields": { "type": "array", "items": { "type": "string" } }
      }
    }
  },
  "required": ["entity_name", "tax_year", "return_type", "extraction_metadata"]
}
```

### User Prompt

```
Document: {{source_document_text}}

Extract the following fields from the document above according to the provided schema:

1. Entity name and tax year
2. Return type
3. All financial line items
4. Extraction metadata

Respond with valid JSON only.
```

## Key Parameters

- Temperature: 0.0 (deterministic extraction)
- Response format enforcement: "Respond with valid JSON only"
- Schema-driven: explicitly define all fields and types

## Validation

- Verify JSON schema compliance programmatically
- Test with documents containing missing fields (should return null, not guess)
- Test with ambiguous values (should flag low confidence)
- Verify monetary amounts are extracted as raw numbers without formatting
