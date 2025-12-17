---
title: Deal Advisory -- Buy-Side Sell-Side Diligence & Sourcing
service_line: advisory
subcategory: deal-advisory
use_case_type: analysis
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["deal-advisory", "mergers-acquisitions", "due-diligence", "buy-side", "sell-side", "valuation", "claude"]
test_suites: []
---

## system_prompt

I'm a . You understand deal mechanics from LOI through closing and know the common pitfalls in middle-market transactions.

## context

- Engagement Type: {{engagement_type}} (buy-side / sell-side / fairness opinion / valuation)
- Client: {{client_name}}
- Target/Buyer: {{counterparty_name}}
- Industry: {{industry}}
- Transaction Size: {{transaction_size}}
- Client Role: {{client_role}} (financial sponsor / strategic buyer / seller / management)
- Stage: {{deal_stage}} (sourcing / LOI / diligence / negotiation / closing / integration)

## user_prompt

Provide deal advisory support for the {{engagement_type}} engagement involving {{client_name}} and {{counterparty_name}}.

### 1. Deal Profile & Rationale

| Parameter | Detail |
|-----------|--------|
| Strategic Rationale | {{strategic_rationale}} |
| Key Value Drivers | {{value_drivers}} |
| Synergies Identified | {{synergies}} |
| Key Risks | {{key_risks}} |
| Expected Timeline to Close | {{timeline_months}} months |

### 2. Financial Diligence Checklist

| Area | Findings | Risk Level | Remediation |
|------|----------|:---------:|-------------|
| Revenue quality (recurrence, concentration) | {{revenue_findings}} | {{revenue_risk}} | {{revenue_remediation}} |
| Gross margin trends and sustainability | {{margin_findings}} | {{margin_risk}} | {{margin_remediation}} |
| EBITDA adjustments (normalizations, add-backs) | {{ebitda_findings}} | {{ebitda_risk}} | {{ebitda_remediation}} |
| Working capital requirements | {{wc_findings}} | {{wc_risk}} | {{wc_remediation}} |
| Net debt / debt-like items | {{debt_findings}} | {{debt_risk}} | {{debt_remediation}} |
| Tax exposures (NOL, open audits, transfer pricing) | {{tax_findings}} | {{tax_risk}} | {{tax_remediation}} |

### 3. Valuation Summary

| Methodology | Implied EV | Multiple | Selected? |
|-------------|:----------:|:--------:|:---------:|
| DCF (Base Case) | {{dcf_ev}} | -- | {{dcf_selected}} |
| Guideline Public Company | {{guideline_ev}} | {{guideline_multiple}}x {{guideline_metric}} | {{guideline_selected}} |
| Precedent Transactions | {{precedent_ev}} | {{precedent_multiple}}x {{precedent_metric}} | {{precedent_selected}} |
| LBO Analysis | {{lbo_ev}} | {{lbo_irr}}% IRR | {{lbo_selected}} |

| Valuation Metric | Proposed | Market Range | Position |
|:----------------:|:--------:|:-----------:|:--------:|
| Enterprise Value | {{proposed_ev}} | {{market_range_ev}} | {{position_ev}} |
| EV/EBITDA | {{proposed_multiple}}x | {{market_range_multiple}}x | {{position_multiple}} |

## output_format

Present as a deal advisory memorandum: 1. Deal Profile, 2. Financial Diligence Findings, 3. Valuation Summary, 4. Key Deal Points & Negotiation Positions, 5. Integration Considerations.

## constraints

- EBITDA add-backs must be supportable and sustainable -- aggressive add-backs are challenged in diligence
- Working capital peg: understand historical seasonality, set peg based on normalized trailing 12-month average
- Transaction tax structuring should be addressed pre-LOI, not during closing
- Quality of Earnings (QoE) report should address all material EBITDA adjustments
- Post-close working capital true-up mechanics must be clearly defined in the purchase agreement
