---
title: Client Accounting Services (CAS) -- Setup & Transition
service_line: advisory
subcategory: outsourced-accounting
use_case_type: analysis
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["cas", "client-accounting-services", "outsourced-accounting", "erp-implementation", "chart-of-accounts", "process-design", "quote-to-cash", "procure-to-pay", "record-to-report", "claude"]
test_suites: ["testing/test-cases/advisory/cas-setup-medium.json"]
---

## system_prompt

I've set up client accounting services engagements from scratch -- and taken over messes created by firms that did it wrong. The first twelve months are where engagements succeed or die, and it almost always comes down to the chart of accounts and the transition plan, not the accounting. You design scalable accounting operations for private companies, startups, nonprofits, and professional services firms.

Your CAS methodology covers:
- Chart of accounts design (industry-specific, scalable for future needs)
- ERP/accounting system selection (QuickBooks, Xero, MS Dynamics, NetSuite, Sage)
- Process documentation -- Quote-to-Cash (Q2C), Procure-to-Pay (P2P), Record-to-Report (R2R), Hire-to-Retire (H2R)
- Internal controls design for small-to-mid-size entities
- Month-end close optimization (close calendar, milestones, checklists)
- Outsourced controller / CFO reporting package design
- Transition planning (data migration, parallel runs, cutover)

## context

**Client Profile:**
- Company Name: {{company_name}}
- Industry: {{industry}}
- Entity Type: {{entity_type}} (C corp / S corp / LLC / nonprofit / partnership)
- Revenue: {{revenue}}
- Employees: {{employee_count}}
- Transaction Volume (monthly): {{monthly_transactions}}
- Current Accounting System: {{current_system}}
- Target Accounting System: {{target_system}}
- Current State: {{current_state}}(startup / prior provider / in-house team / manual process / unsupported software)
- Est. Monthly Hours Required: {{estimated_monthly_hours}}
- Level of Service Needed: {{service_level}} (bookkeeping / client controller / outsourced CFO / full-suite)
- Prior Provider (if transitioning): {{prior_provider_name}}
- Transition Date: {{transition_date}}

## user_prompt

Design a CAS setup and transition plan for {{company_name}}.

### Phase 1: Discovery & Requirements

**Business Requirements:**
| Area | Current Process | Desired State | Gap |
|------|----------------|---------------|-----|
| Billing / revenue recognition | {{billing_current}} | {{billing_desired}} | {{billing_gap}} |
| Accounts payable / vendor management | {{ap_current}} | {{ap_desired}} | {{ap_gap}} |
| Expense reporting / reimbursement | {{expense_current}} | {{expense_desired}} | {{expense_gap}} |
| Payroll / HR integrations | {{payroll_current}} | {{payroll_desired}} | {{payroll_gap}} |
| Sales tax collection & filing | {{sales_tax_current}} | {{sales_tax_desired}} | {{sales_tax_gap}} |
| Multi-entity / multi-currency | {{multi_entity_current}} | {{multi_entity_desired}} | {{multi_entity_gap}} |
| Inventory / COGS tracking | {{inventory_current}} | {{inventory_desired}} | {{inventory_gap}} |
| Cash management / bank feeds | {{cash_current}} | {{cash_desired}} | {{cash_gap}} |
| Financial reporting / dashboards | {{reporting_current}} | {{reporting_desired}} | {{reporting_gap}} |
| Budgeting / forecasting | {{budget_current}} | {{budget_desired}} | {{budget_gap}} |

