---
title: ASC 606 Revenue Recognition Analysis
service_line: assurance
subcategory: technical-accounting
use_case_type: analysis
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: assurance-sme
reviewer: assurance-sme
created_date: 2026-05-12
last_modified: 2026-06-13
tags: ["asc-606", "revenue-recognition", "gaap", "technical-accounting", "five-step-model", "claude"]
test_suites: ["testing/test-cases/assurance/asc-606-analysis.json"]
---

## system_prompt

I'm a . You apply the five-step model to complex revenue arrangements across software, healthcare, manufacturing, construction, and professional services industries.

Your framework is the ASC 606 five-step model:
1. Identify the contract(s) with a customer
2. Identify the performance obligations in the contract
3. Determine the transaction price
4. Allocate the transaction price to performance obligations
5. Recognize revenue when (or as) the entity satisfies a performance obligation

## context

**Company Profile:**
- Name: {{company_name}}
- Industry: {{industry}}
- Revenue Model: {{revenue_model}} (subscription / transactional / contract-based / hybrid)
- Public/Private: {{reporting_status}}
- Implementation Date: {{implementation_date}} (public: 2018, private: 2019)
- Current Revenue Recognition Method: {{current_method}}

**Contract/Arrangement Details:**
- Contract Type: {{contract_type}}
- Contract Term: {{contract_term}}
- Total Contract Value: {{contract_value}}
- Payment Terms: {{payment_terms}}
- Products/Services: {{products_services}} (multiple elements? Yes/No)
- Variable Consideration: {{variable_consideration}} (bonuses, penalties, refunds, contingencies)
- Licenses/Maintenance: {{licenses_ip}} (functional IP / symbolic IP)

## user_prompt

Analyze the revenue arrangement using the ASC 606 five-step model.

### Step 1: Identify the Contract

**Contract criteria (ASC 606-10-25-1):**
- [ ] Approved by both parties (written, oral, or implied)
- [ ] Rights and obligations identified
- [ ] Payment terms identified
- [ ] Commercial substance
- [ ] Probable collection of consideration

**Contract combination analysis:**
- Combine with other contracts if (ASC 606-10-25-9): {{contract_combination}}
- Contract modification: {{contract_modification}} (Type: separate / prospective / catch-up)

### Step 2: Identify Performance Obligations

| Product/Service | Distinct? (Capable of being distinct + Distinct in context) | Bundled? | Performance Obligation? |
|----------------|-----------------------------------------------------------|----------|------------------------|
| {{item_1}} | {{distinct_1}} -- {{analysis_1}} | {{bundled_1}} | {{po_1}} |
| {{item_2}} | {{distinct_2}} -- {{analysis_2}} | {{bundled_2}} | {{po_2}} |
| {{item_3}} | {{distinct_3}} -- {{analysis_3}} | {{bundled_3}} | {{po_3}} |

**Examples of distinct vs non-distinct:**
- Software license + installation services: Distinct if installation is available from other vendors
- SaaS platform + training: Training may be non-distinct if vendor-specific knowledge is required
- Equipment + ongoing maintenance: Distinct -- each sold separately in the market
- Design + production of custom molds: Not distinct -- design and production are highly interdependent

### Step 3: Determine the Transaction Price

| Component | Amount | Treatment |
|-----------|--------|-----------|
| Fixed consideration | {{fixed_amount}} | Include in transaction price |
| Variable consideration | {{variable_amount}} | Estimate using {{estimation_method}} (expected value / most likely amount) |
| Constraint on variable consideration | {{constraint_amount}} | Include only to extent probable no reversal (ASC 606-10-32-11/12) |
| Significant financing component | {{financing_component}} | Adjust if > 12 months |
| Non-cash consideration | {{non_cash_amount}} | Measure at fair value |
| Consideration payable to customer | {{payable_amount}} | Reduce transaction price unless in exchange for distinct good/service |
| **Total Transaction Price** | {{total_price}} | |

### Step 4: Allocate Transaction Price

Allocate based on standalone selling prices (SSP) -- maximize observable inputs:

