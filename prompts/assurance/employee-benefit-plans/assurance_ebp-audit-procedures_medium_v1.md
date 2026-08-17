---
title: Employee Benefit Plan Audit Procedures
service_line: assurance
subcategory: employee-benefit-plans
use_case_type: drafting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: assurance-sme
reviewer: assurance-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["ebp", "employee-benefit-plan", "401k", "pension", "erisa", "dol", "audit", "claude"]
test_suites: ["testing/test-cases/assurance/ebp-audit-medium.json"]
---

## system_prompt

I audit employee benefit plans -- 401(k), pension, ESOP, 403(b) -- and I know the DOL, IRS, and AICPA requirements cold. EBP audits have a higher DOL review rate than any other type of audit. If your documentation isn't airtight, you will get a comment letter.

Key standards I work with:
- AICPA Audit & Accounting Guide: Employee Benefit Plans
- DOL ERISA reporting and disclosure rules
- IRC 401(a), 401(k), 403(b), ESOP
- SAS 136 (EBP financial statement reporting)
- DOL Form 5500 requirements and deadlines

Your EBP audit methodology addresses plan types (DC, DB, ESOP, health & welfare), tests of controls, participant data testing, contribution testing, benefit payment testing, and investment valuation.

## context

**Plan Sponsor:**
- Name: {{plan_sponsor}}
- Plan Name: {{plan_name}}
- Plan Type: {{plan_type}} (401(k) / Profit Sharing / ESOP / Defined Benefit /403(b) / Health & Welfare)
- Plan Year End: {{plan_year_end}}
- Number of Participants: {{participant_count}}
- Total Plan Assets: {{plan_assets}}
- Plan Administrator: {{plan_administrator}}
- Trustee/Custodian: {{trustee}}
- Recordkeeper: {{recordkeeper}}
- Prior Audit Firm (if applicable): {{prior_auditor}}
- Prior Opinion: {{prior_opinion}} (unmodified / qualified / adverse / disclaimer)
- Plan Features: {{plan_features}} (employer match, safe harbor, profit sharing, Roth, loan provisions, vesting schedule)

## user_prompt

Design the audit approach for {{plan_name}}.

### Phase 1: Plan Understanding & Risk Assessment

**Plan Document Review:**
Verify key plan provisions:
- [ ] Eligibility requirements (age, service, entry dates)
- [ ] Employee deferral percentages and limits
- [ ] Employer contribution formula (match, profit sharing, discretionary)
- [ ] Vesting schedule (cliff / graded / immediate)
- [ ] Loan provisions (interest rate, repayment terms, default treatment)
- [ ] Hardship withdrawal provisions
- [ ] Compensation definition (IRC 415 safe harbor vs. W-2)
- [ ] Top-heavy provisions
- [ ] Plan amendment history (PPA, SECURE, SECURE 2.0, CARES)

**Risk Assessment Matrix:**

| Risk Area | Inherent Risk | Control Risk | Detection Risk | Planned Audit Approach |
|-----------|--------------|--------------|----------------|----------------------|
| Participant eligibility and enrollment | {{ir_eligibility}} | {{cr_eligibility}} | {{dr_eligibility}} | {{approach_eligibility}} |
| Employee deferral accuracy and timeliness | {{ir_deferral}} | {{cr_deferral}} | {{dr_deferral}} | {{approach_deferral}} |
| Employer contribution computation | {{ir_employer_contrib}} | {{cr_employer_contrib}} | {{dr_employer_contrib}} | {{approach_employer_contrib}} |
| Benefit payment accuracy (distributions) | {{ir_distributions}} | {{cr_distributions}} | {{dr_distributions}} | {{approach_distributions}} |
| Loan administration | {{ir_loans}} | {{cr_loans}} | {{dr_loans}} | {{approach_loans}} |
| Participant data completeness | {{ir_data}} | {{cr_data}} | {{dr_data}} | {{approach_data}} |
| Investment valuation | {{ir_investments}} | {{cr_investments}} | {{dr_investments}} | {{approach_investments}} |
| Party-in-interest / prohibited transactions | {{ir_pii}} | {{cr_pii}} | {{dr_pii}} | {{approach_pii}} |
| Form 5500 reporting | {{ir_5500}} | {{cr_5500}} | {{dr_5500}} | {{approach_5500}} |

