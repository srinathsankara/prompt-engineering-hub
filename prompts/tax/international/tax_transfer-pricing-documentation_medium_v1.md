---
title: Transfer Pricing Documentation & Benchmarking Study
service_line: tax
subcategory: international
use_case_type: drafting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: tax-sme
reviewer: tax-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["transfer-pricing", "international-tax", "irc-482", "oecd", "benchmarking", "arm's-length", "claude"]
test_suites: ["testing/test-cases/tax/transfer-pricing-medium.json"]
---

## system_prompt

I've prepared transfer pricing documentation for multinational enterprises across technology, manufacturing, pharma, professional services, and consumer goods. The most expensive mistake a company can make: treating TP documentation as a compliance exercise rather than a defense against tax authority challenges. Contemporaneous documentation is not optional.

My methodology:
1. **Functional analysis** -- what each entity does, what assets it uses, what risks it bears
2. **Comparability analysis** -- find comparable uncontrolled transactions
3. **Method selection** -- pick the right TP method for each transaction type
4. **Benchmarking** -- database searches, screening, comparable identification
5. **Documentation** -- prepare master file, local file, and CbC report compliant with BEPS Actions 8-10 and 13

## context

**Taxpayer:**
- Name: {{taxpayer_name}}
- Jurisdiction: {{taxpayer_jurisdiction}}
- Tax ID: {{tax_id}}
- Fiscal Year: {{fiscal_year}}

**Controlled Transaction:**
- Transaction Type: {{transaction_type}} (intercompany services / tangible goods / intangible property / loans / cost sharing / management fees)
- Related Entity: {{related_entity_name}} (jurisdiction: {{related_jurisdiction}})
- Relationship: {{relationship}} (parent/subsidiary / brother-sister / branch / partnership)
- Transaction Value: {{transaction_value}} (current year)
- Prior Year Values: {{prior_year_1_value}} (Year -1), {{prior_year_2_value}} (Year -2)

**Functional Profile:**
- Taxpayer Functions: {{taxpayer_functions}}
- Taxpayer Assets: {{taxpayer_assets}}
- Taxpayer Risks: {{taxpayer_risks}}
- Related Entity Functions: {{related_entity_functions}}
- Related Entity Assets: {{related_entity_assets}}
- Related Entity Risks: {{related_entity_risks}}

## user_prompt

Prepare/template transfer pricing documentation for {{transaction_type}} between {{taxpayer_name}} and {{related_entity_name}}.

### Step 1: Functional Analysis (Functions, Assets, Risks)

Map the functional contributions of each party:

| Functional Category | Taxpayer | Related Entity | Analysis |
|--------------------|----------|---------------|----------|
| **Strategic/Management** | {{func_strategic_tp}} | {{func_strategic_re}} | {{func_strategic_analysis}} |
| **R&D/Product Development** | {{func_rd_tp}} | {{func_rd_re}} | {{func_rd_analysis}} |
| **Manufacturing/Production** | {{func_manufacturing_tp}} | {{func_manufacturing_re}} | {{func_manufacturing_analysis}} |
| **Marketing/Distribution** | {{func_marketing_tp}} | {{func_marketing_re}} | {{func_marketing_analysis}} |
| **Sales/Customer Support** | {{func_sales_tp}} | {{func_sales_re}} | {{func_sales_analysis}} |
| **Admin/Back Office** | {{func_admin_tp}} | {{func_admin_re}} | {{func_admin_analysis}} |

**Asset Utilization:**
| Asset Type | Taxpayer | Related Entity |
|------------|----------|---------------|
| Physical assets (PP&E) | {{asset_ppe_tp}} | {{asset_ppe_re}} |
| Intangible assets (IP, patents, trademarks) | {{asset_ip_tp}} | {{asset_ip_re}} |
| Working capital | {{asset_wc_tp}} | {{asset_wc_re}} |

**Risk Assumption:**
| Risk Type | Taxpayer | Related Entity | Which Entity Bears? |
|-----------|----------|---------------|-------------------|
| Market/competition risk | {{risk_market_tp}} | {{risk_market_re}} | {{risk_market_bearer}} |
| R&D/technological risk | {{risk_rd_tp}} | {{risk_rd_re}} | {{risk_rd_bearer}} |
| Credit/collection risk | {{risk_credit_tp}} | {{risk_credit_re}} | {{risk_credit_bearer}} |
| Product liability risk | {{risk_liability_tp}} | {{risk_liability_re}} | {{risk_liability_bearer}} |
| Foreign exchange risk | {{risk_fx_tp}} | {{risk_fx_re}} | {{risk_fx_bearer}} |
| Inventory risk | {{risk_inventory_tp}} | {{risk_inventory_re}} | {{risk_inventory_bearer}} |

### Step 2: Economic Analysis -- Method Selection

**Available Methods:**
| Method | Best For | Selected? | Rationale |
|--------|----------|-----------|-----------|
| **CUP** (Comparable Uncontrolled Price) | Tangible goods, loans, commodities | {{selected_cup}} | {{rationale_cup}} |
| **Resale Price Method** | Distribution, resale activities | {{selected_rpm}} | {{rationale_rpm}} |
| **Cost Plus Method** | Manufacturing, contract services | {{selected_costplus}} | {{rationale_costplus}} |
| **TNMM** (Transactional Net Margin Method) | Most common -- tested party profitability | {{selected_tnmm}} | {{rationale_tnmm}} |
| **Profit Split Method** | Highly integrated, unique intangibles | {{selected_profitsplit}} | {{rationale_profitsplit}} |

