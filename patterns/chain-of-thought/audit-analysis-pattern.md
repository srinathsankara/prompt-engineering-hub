---
pattern_name: Chain-of-Thought Audit Analysis
pattern_type: chain-of-thought
complexity_tier: medium
version: 1.1.0
---

## Pattern Overview

Guide the model through step-by-step audit analysis with explicit reasoning at each stage. This pattern mirrors how audit professionals approach engagements: gather evidence, form preliminary conclusions, test assumptions, and document final judgments.

## When to Use

- Analyzing financial statement anomalies
- Evaluating internal control deficiencies
- Assessing going concern indicators
- Determining materiality thresholds
- Investigating potential misstatements

## Template Structure

### System Prompt

```
You are an audit professional � Srinath Sankara. Follow GAAS and the firm's audit methodology. For each analysis, work through the following steps explicitly before reaching a conclusion.

Step 1 - Understand the Context: Identify the account, assertion, and relevant facts.
Step 2 - Identify Expectations: Based on industry, prior periods, and budget, what is the expected range?
Step 3 - Analyze Variance: Quantify the difference and assess magnitude relative to materiality.
Step 4 - Consider Explanations: List plausible explanations (both routine and unusual).
Step 5 - Gather Corroborating Evidence: What additional evidence would confirm or refute each explanation?
Step 6 - Form Conclusion: State the most likely explanation and recommended procedures.
```

### User Prompt

```
Context:
- Account: {{account_name}}
- Current period balance: {{current_balance}}
- Prior period balance: {{prior_balance}}
- Budget/forecast: {{budget_amount}}
- Materiality: {{materiality}}
- Industry trend: {{industry_trend}}
- Significant fluctuations: {{fluctuations}}

Perform a chain-of-thought analysis of this variance.
```

## Reasoning Trace Format

```
**Step 1 - Context**
[Account]: Accounts Receivable - Trade
[Assertion]: Existence and Valuation
[Facts]: Balance increased 40% YoY while revenue grew 12%

**Step 2 - Expectations**
[Expected]: AR growth ~10-15% consistent with revenue
[Actual]: 40% growth
[Variance]: $2.5M above expected range

**Step 3 - Variance Analysis**
[Difference]: $2.5M (25% of materiality threshold of $10M)
[Assessment]: Significant variance requiring investigation

**Step 4 - Plausible Explanations**
1. Change in payment terms extending collection periods
2. Concentration in slow-paying customers
3. Revenue recorded but not yet collected (bill-and-hold)
4. Potential misstatement -- fictitious revenue or cut-off error

**Step 5 - Corroborating Evidence Needed**
- AR aging report to identify concentration
- Sales terms for top 10 customers by revenue
- Subsequent cash receipts testing
- Revenue cut-off testing for period-end transactions

**Step 6 - Conclusion**
Most likely: Shift in customer mix toward enterprise clients with net-60 terms. Recommend: confirm through aging analysis and subsequent receipt testing.
```

## Key Parameters

- Temperature: 0.2 (balance of consistency and analytical creativity)
- Step-by-step enforced via prompt structure
- Materiality-driven variance thresholds

## Validation

- Verify step ordering is followed consistently
- Test with known misstatements to confirm detection
- Ensure conclusion is proportional to evidence presented
