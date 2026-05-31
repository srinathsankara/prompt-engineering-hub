---
pattern_name: RAG-Enhanced Risk Data Retrieval
pattern_type: rag
complexity_tier: advanced
version: 1.0.0
---

## Pattern Overview

Augment prompt context with retrieved external data sources -- regulatory databases, industry benchmarks, peer disclosures -- to ground AI outputs in verifiable, current information.

## When to Use

- Risk assessments requiring industry-specific regulatory context
- Due diligence requiring real-time entity data
- Benchmarking requiring peer comparison data
- Compliance checks referencing current regulatory guidance

## Retrieval Sources

| Source Type | Examples | Update Frequency |
|---|---|---|
| Regulatory databases | IRC, SEC EDGAR, PCAOB, state tax codes | Daily/weekly |
| Industry benchmarks | Risk management association data, peer filings | Quarterly |
| Internal knowledge base | Prior engagement docs, firm methodologies | On-demand |
| News and events | Regulatory changes, enforcement actions | Real-time |

## Template Structure

### System Prompt

```
You are an AI advisor with access to a knowledge base of risk data. For each request:
1. Identify the relevant information needed
2. Retrieve the most current and applicable data
3. Cite your sources with dates and document references
4. Note any data gaps or assumptions made
5. Provide analysis grounded in the retrieved information
```

### Retrieval Instructions

Embed retrieval instructions at the point where external data is needed.

```
## Context from Knowledge Base

Retrieve and incorporate the following:
- [TOPIC: {{topic}}] from [SOURCE: {{source}}]
- Focus on: {{retrieval_focus}}
- Timeframe: {{timeframe}}
- Jurisdiction: {{jurisdiction}}

## Retrieved Data

{retrieved_context}
```

### Grounding Requirement

```
For each factual claim, provide:
- Source document or database
- Date of retrieval
- Confidence level (high/medium/low)
- Any caveats or limitations

If retrieved data is insufficient, state: "The available knowledge base does not contain sufficient information to support a definitive conclusion on [topic]. Additional research is recommended."
```

## Key Parameters

- Temperature: 0.1 (prioritize factual accuracy)
- Chunk size: 500-1000 tokens per retrieval
- Top-K: 3-5 relevant chunks
- Citation format: [Source, Date, Section]

## Validation

- Verify all cited sources exist and are accurately referenced
- Test with intentionally outdated data to confirm freshness checks
- Validate that data gaps are flagged rather than hallucinated
- Confirm jurisdiction-specific results are correct
