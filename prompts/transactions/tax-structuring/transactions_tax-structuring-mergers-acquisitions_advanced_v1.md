---
title: Transaction Tax Structuring -- Mergers & Acquisitions
service_line: transactions
subcategory: tax-structuring
use_case_type: analysis
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: transactions-sme
reviewer: tax-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["tax-structuring", "mergers-acquisitions", "irc-368", "irc-338", "stock-acquisition", "asset-acquisition", "section-351", "due-diligence", "claude"]
test_suites: []
---

## system_prompt

I'm a . You have deep expertise in Subchapter C (corporate tax), partnership taxation (Subchapter K), S corporations, REITs, and cross-border M&A. You are skilled at modeling tax structures, identifying tax attributes, and evaluating the tax implications of deal structures.

Your transaction tax competency covers:
- Stock vs. asset acquisition trade-offs (IRC 1060, 338(g), 338(h)(10), 336(e))
- Tax-free reorganizations (IRC 368): Type A, B, C, D, F mergers
- IRC 351 tax-free incorporation / contribution
- §1202 qualified small business stock (QSBS)
- NOL utilization limits (IRC 382), built-in gains (IRC 384)
- Partnership tax implications of M&A (book-up, hot assets, liabilities)
- S corporation built-in gains tax (IRC 1374)
- Cross-border: FIRPTA, treaty planning, BEAT, GILTI, FDII implications
- State tax considerations (nexus, apportionment, state NOLs, combined reporting)

## context

**Transaction Overview:**
- Target: {{target_name}} (jurisdiction: {{target_jurisdiction}})
- Buyer: {{buyer_name}} (jurisdiction: {{buyer_jurisdiction}})
- Seller(s): {{seller_name}} (type: {{seller_type}} -- C corp / S corp / partnership / individual / tax-exempt)
- Transaction Value: {{transaction_value}}
- Consideration: {{consideration_type}} (cash / stock / earnout / mix: {{cash_pct}}% cash, {{stock_pct}}% stock)
- Target Legal Form: {{target_legal_form}} (C corp / S corp / LLC / partnership / REIT)
- Industry: {{industry}}

**Target Tax Attributes:**
- NOL Balance: {{nol_balance}} (federal: {{nol_federal}}, state: {{nol_state}})
- NOL Year Origination: {{nol_vintage}}
- §382 Ownership Change History: {{section_382_history}}
- Tax Credit Carryforwards: {{credit_carryforwards}} (type: {{credit_type}}, amount: {{credit_amount}})
- Built-in Gain/Loss (net unrealized): {{built_in_gain_loss}}
- E&P (current/accumulated): {{earnings_and_profits}}
- Asset Tax Basis (vs. Book Basis): {{tax_basis}} / {{book_basis}}
- Section 197 intangibles / goodwill amortization: {{section_197}}

## user_prompt

Evaluate the tax structure alternatives and prepare structuring recommendations for the acquisition of {{target_name}} by {{buyer_name}}.

### Part 1: Structure Alternatives Analysis

**Option A: Stock Acquisition**
| Consideration | Buyer Tax Impact | Seller Tax Impact |
|--------------|-----------------|-------------------|
| Tax basis in Target stock | {{stock_basis_treatment}} | |
| Asset step-up? | {{stock_step_up}} | |
| NOL / tax attributes preserved? | {{stock_nol_preservation}} | |
| State tax registration / filings | {{stock_state}} | |
| Seller gain recognition | | {{stock_seller_gain}} |
| Seller character (capital vs ordinary) | | {{stock_seller_character}} |
| QSBS eligibility (§1202) | | {{stock_qsbs}} |
| Installment sale eligibility | | {{stock_installment}} |
| FIRPTA applicability | | {{stock_firpta}} |

**Option B: Asset Acquisition**
| Consideration | Buyer Tax Impact | Seller Tax Impact |
|--------------|-----------------|-------------------|
| Tax basis in acquired assets | {{asset_basis_treatment}} | |
| Asset step-up allocation (§1060) | {{asset_step_up}} | |
| Class I-IV asset allocation | {{asset_class_allocation}} | |
| Goodwill / going concern value amortization | {{asset_goodwill}} | |
| NOL transferability | {{asset_nol}} | |
| State tax registration / filings | {{asset_state}} | |
| Seller gain recognition | | {{asset_seller_gain}} |
| Double taxation (C corp seller) | | {{asset_double_tax}} |
| State tax filing (bulk sale) | | {{asset_bulk_sale}} |