| Performance Obligation | SSP Method | SSP | Allocation % | Allocated Amount |
|----------------------|------------|-----|-------------|-----------------|
| {{po_1}} | {{ssp_method_1}} (adjusted market / expected cost + margin / residual) | {{ssp_1}} | {{pct_1}}% | {{allocated_1}} |
| {{po_2}} | {{ssp_method_2}} | {{ssp_2}} | {{pct_2}}% | {{allocated_2}} |
| {{po_3}} | {{ssp_method_3}} | {{ssp_3}} | {{pct_3}}% | {{allocated_3}} |

**Discount allocation:** If a discount exists, allocate entirely to specific performance obligation(s) if observable allocation criteria met (ASC 606-10-32-38 through 41).

### Step 5: Recognize Revenue

Determine timing -- over time or at a point in time:

**Over time (ASC 606-10-25-27):**
- [ ] Customer simultaneously receives and consumes benefits
- [ ] Entity's performance creates/enhances asset controlled by customer
- [ ] Entity's performance does not create alternative use asset AND entity has right to payment for performance to date

**If over time, select method:**
| Method | Description | Calculation | When to Use |
|--------|-------------|-------------|-------------|
| Output method | Based on milestones achieved | {{output_calc}} | For contracts with clear milestones |
| Input method | Based on costs incurred vs total expected | {{input_calc}} = (costs incurred / total expected costs) × total revenue | For contracts where inputs best depict progress |

**If point in time, identify when control transfers:**
- [ ] Entity has present right to payment
- [ ] Customer has legal title
- [ ] Customer has physical possession
- [ ] Customer has significant risks and rewards of ownership
- [ ] Customer has accepted the asset

### Summary Journal Entries

| Entry | Debit | Credit | Timing |
|-------|-------|--------|--------|
| Upon billing | Contract Asset / Trade Receivable | Contract Liability (if deferred/not earned) | On billing |
| Revenue recognition | Contract Liability (if deferred) | Revenue | On satisfaction of PO |
| Cash received | Cash | Trade Receivable | On payment |

### Disclosure Requirements

- [ ] Disaggregation of revenue (by category meaningful to the entity)
- [ ] Contract balances (contract assets, contract liabilities, receivables)
- [ ] Performance obligations (nature, timing, transaction price allocated to remaining POs)
- [ ] Significant judgments and changes in judgments
- [ ] Assets recognized from costs to obtain/fulfill a contract

## output_format

Present as a technical accounting memo:
1. **Executive Summary** -- arrangement description, total revenue, timing of recognition
2. **Step-by-Step Analysis** -- each of the five steps with supporting rationale
3. **Key Judgments** -- areas requiring management judgment and the range of acceptable alternatives
4. **Journal Entries** -- transition and ongoing recognition entries
5. **Disclosure Draft** -- draft footnote language
6. **Memorandum** -- complete position paper documenting the analysis

## examples

**Example: SaaS Subscription + Implementation**
- Company sells annual SaaS subscription ($120k/year) with one-time implementation ($30k)
- Step 1: Contract exists -- signed, approved, payment terms net 30
- Step 2: Subscription and implementation are distinct POs (implementation available from other vendors)
- Step 3: Transaction price = $150k (no variable consideration, no financing component)
- Step 4: SSPs -- subscription $120k/year (observable), implementation $35k (estimated cost + margin)
  - Allocation: Subscription $126k × ($120k/$155k) = $120k, Implementation $150k - $120k = $30k
- Step 5a: Implementation recognized over time (input method, based on hours incurred)
- Step 5b: Subscription recognized over time (straight-line over 12 months)

## constraints

- Principal vs agent determination must be assessed separately from the five-step model
- Contract acquisition costs (ASC 340-40) must be capitalized and amortized if expected recovery > 1 year
- Server hardware companies may need to evaluate ASC 842 (leases) for customer-premises equipment
- Crypto/blockchain revenue arrangements have special considerations under AICPA practice aids
- ASC 606 does not apply to lease contracts (ASC 842), insurance contracts (ASC 944), or financial instruments (ASC 320/321)
