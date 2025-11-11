---
title: Research & Development Tax Credit Study
service_line: tax
subcategory: credits-incentives
use_case_type: analysis
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: tax-sme
reviewer: tax-sme
created_date: 2026-05-05
last_modified: 2026-06-12
tags: ["rd-credit", "tax-credits", "irc-41", "section-174", "innovation", "claude"]
test_suites: ["testing/test-cases/tax/rd-credit.json"]
---

## system_prompt

I help companies identify, document, and substantiate qualified research expenditures (QREs) for federal and state R&D credits. The biggest mistake I see: companies don't document their qualified activities as they go, and then try to reconstruct everything at year end. Documentation needs to be contemporaneous.

My process:
1. Identify qualified activities using the four-part test
2. Identify and classify QREs
3. Calculate the credit (regular method and alternative simplified)
4. Document substantiation per IRC 41(d) requirements
5. Address Section 174 capitalization impacts

## context

**Company Profile:**
- Name: {{company_name}}
- Industry: {{industry}}
- Entity Type: {{entity_type}}
- Fiscal Year End: {{fiscal_year_end}}
- Prior Year Credit History: {{prior_credit_history}} (first-time / amended / previously claimed)
- Tax Situation: {{tax_situation}} (AMT status, NOL position, etc.)

**Operations Summary:**
- Business activities: {{business_activities}}
- Development processes: {{development_processes}}
- Engineering/technical headcount: {{engineering_headcount}}
- R&D as % of revenue: {{rd_pct_revenue}}

## user_prompt

Perform an R&D tax credit study analysis for {{company_name}}.

### Step 1: Qualified Activities -- Four-Part Test

For each development activity, evaluate against the four-part test under IRC Section 41(d):

| Activity | Permitted Purpose? (1) | Technological in Nature? (2) | Elimination of Uncertainty? (3) | Process of Experimentation? (4) | Qualified? |
|----------|----------------------|---------------------------|-------------------------------|-------------------------------|-----------|
| {{activity_1}} | {{test_1_1}} | {{test_1_2}} | {{test_1_3}} | {{test_1_4}} | {{qualified_1}} |
| {{activity_2}} | {{test_2_1}} | {{test_2_2}} | {{test_2_3}} | {{test_2_4}} | {{qualified_2}} |
| {{activity_3}} | {{test_3_1}} | {{test_3_2}} | {{test_3_3}} | {{test_3_4}} | {{qualified_3}} |

**Non-qualified activities to exclude:**
- Routine data collection
- Quality control testing (unless part of development)
- Market research
- Routine software maintenance
- Duplicating existing products
- Foreign research (limited exception)

### Step 2: Qualified Research Expenditures (QREs)

Classify and total QREs:

| Category | Description | Qualified Amount | Documentation Required |
|----------|-------------|-----------------|----------------------|
| **Wages** | W-2 wages for qualified services | {{wage_amount}} | Timesheets, project descriptions, org charts |
| **Supplies** | Tangible property used in R&D | {{supplies_amount}} | Purchase orders, usage logs |
| **Contract Research** | 65% of qualified contract payments | {{contract_amount}} | Contracts, SOWs, invoices |
| **Total QREs** | | {{total_qres}} | |

### Step 3: Credit Calculation

**Regular Method (IRC Section 41(a)(1)):**
- Credit = 20% of current year QREs over base amount
- Fixed-base percentage: {{fixed_base_pct}}%
- Base amount: {{base_amount}}
- Regular credit: {{regular_credit_amount}}

**Alternative Simplified Method (IRC Section 41(c)(4)):**
- Credit = 14% of current year QREs over 50% of average prior 3 years QREs
- Prior 3-year average QREs: {{prior_avg_qres}}
- ASM credit: {{asm_credit_amount}}

**Recommended method:** {{recommended_method}} (typically the higher of the two, subject to limitations)

### Step 4: Section 174 Impact Assessment

Evaluate the impact of the Tax Cuts and Jobs Act (TCJA) Section 174 capitalization requirement (effective 2022):

| Pre-2022 Treatment | 2022+ Treatment |
|-------------------|-----------------|
| Immediate expense | Capitalize and amortize over 5 years (US) / 15 years (foreign) |

Section 174 interaction with R&D credit:
- QREs are the same base for both Section 174 and Section 41
- Capitalization does not reduce the credit -- QREs for credit purposes remain the same
- Impact on taxable income: {{section_174_impact}}

### Step 5: Documentation & Substantiation

For each QRE category, provide the documentation requirements:

**Wage Documentation:**
- Project-level timesheets or estimates for qualified vs non-qualified time
- W-2 forms and payroll records
- Organizational charts showing supervisory chain
- Internal memoranda describing technical projects

**Supply Documentation:**
- Purchase orders and invoices for materials used in experimentation
- Scrap and prototype costs
- Usage logs tying supplies to specific projects

**Contract Research Documentation:**
- Signed contracts with scope of work
- Invoices showing payments
- Evidence of research performed (reports, deliverables)
- 65% inclusion rule applied correctly

### Step 6: State Credit Considerations

Identify applicable state R&D credits in {{operating_states}}:

| State | Credit Type | Rate | Carryforward | Stackable with Federal? |
|-------|-------------|------|-------------|------------------------|
| {{state}} | {{credit_type}} | {{rate}} | {{carryforward}} | {{stackable}} |

## output_format

Present as a structured credit study report:
1. **Executive Summary** -- estimated credit amount, recommended method, key risks
2. **Qualified Activities Inventory** -- table of activities with four-part test results
3. **QRE Summary** -- by category with supporting documentation
4. **Credit Calculation** -- regular method, ASM, and recommended method
5. **Section 174 Reconciliation** -- impact on tax return
6. **State Credit Analysis** -- applicable state credits
7. **Documentation Checklist** -- substantiation requirements with document list
8. **Implementation Timeline** -- when to file, amended return needs, elections

## examples

**Four-Part Test -- Software Development Example:**
- Activity: Developing a new machine learning algorithm for fraud detection
- Permitted Purpose: Yes -- new functional improvement to product
- Technological in Nature: Yes -- relies on computer science principles
- Elimination of Uncertainty: Yes -- capability, methodology, and design uncertain at outset
- Process of Experimentation: Yes -- iterated through multiple model architectures and training approaches
- **Qualified:** Yes

## constraints

- The four-part test must be documented contemporaneously -- reconstruction is possible but less defensible
- Section 174 capitalization must be computed separately from the credit -- they are independent
- Software development for internal use may qualify if the software involves novel or unique concepts
- Foreign research activities are generally excluded (limited exception for CFC inclusions)
- State credits vary significantly -- always check state-specific conformity with IRC Section 41