**System Requirements Assessment:**
| Requirement | QuickBooks Online | Xero | MS Dynamics BC | NetSuite | Sage Intacct | Notes |
|-------------|:-:|:-:|:-:|:-:|:-:|-------|
| Monthly transaction capacity ({{monthly_transactions}}) | {{qbo_capacity}} | {{xero_capacity}} | {{bc_capacity}} | {{ns_capacity}} | {{si_capacity}} | |
| Multi-entity consolidation | {{qbo_multi}} | {{xero_multi}} | {{bc_multi}} | {{ns_multi}} | {{si_multi}} | |
| Multi-currency / FX | {{qbo_fx}} | {{xero_fx}} | {{bc_fx}} | {{ns_fx}} | {{si_fx}} | |
| Inventory management | {{qbo_inv}} | {{xero_inv}} | {{bc_inv}} | {{ns_inv}} | {{si_inv}} | |
| Project / job costing | {{qbo_project}} | {{xero_project}} | {{bc_project}} | {{ns_project}} | {{si_project}} | |
| Revenue recognition (ASC 606) | {{qbo_revrec}} | {{xero_revrec}} | {{bc_revrec}} | {{ns_revrec}} | {{si_revrec}} | |
| Nonprofit / fund accounting | {{qbo_nfp}} | {{xero_nfp}} | {{bc_nfp}} | {{ns_nfp}} | {{si_nfp}} | |
| AP automation / bill.com | {{qbo_ap}} | {{xero_ap}} | {{bc_ap}} | {{ns_ap}} | {{si_ap}} | |
| Payroll integration | {{qbo_payroll}} | {{xero_payroll}} | {{bc_payroll}} | {{ns_payroll}} | {{si_payroll}} | |
| Sales tax automation (Avalara) | {{qbo_tax}} | {{xero_tax}} | {{bc_tax}} | {{ns_tax}} | {{si_tax}} | |
| Budgeting / FP&A tools | {{qbo_budget}} | {{xero_budget}} | {{bc_budget}} | {{ns_budget}} | {{si_budget}} | |
| Third-party integrations (APIs) | {{qbo_api}} | {{xero_api}} | {{bc_api}} | {{ns_api}} | {{si_api}} | |
| Scalability for 2x growth | {{qbo_scale}} | {{xero_scale}} | {{bc_scale}} | {{ns_scale}} | {{si_scale}} | |

**Recommended System:** {{recommended_system}} | **Justification:** {{system_justification}} | **Implementation Partner:** {{implementation_partner}}

### Phase 2: Chart of Accounts Design

**COS/COA Structure Plan:**
| Account Group | Range | Description | Proposed Accounts |
|--------------|-------|-------------|-------------------|
| Assets -- Current | 1000-1499 | Cash, AR, Inventory, Prepaids | {{coa_assets_current}} |
| Assets -- Fixed | 1500-1799 | PP&E, Accumulated Depreciation, Construction-in-Progress | {{coa_assets_fixed}} |
| Assets -- Other | 1800-1999 | Goodwill, Intangibles, Deposits, Intercompany | {{coa_assets_other}} |
| Liabilities -- Current | 2000-2499 | AP, Credit Cards, Accrued Expenses, Deferred Revenue, Sales Tax | {{coa_liabilities_current}} |
| Liabilities -- Long-Term | 2500-2799 | Notes Payable, Loans, Deferred Tax | {{coa_liabilities_lt}} |
| Equity | 3000-3999 | Capital, Retained Earnings, Distributions, OCI | {{coa_equity}} |
| Revenue | 4000-4999 | Product, Service, Interest, Other Income | {{coa_revenue}} |
| COGS | 5000-5999 | Materials, Labor, Overhead, Freight | {{coa_cogs}} |
| Expenses -- SG&A | 6000-6999 | Salaries, Rent, Professional Fees, Marketing, Travel | {{coa_sga}} |
| Expenses -- Other | 7000-7999 | Interest, Taxes, Depreciation, Amortization | {{coa_other_expenses}} |
| Other Income/Expense | 8000-8999 | Gains/Losses, Investment Income | {{coa_other_income}} |

**Key Design Decisions:**
- [ ] Department / class tracking (by location, division, project, grant)
- [ ] Customer / vendor detail (sub-ledger vs. GL account)
- [ ] Multi-entity consolidation accounts
- [ ] Intercompany elimination accounts
- [ ] Revenue streams by product/service line
- [ ] Cost center structure
- [ ] Billable vs. non-billable expense tracking

### Phase 3: Process Design & Documentation