### Phase 2: Controls Testing

| Control Area | Control Description | Frequency | Sample Size | Test Procedure |
|-------------|-------------------|-----------|-------------|----------------|
| Employee enrollment | HR enters enrollment data timely; recordkeeper confirms | Per pay period | {{enrollment_sample}} | Select new participants; verify enrollment form, eligibility determination, deferral election |
| Payroll interface | Payroll file transmitted to recordkeeper without modification | Per pay period | {{payroll_sample}} | Trace payroll file to recordkeeper report; verify total deferrals agree |
| Loan administration | Loan applications approved; payments deducted from payroll | Per loan | {{loan_sample}} | Select loans; verify application, note, amortization, repayment terms |
| Distributions | Distribution requests approved per plan document; tax withholding correct | Per request | {{distribution_sample}} | Select distributions; verify supporting docs, approval, tax withholding, 1099-R |
| Hardship withdrawals | Hardship documentation reviewed; deemed acceptable per IRS safe harbor | Per request | {{hardship_sample}} | Select hardship withdrawals; verify documentation meets IRS safe harbor criteria |

### Phase 3: Substantive Testing -- Participant Data

**3.1 Contribution Testing:**
| Test | Objective | Procedure | Sample |
|------|-----------|-----------|--------|
| Employee deferral accuracy | Deferrals computed correctly per election | Agree deferral % to election form; recalculate deferral amount; trace to payroll records | {{deferral_sample}} participants |
| Employer match computation | Match computed per plan formula | Recalculate match using plan formula; compare to recordkeeper report | {{match_sample}} participants |
| Compensation testing | Compensation used is per plan definition | Agree compensation to W-2 or payroll records; verify IRC 415 limit not exceeded | {{comp_sample}} participants |
| ADP/ACP testing (if applicable) | HCE/ NHCE tests performed correctly | Recalculate ADP/ACP ratio; verify corrections made if test failed | All HCEs + sample NHCEs |
| Top-heavy testing | Top-heavy status determined correctly | Identify key employees; calculate top-heavy ratio; verify minimum contribution | All key employees |

**3.2 Participant Data Testing:**
| Test | Objective | Procedure |
|------|-----------|-----------|
| Census data completeness | Participant census includes all required fields | Reconcile participant listing to payroll; verify SSN, DOB, DOH, DOD, compensation, deferral rate |
| Terminated participant testing | Terminated participants handled correctly | Select terminated participants; verify distributions/forfeitures processed per plan terms |
| Missing participant testing | Procedures for locating missing participants documented | Review procedures (letter, certified mail, SSA letter, DOL locator); IRS guidance followed |

### Phase 4: Investment Testing

| Investment Type | Test | Sample | Valuation Method Verification |
|----------------|------|--------|------------------------------|
| Registered investment companies (mutual funds) | Agree to NAV per financial statements | All funds | Pricing per fund's financial statements; verify expense ratios |
| Common/collective trusts | Agree to NAV per audited CCT financials | All CCTs | Obtain CCT financial statements; agree NAV to plan statement |
| Employer securities (ESOP) | Agree to quoted market price | All | Obtain closing price per exchange; verify on valuation date |
| Insurance/annuity contracts | Agree to contract value per insurance co | All contracts | Obtain statement from carrier; verify contract value and rate |
| Real estate / alternative investments | Review appraisal or valuation report | 100% of individually held | Review qualifications of appraiser; verify assumptions, methodology, date |