**Option C: §338(h)(10) Election (Qualified Stock Purchase -- QSP)**
| Consideration | Buyer Tax Impact | Seller Tax Impact |
|--------------|-----------------|-------------------|
| Asset step-up achieved? | {{three38_step_up}} | |
| Seller type required | {{three38_seller_req}} | (S corp only for h10) |
| Tax treatment to seller | {{three38_seller_tax}} | |
| Additional costs / complexity | {{three38_complexity}} | |
| State conformity | {{three38_state}} | |

**Option D: Tax-Free Reorganization**
| Structure Type | IRC Section | Requirements | Feasibility Assessment |
|---------------|-------------|-------------|----------------------|
| Forward triangular merger | 368(a)(1)(A) | {{fwd_tri_requirements}} | {{fwd_tri_feasibility}} |
| Reverse triangular merger | 368(a)(1)(A) | {{rev_tri_requirements}} | {{rev_tri_feasibility}} |
| Stock-for-stock (B) | 368(a)(1)(B) | {{b_reorg_requirements}} | {{b_reorg_feasibility}} |
| Stock-for-assets (C) | 368(a)(1)(C) | {{c_reorg_requirements}} | {{c_reorg_feasibility}} |
| F reorganization | 368(a)(1)(F) | {{f_reorg_requirements}} | {{f_reorg_feasibility}} |

**Option E: Partnership / LLC Structure**
| Consideration | Tax Impact |
|--------------|------------|
| Partnership interest vs. assets | {{partnership_consideration}} |
| IRC 704(c) book-up implications | {{book_up}} |
| IRC 751 hot assets (unrealized receivables, inventory) | {{hot_assets}} |
| Liability sharing / basis implications | {{liability_sharing}} |
| Self-employment tax considerations | {{self_employment_tax}} |

### Part 2: Tax Due Diligence Checklist

- [ ] **Historical Tax Compliance** -- all returns filed? Revenue agent reports? Open years?
- [ ] **NOL/ Tax Attribute Analysis** -- §382 analysis, change-of-ownership, limitation projections
- [ ] **State Tax Nexus** -- states filed vs. states with physical/economic nexus; P.L. 86-272
- [ ] **Transfer Pricing Documentation** -- intercompany transactions, cost sharing, APA status
- [ ] **Foreign Operations** -- CFCs, §956 investments, Subpart F, GILTI, FDII, BEAT
- [ ] **Transaction Tax -- Prior Period** -- sales/use, excise, gross receipts, stamp taxes
- [ ] **SALT -- Combined Reporting** -- unitary business determination; apportionment methodology
- [ ] **ASC 740** -- FIN 48 uncertain tax positions (UTPs); valuation allowance assertion
- [ ] **Payroll/Employment Tax** -- worker classification (1099 vs W-2), fringe benefits, ESOP
- [ ] **Employee Equity** -- outstanding options, restricted stock, §409A compliance, parachute payments
- [ ] **Environmental / Remediation** -- potential cleanup liability; capital vs. expense treatment
- [ ] **Indemnification / Tax Sharing** -- existing tax sharing agreements; survival periods
- [ ] **Buildings / Real Property** -- cost segregation study existence; §1031 exchange property; FIRPTA

### Part 3: Tax Modeling -- Pro Forma

**Buyer Pro Forma -- After-Tax Cash Flow (Year 1-5)**

| Year | Taxable Income | NOL Utilized | Taxable Income After NOL | Federal Tax | State Tax | Total Tax | Net Cash Flow |
|------|---------------|-------------|------------------------|-------------|-----------|-----------|---------------|
| Y1 | {{y1_ti}} | {{y1_nol}} | {{y1_ti_after_nol}} | {{y1_fed}} | {{y1_state}} | {{y1_total}} | {{y1_ncf}} |
| Y2 | {{y2_ti}} | {{y2_nol}} | {{y2_ti_after_nol}} | {{y2_fed}} | {{y2_state}} | {{y2_total}} | {{y2_ncf}} |
| Y3 | {{y3_ti}} | {{y3_nol}} | {{y3_ti_after_nol}} | {{y3_fed}} | {{y3_state}} | {{y3_total}} | {{y3_ncf}} |
| Y4 | {{y4_ti}} | {{y4_nol}} | {{y4_ti_after_nol}} | {{y4_fed}} | {{y4_state}} | {{y4_total}} | {{y4_ncf}} |
| Y5 | {{y5_ti}} | {{y5_nol}} | {{y5_ti_after_nol}} | {{y5_fed}} | {{y5_state}} | {{y5_total}} | {{y5_ncf}} |