**Quote-to-Cash (Q2C):**
| Step | Responsible | System | Control | Frequency |
|------|------------|--------|---------|-----------|
| Quote/estimate generation | {{q2c_quote_resp}} | {{q2c_quote_sys}} | {{q2c_quote_control}} | {{q2c_quote_freq}} |
| Order/invoice creation | {{q2c_invoice_resp}} | {{q2c_invoice_sys}} | {{q2c_invoice_control}} | {{q2c_invoice_freq}} |
| Revenue recognition (ASC 606) | {{q2c_revrec_resp}} | {{q2c_revrec_sys}} | {{q2c_revrec_control}} | {{q2c_revrec_freq}} |
| Cash application | {{q2c_cash_resp}} | {{q2c_cash_sys}} | {{q2c_cash_control}} | {{q2c_cash_freq}} |
| Collections / AR aging | {{q2c_collections_resp}} | {{q2c_collections_sys}} | {{q2c_collections_control}} | {{q2c_collections_freq}} |

**Procure-to-Pay (P2P):**
| Step | Responsible | System | Control | Frequency |
|------|------------|--------|---------|-----------|
| Purchase requisition / PO | {{p2p_po_resp}} | {{p2p_po_sys}} | {{p2p_po_control}} | {{p2p_po_freq}} |
| Goods receipt / service entry | {{p2p_receipt_resp}} | {{p2p_receipt_sys}} | {{p2p_receipt_control}} | {{p2p_receipt_freq}} |
| Invoice matching (2-way / 3-way) | {{p2p_match_resp}} | {{p2p_match_sys}} | {{p2p_match_control}} | {{p2p_match_freq}} |
| Approval routing / workflow | {{p2p_approval_resp}} | {{p2p_approval_sys}} | {{p2p_approval_control}} | {{p2p_approval_freq}} |
| Payment execution | {{p2p_payment_resp}} | {{p2p_payment_sys}} | {{p2p_payment_control}} | {{p2p_payment_freq}} |

**Record-to-Report (R2R) -- Month-End Close:**
| Task | Due (Day) | Owner | Control | Status Tracking |
|------|-----------|-------|---------|----------------|
| Bank reconciliations (all accounts) | Day 1 | {{r2r_bank_owner}} | {{r2r_bank_control}} | {{r2r_bank_status}} |
| Credit card reconciliation | Day 1 | {{r2r_cc_owner}} | {{r2r_cc_control}} | {{r2r_cc_status}} |
| Deferred revenue reconciliation | Day 1-2 | {{r2r_deferred_owner}} | {{r2r_deferred_control}} | {{r2r_deferred_status}} |
| AP aging / vendor statement rec | Day 1-2 | {{r2r_ap_owner}} | {{r2r_ap_control}} | {{r2r_ap_status}} |
| AR aging / customer statement rec | Day 1-2 | {{r2r_ar_owner}} | {{r2r_ar_control}} | {{r2r_ar_status}} |
| Payroll journal entry | Day 1-2 | {{r2r_payroll_owner}} | {{r2r_payroll_control}} | {{r2r_payroll_status}} |
| Fixed assets / depreciation entry | Day 2-3 | {{r2r_fa_owner}} | {{r2r_fa_control}} | {{r2r_fa_status}} |
| Accruals (bonus, commission, interest) | Day 2-3 | {{r2r_accrual_owner}} | {{r2r_accrual_control}} | {{r2r_accrual_status}} |
| Prepaid amortization | Day 2-3 | {{r2r_prepaid_owner}} | {{r2r_prepaid_control}} | {{r2r_prepaid_status}} |
| Intercompany reconciliations | Day 3-4 | {{r2r_ic_owner}} | {{r2r_ic_control}} | {{r2r_ic_status}} |
| Inventory / COGS calculation | Day 3-5 | {{r2r_inventory_owner}} | {{r2r_inventory_control}} | {{r2r_inventory_status}} |
| Sales tax reconciliation | Day 3-4 | {{r2r_salestax_owner}} | {{r2r_salestax_control}} | {{r2r_salestax_status}} |
| Revenue / COGS JE review | Day 4-5 | {{r2r_revenue_owner}} | {{r2r_revenue_control}} | {{r2r_revenue_status}} |
| Trial balance review | Day 5-6 | {{r2r_tb_owner}} | {{r2r_tb_control}} | {{r2r_tb_status}} |
| Financial statement preparation | Day 6-7 | {{r2r_fs_owner}} | {{r2r_fs_control}} | {{r2r_fs_status}} |
| Management reporting / KPIs | Day 7-10 | {{r2r_report_owner}} | {{r2r_report_control}} | {{r2r_report_status}} |
| Board / investor package | Day 10-15 | {{r2r_board_owner}} | {{r2r_board_control}} | {{r2r_board_status}} |

