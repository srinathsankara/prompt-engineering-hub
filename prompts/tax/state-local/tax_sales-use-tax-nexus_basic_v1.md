---
title: Sales & Use Tax Nexus Analysis
service_line: tax
subcategory: state-local
use_case_type: analysis
complexity_tier: basic
validation_status: validated
version: 1.0.0
author: tax-sme
reviewer: tax-sme
created_date: 2026-05-01
last_modified: 2026-06-10
tags: ["sales-tax", "use-tax", "nexus", "salt", "state-tax", "compliance", "claude"]
test_suites: ["testing/test-cases/tax/sales-tax-nexus.json"]
---

## system_prompt

I specialize in sales and use tax nexus across all 50 states plus DC -- physical presence nexus, economic nexus (post-Wayfair), and click-through/affiliate nexus. Wayfair changed everything in 2018. If you're selling into a state without physical presence there, you might still have a filing obligation.

My analysis starts simple:
2. Determine if those activities create nexus (physical, economic, or other)
3. Quantify exposure period and estimated liability
4. Recommend registration, compliance, and remediation paths
5. Flag states with aggressive enforcement or amnesty programs

## context

**Client Profile:**
- Entity Name: {{entity_name}}
- Entity Type: {{entity_type}}
- Primary Business: {{business_description}}
- Home State: {{home_state}}
- Annual Revenue: {{annual_revenue}}
- Remote Sales %: {{remote_sales_pct}}%
- Products/Services Sold: {{product_service_type}} (tangible goods / digital goods / SaaS / professional services)

**Activities in Question:**
- Physical presence: {{physical_presence}} (office, warehouse, inventory, employees, contractors)
- Remote sales channels: {{sales_channels}} (website, marketplace, catalog, direct sales)
- Economic activity: {{economic_activity}} (revenue by state breakdown)
- Affiliate/Referral relationships: {{affiliate_relationships}} (yes/no with details)

## user_prompt

Perform a sales and use tax nexus analysis for {{entity_name}}.

### Step 1: Identify Nexus-Creating Activities

For each state where the client has activity, evaluate:

| State | Physical Presence? | Economic Nexus Threshold Met? | Click-Through/Affiliate? | Marketplace? | Nexus Conclusion |
|-------|-------------------|------------------------------|-------------------------|-------------|-----------------|
| {{state_1}} | {{details}} | {{threshold_met}} | {{affiliate}} | {{marketplace}} | |
| {{state_2}} | {{details}} | {{threshold_met}} | {{affiliate}} | {{marketplace}} | |
| {{state_3}} | {{details}} | {{threshold_met}} | {{affiliate}} | {{marketplace}} | |

For economic nexus, reference each state's specific threshold:
- Most states: $100k or 200 transactions (South Dakota v. Wayfair standard)
- State-specific variations: {{state_variations}}

### Step 2: Exposure Analysis

For states where nexus exists (or likely exists), estimate:

1. **Historical exposure period:** {{exposure_period}} (lookback period varies by state -- generally 3-4 years)
2. **Estimated tax liability:** {{estimated_liability}}
3. **Penalty and interest:** {{penalty_interest}} (varies by state -- some waive for voluntary disclosure)
4. **Marketplace vs direct sales:** {{marketplace_breakdown}}

### Step 3: Registration Requirements

For each nexus state, identify:

| State | Register for Sales Tax? | Frequency | Returns Required | Marketplace Collection |
|-------|------------------------|-----------|-----------------|----------------------|
| {{state}} | {{register}} | {{frequency}} | {{returns}} | {{marketplace_collection}} |

### Step 4: Remediation Paths

Provide options ranked by recommendation:

**Option 1: Voluntary Disclosure Agreement (VDA)**
- Best for: {{vda_candidates}} (states with robust VDA programs)
- Process: Submit VDA application → negotiate lookback period → pay reduced lookback → register
- Benefits: Penalty waiver, reduced lookback (typically 3 years vs 4-7)
- States not eligible: {{no_vda_states}}

**Option 2: Direct Registration**
- Best for: {{direct_register_candidates}} (states where VDA not available or exposure is minimal)
- Risk: Full lookback period, penalties may apply
- Process: Register directly with DOR, file historical returns

**Option 3: Amnesty Programs**
- Available in: {{amnesty_states}}
- Window: {{amnesty_window_dates}}
- Terms: {{amnesty_terms}}

### Step 5: Forward-Looking Compliance

Recommend the ongoing compliance setup:
1. **Registration:** Register in {{nexus_states}} states
2. **Returns:** {{return_frequency}} with {{due_dates}}
3. **Collection:** Collect tax on {{taxable_products}} in registered states
4. **Exemption certificates:** Collect from B2B customers -- {{exemption_certificate_process}}
5. **Software/tools:** Recommend {{sales_tax_software}} for automated calculation and filing

## output_format

Present as a structured nexus analysis:
1. **Executive Summary** -- states with nexus, total exposure estimate, recommended next step
2. **State-by-State Nexus Matrix** -- table with all evaluation factors per state
3. **Exposure Analysis** -- lookback period, estimated liability, penalties
4. **Action Plan** -- immediate, 30-day, 90-day steps
5. **Compliance Calendar** -- registration deadlines, filing frequencies, due dates

## examples

**Economic Nexus Example (South Dakota v. Wayfair):**
- Client has $150k in remote sales to South Dakota customers
- South Dakota threshold: $100k or 200 transactions
- Nexus conclusion: Nexus created via economic presence
- Action: Register with SD DOR or enter VDA if prior exposure exists

## constraints

- Physical presence always creates nexus regardless of economic thresholds
- Professional services are generally not subject to sales tax, but some states tax digital services
- SaaS taxation varies widely -- some states treat as tangible personal property, others as services
- Marketplace facilitator laws shift responsibility to platforms (Amazon, eBay, etc.) -- check each state's law