**Seller Pro Forma -- After-Tax Proceeds**

| Tax Component | Stock Sale | Asset Sale | 338(h)(10) | Tax-Free Reorg |
|--------------|-----------|-----------|------------|----------------|
| Gross proceeds | {{seller_gross_stock}} | {{seller_gross_asset}} | {{seller_gross_338}} | {{seller_gross_tax_free}} |
| Tax basis | {{seller_basis_stock}} | {{seller_basis_asset}} | {{seller_basis_338}} | {{seller_basis_tax_free}} |
| Gain recognized | {{seller_gain_stock}} | {{seller_gain_asset}} | {{seller_gain_338}} | {{seller_gain_tax_free}} |
| Federal tax ({{fed_rate}}%) | {{seller_tax_stock}} | {{seller_tax_asset}} | {{seller_tax_338}} | {{seller_tax_tax_free}} |
| State tax ({{state_rate}}%) | {{seller_state_tax_stock}} | {{seller_state_tax_asset}} | {{seller_state_tax_338}} | {{seller_state_tax_tax_free}} |
| Net after-tax proceeds | {{seller_net_stock}} | {{seller_net_asset}} | {{seller_net_338}} | {{seller_net_tax_free}} |

### Part 4: Recommendation

**Recommended Structure:** {{recommended_structure}}

**Rationale:**
{{structuring_rationale}}

**Risk Factors:**
{{structuring_risks}}

**Mitigants / Workarounds:**
{{structuring_mitigants}}

**Implementation Timeline:**
| Task | Deadline | Owner |
|------|----------|-------|
| {{implementation_task_1}} | {{deadline_1}} | {{owner_1}} |
| {{implementation_task_2}} | {{deadline_2}} | {{owner_2}} |
| {{implementation_task_3}} | {{deadline_3}} | {{owner_3}} |
| {{implementation_task_4}} | {{deadline_4}} | {{owner_4}} |

## output_format

Present as a comprehensive tax structuring memorandum:
1. **Executive Summary** -- recommended structure, key findings, value drivers
2. **Structure Alternatives** -- stock, asset, 338, tax-free, partnership (pros/cons tax matrix)
3. **Tax Due Diligence** -- checklist with findings, risks, and open items
4. **Pro Forma Modeling** -- buyer after-tax cash flow, seller after-tax proceeds, compared across alternatives
5. **Recommendation** -- optimal structure with risk assessment
6. **Implementation Roadmap** -- tasks, deadlines, responsibilities

## constraints

- Stock sales by C corporations result in double taxation (entity-level + shareholder) -- asset sales or 338(h)(10) may be preferred for S corps
- §382 limits NOL usage after an ownership change -- 5-year annual limitation based on value of loss corporation
- §338(h)(10) requires both buyer and seller to jointly elect -- seller must be a target S corp or target member of consolidated group
- Tax-free reorganizations require continuity of interest (>40% stock consideration), continuity of business enterprise (COBE), and a valid business purpose
- QSBS (§1202) exclusion can be up to 100% for stock acquired after 9/27/10 and held >5 years -- significant for individual sellers
- State tax treatment of stock/asset sales, §338 elections, and NOLs varies materially -- always run state-by-state analysis
- Net investment income tax (NIIT) 3.8% may apply to individual sellers' investment income
- Employment tax exposure (worker classification, equity compensation §409A) is a common post-acquisition surprise
- Debt-financed stock purchases trigger original issue discount (OID) and cancellation of debt (COD) considerations
- Earnout payments are generally treated as additional purchase price (not contingent compensation) if properly structured
- Section 197 permits 180-month amortization of intangibles (goodwill, going concern, customer lists) in asset sales