**Management Reporting Package:**
| Report | Format | Recipients | Frequency |
|--------|--------|------------|-----------|
| P&L vs Budget / Variance | {{pl_format}} | {{pl_recipients}} | {{pl_frequency}} |
| Balance Sheet | {{bs_format}} | {{bs_recipients}} | {{bs_frequency}} |
| Cash Flow Statement | {{cf_format}} | {{cf_recipients}} | {{cf_frequency}} |
| AR Aging / Days Sales Outstanding | {{ar_format}} | {{ar_recipients}} | {{ar_frequency}} |
| AP Aging / Days Payable Outstanding | {{ap_format}} | {{ap_recipients}} | {{ap_frequency}} |
| Revenue by Product/Service Line | {{revenue_detail_format}} | {{revenue_detail_recipients}} | {{revenue_detail_frequency}} |
| Headcount / Labor Cost Summary | {{headcount_format}} | {{headcount_recipients}} | {{headcount_frequency}} |
| Cash Forecast (13-week) | {{forecast_format}} | {{forecast_recipients}} | {{forecast_frequency}} |
| KPI Dashboard (Rev, GP%, EBITDA, Cash) | {{kpi_format}} | {{kpi_recipients}} | {{kpi_frequency}} |

### Phase 4: Transition & Data Migration

| Migration Step | Source | Target | Timeline | Validation |
|---------------|--------|--------|----------|------------|
| Trial balance export & mapping | {{tb_source}} | {{tb_target}} | {{tb_timeline}} | {{tb_validation}} |
| Chart of accounts mapping | {{coa_source}} | {{coa_target}} | {{coa_timeline}} | {{coa_validation}} |
| Open AR / customer balances | {{ar_source}} | {{ar_target}} | {{ar_timeline}} | {{ar_validation}} |
| Open AP / vendor balances | {{ap_source}} | {{ap_target}} | {{ap_timeline}} | {{ap_validation}} |
| Inventory quantities & valuation | {{inv_source}} | {{inv_target}} | {{inv_timeline}} | {{inv_validation}} |
| Fixed asset register | {{fa_source}} | {{fa_target}} | {{fa_timeline}} | {{fa_validation}} |
| Historical financial statements (prior 2 years) | {{hist_source}} | {{hist_target}} | {{hist_timeline}} | {{hist_validation}} |
| Budget / prior year actuals | {{budget_source}} | {{budget_target}} | {{budget_timeline}} | {{budget_validation}} |
| Bank / credit card historical data | {{bank_source}} | {{bank_target}} | {{bank_timeline}} | {{bank_validation}} |
| Payroll history / benefit codes | {{payroll_source}} | {{payroll_target}} | {{payroll_timeline}} | {{payroll_validation}} |

**Transition Strategy:**
| Approach | Description | Pros | Cons | Selected? |
|----------|-------------|------|------|-----------|
| Big Bang / One-Time Cutover | All data migrated at once; new system live on Day 1 | Fast, clean break | Higher risk; downtime during transition | {{selected_bigbang}} |
| Phased / Module-by-Module | Go live by module (GL first, then AP, AR, etc.) | Lower risk; team learns gradually | Extended timeline; dual systems | {{selected_phased}} |
| Parallel Run | Both systems run simultaneously for 1-2 months | Lowest risk; reconciliation validates data | Most effort; costly; team fatigue | {{selected_parallel}} |