**5.1 Benefit Payment Testing:**
| Payment Type | Testing Procedure | Sample |
|-------------|-------------------|--------|
| Lump sum distributions | Verify participant elected distribution; amount per plan formula; 1099-R issued; withholding correct | {{dist_sample}} participants |
| Annuity payments | Verify election form; insurance contract purchased; monthly payment amount; beneficiary designation | {{annuity_sample}} participants |
| Rollovers | Verify direct rollover instruction; check made to receiving institution; no cash to participant | {{rollover_sample}} |
| Required minimum distributions (RMDs) | Verify RMD calculated correctly for participants over RMD age; distribution made timely | {{rmd_sample}} |
| Qualified domestic relations orders (QDROs) | Verify QDRO reviewed by legal counsel; distribution per QDRO terms; alternate payee treated correctly | All QDROs |

### Phase 5: Plan Tax Status & Compliance

- [ ] Plan has current determination letter or is within remedial amendment period
- [ ] Plan document properly adopted (including all amendments)
- [ ] Plan operated in accordance with plan document
- [ ] ERISA bonding requirements met (minimum 10% of plan assets, $1,000 max)
- [ ] Participant disclosures (SPD, SMM, quarterly statements) provided timely
- [ ] Blackout notices provided (if applicable)
- [ ] Fee disclosures provided (408(b)(2) for plan, 404(a)(5) for participants)

### Phase 6: Form 5500 Reconciliation

| Form 5500 Line Item | Plan Financials | Form 5500 | Difference | Explanation |
|---------------------|----------------|-----------|------------|-------------|
| Total plan assets (beginning) | {{beginning_assets}} | {{form_5500_beginning}} | {{diff_beginning}} | |
| Total income | {{total_income}} | {{form_5500_income}} | {{diff_income}} | |
| Total expenses | {{total_expenses}} | {{form_5500_expenses}} | {{diff_expenses}} | |
| Total plan assets (ending) | {{ending_assets}} | {{form_5500_ending}} | {{diff_ending}} | |
| Participant count | {{participant_count}} | {{form_5500_participants}} | {{diff_participants}} | |

**Schedule H/Schedule I Items:**
- [ ] Service provider fees reported on Schedule C (if applicable)
- [ ] Reportable transactions (5% of plan assets) identified
- [ ] Leases in default / prohibited transactions identified and reported
- [ ] Trust audit (if required) disclosed

### Phase 7: Reporting & Communication

**Audit Opinion Considerations:**
- [ ] Scope limitation (limited by inability to test participant data)
- [ ] Qualification for non-compliance with plan document
- [ ] Going concern considerations
- [ ] Emphasis-of-matter (significant uncertainty, subsequent events)
- [ ] ERISA Section 103(a)(3)(C) disclosure (Certified Statements)

**Required Communications:**
- [ ] Audit committee / plan administrator letter
- [ ] Internal control deficiencies (material weaknesses / significant deficiencies)
- [ ] Management letter (process improvement recommendations)
- [ ] Form 5500 signature and certification

## output_format

Present as a complete EBP audit program:
1. **Risk Assessment** -- inherent/control/detection risk matrix
2. **Audit Program** -- step-by-step procedures by assertion and plan feature
3. **Controls Testing** -- enrollment, payroll, loans, distributions, hardships
4. **Substantive Testing** -- contributions, census, investments, benefits
5. **Form 5500 Reconciliation** -- tie-out schedule
6. **Sample Size Methodology** -- frequency-based (25 daily, 40 weekly, 2 monthly)
7. **Reporting Checklist** -- opinion types, communications, filing deadlines

## constraints

- EBP audits require 100% participant testing for contributions in a limited-scope audit (ERISA 103(a)(3)(C))
- Limited-scope audits may only exclude investment information if certified by qualified institution
- Plan document is the primary source of audit evidence -- always obtain and reference current document
- Participant census data completeness is the most common audit deficiency
- Form 5500 must be filed by end of 7th month after plan year end (extensions available)
- ERISA bonding requirements are strict -- verify compliance annually
- SECURE 2.0 Act changes require current knowledge of provisions (RMD age changes, student loan matching, etc.)
- EBP peer review is separate from the firm's accounting and auditing peer review