### Step 3: Benchmarking Study -- Database Search Strategy

**Search Protocol:**

| Search Step | Criteria | Results |
|-------------|----------|---------|
| 1. Industry (SIC/NAICS) | {{sic_codes}} | {{sic_results}} |
| 2. Geographic market | {{geography}} | {{geo_results}} |
| 3. Financial screen -- revenue | {{revenue_min}} to {{revenue_max}} | {{revenue_results}} |
| 4. Independence screen | {{independence_criteria}} | {{independent_results}} |
| 5. Financial health screen (no bankruptcy) | {{financial_health}} | {{health_results}} |
| 6. Profitability screen (no consistent losses) | {{profitability_criteria}} | {{profitability_results}} |
| 7. Qualitative screen (business description) | {{qualitative_criteria}} | {{final_comparables}} |

**Comparable Companies Summary:**
| Company Name | SIC | Revenue | Operating Margin | RNPE (Berry Ratio) | Selected? |
|-------------|-----|---------|-----------------|-------------------|-----------|
| {{comparable_1}} | {{sic_1}} | {{rev_1}} | {{om_1}}% | {{rnpe_1}}% | {{selected_1}} |
| {{comparable_2}} | {{sic_2}} | {{rev_2}} | {{om_2}}% | {{rnpe_2}}% | {{selected_2}} |

**Interquartile Range:**
| Statistic | Operating Margin | TNMM PLI | 
|-----------|-----------------|----------|
| Lower Quartile | {{q1_om}}% | {{q1_tnmm}}% |
| Median | {{median_om}}% | {{median_tnmm}}% |
| Upper Quartile | {{q3_om}}% | {{q3_tnmm}}% |

**Arm's Length Range:** {{q1_tnmm}}% to {{q3_tnmm}}%
**Taxpayer Result:** {{taxpayer_result}}%
**Falls Within Arm's Length Range:** {{in_range}} (Yes / No / Partial)

### Step 4: Documentation Structure

**Master File (per BEPS Action 13):**
- [ ] Organizational structure (chart with all entities)
- [ ] Description of business (industries served, value chain, geographic markets)
- [ ] Intangible property (R&D strategy, IP ownership, royalty flows)
- [ ] Intercompany financial activities (financing, treasury, guarantees)
- [ ] Financial and tax positions (CbC data, APAs, advance rulings)

**Local File:**
- [ ] Management/ownership structure
- [ ] Detailed description of business and strategy
- [ ] Related party transactions (nature, amount, terms)
- [ ] Comparability analysis (functional analysis + benchmarking)
- [ ] Method selection and application
- [ ] Arm's length conclusion

**Country-by-Country Reporting (Form 8975 / OECD template):**
- [ ] Constituent entities listing
- [ ] Revenue by entity (related party vs unrelated party)
- [ ] Profit/loss before income tax
- [ ] Income tax paid and accrued
- [ ] Stated capital
- [ ] Accumulated earnings
- [ ] Number of employees

### Step 5: Compliance & Filing

| Filing Requirement | Jurisdiction | Due Date | Extension Available | Status |
|-------------------|--------------|----------|-------------------|--------|
| Master file | {{master_jurisdictions}} | {{master_due}} | {{master_extended}} | {{master_status}} |
| Local file | {{local_jurisdictions}} | {{local_due}} | {{local_extended}} | {{local_status}} |
| CbC Report (Form 8975) | US / parent jurisdiction | {{cbc_due}} | {{cbc_extended}} | {{cbc_status}} |
| Country-by-Country notification | {{cbc_notification_jurisdictions}} | {{cbc_notification_due}} | -- | {{cbc_notification_status}} |
| Transfer pricing disclosure on return | {{disclosure_jurisdictions}} | {{disclosure_due}} | -- | {{disclosure_status}} |

### Penalty Protection

Documentation must meet contemporaneous standards:
- [ ] Documentation prepared before tax return filing date
- [ ] Documentation demonstrates reasonable effort to comply with arm's length standard
- [ ] Economic analysis uses appropriate method and reliable data
- [ ] Functional analysis accurately describes operations
- [ ] Benchmarks are replicable by tax authority (database, screens, search strategy documented)

## output_format

Present as a complete transfer pricing documentation package:
1. **Functional Analysis** -- FAR matrices by entity
2. **Economic Analysis** -- method selection, benchmarking protocol, comparables, interquartile range
3. **Arm's Length Conclusion** -- test results with range and taxpayer position
4. **Documentation Checklist** -- master file, local file, CbC reporting
5. **Compliance Timeline** -- jurisdictional due dates with extension strategy
6. **Penalty Protection** -- contemporaneous documentation confirmation

## constraints

- Contemporaneous documentation must be prepared PRIOR to filing the tax return -- retroactive documentation may not provide penalty protection
- TNMM is the most common method for services, distribution, and manufacturing -- but CUP is required when a comparable uncontrolled price exists
- Database benchmarks must be replicable -- document the exact search string, screens, and database version
- Audit defense strategy differs by jurisdiction -- US applies a "reasonable cause" standard; other jurisdictions may impose strict liability
- Intercompany loans require additional analysis of arm's length interest rates (credit rating, guarantee, term, currency)
- Cost-sharing arrangements (CSA) under Reg. 1.482-7 have additional documentation requirements beyond the standard TP study
- BEPS 2.0 Pillar One and Pillar Two (GloBE rules) may impose additional documentation burdens for large MNEs (>€750M revenue)
- Transfer pricing adjustments may trigger secondary adjustments (deemed dividends, interest, withholding tax) in some jurisdictions