**Cutover Weekend Plan:**
| Time | Activity | Owner | Status |
|------|----------|-------|--------|
| Friday 5 PM | Freeze data entry in old system | {{cutover_1_owner}} | {{cutover_1_status}} |
| Friday 5-8 PM | Final reconciliation in old system | {{cutover_2_owner}} | {{cutover_2_status}} |
| Friday 8 PM - Saturday 12 PM | Data extract, transform, and load | {{cutover_3_owner}} | {{cutover_3_status}} |
| Saturday 12-4 PM | Data validation & exception handling | {{cutover_4_owner}} | {{cutover_4_status}} |
| Saturday 4-8 PM | Balance verification (TB tie-out) | {{cutover_5_owner}} | {{cutover_5_status}} |
| Saturday 8 PM - Sunday 12 PM | User acceptance testing (UAT) | {{cutover_6_owner}} | {{cutover_6_status}} |
| Sunday 12-5 PM | Go/no-go decision meeting | {{cutover_7_owner}} | {{cutover_7_status}} |
| Monday 8 AM | Go live -- begin data entry in new system | {{cutover_8_owner}} | {{cutover_8_status}} |

### Phase 5: Ongoing Service Delivery

**Service Level Agreement (SLA):**
| Metric | Target | Measurement |
|--------|--------|-------------|
| Month-end close completion | Day {{close_target}} | Actual close date vs target |
| AP invoice processing time | {{ap_tat}} business days | Invoice receipt to payment |
| AR collections follow-up | {{ar_tat}} days past due | Aging trigger to outreach |
| Bank reconciliation | {{bank_sla}} business days | Month-end to reconciliation complete |
| Financial reporting package delivery | {{report_sla}} business days | Month-end to report delivery |
| Client response time (email) | {{email_response}} business hours | Email receipt to first response |
| Client meeting / review cadence | {{meeting_cadence}} | Scheduled recurring meeting |
| System uptime / availability | {{uptime}}% | Vendor SLA + our availability |

**Quarterly Business Review (QBR) Agenda:**
1. Financial performance review (P&L variance, cash flow, KPIs)
2. Process improvement opportunities
3. System optimization recommendations
4. Staffing / service level adjustment
5. Upcoming deadlines (tax, audit, board)
6. Prior QBR action items follow-up

## output_format

Present as a comprehensive CAS setup and transition plan:
1. **Requirements Assessment** -- business requirements matrix, system evaluation, recommendation
2. **Chart of Accounts Design** -- COA structure by account group (1000-8999), key design decisions
3. **Process Design** -- Q2C, P2P, R2R process flows with controls and responsibilities
4. **Month-End Close** -- day-by-day calendar with 17+ tasks and owner assignments
5. **Management Reporting** -- reporting package design with format, recipients, cadence
6. **Transition Plan** -- data migration schedule, cutover weekend plan, go-live strategy
7. **SLA & Service Delivery** -- metrics, targets, QBR agenda

## constraints

- Chart of accounts should balance standardization (for cross-client comparison) with client-specific needs (revenue streams, cost centers, departments)
- Month-end close should target Day 10 for basic bookkeeping, Day 5 for outsourced controller level, same-week for outsourced CFO -- adjust based on client priority
- Internal controls must compensate for the CAS provider's remote access -- consider segregation of duties between provider and client approver
- Data migration is the highest failure risk event -- always include parallel run or phased approach for >5K transactions/month
- Sales tax automation (Avalara, TaxJar) should be integrated at setup, not retrofitted -- reduces post-migration non-compliance risk
- System selection must consider client's growth trajectory -- migrating systems within 18 months is a failure indicator
- For nonprofit clients, fund accounting restrictions (donor-imposed vs. board-designated) must be reflected in COA design from Day 1
- Multi-entity consolidations require intercompany elimination mapping -- invest in this at setup, not as a workaround
- Transition from prior provider requires careful management of the transition notice period -- avoid service gaps
- State-specific requirements (CA minimum wage, NY paid family leave) must be configured in payroll integrations
- Client onboarding baseline includes export of complete prior system data -- never rely solely on prior provider's summary reports
- Monthly recurring billing clients (SaaS, subscription) should have deferred revenue and ASC 606 schedules built into the COA and system setup
