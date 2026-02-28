---
title: SOX Internal Control Narrative & Testing
service_line: risk-cybersecurity
subcategory: sox-compliance
use_case_type: drafting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: risk-sme
reviewer: assurance-sme
created_date: 2026-05-18
last_modified: 2026-06-14
tags: ["sox", "internal-controls", "sarbanes-oxley", "audit", "compliance", "coSO", "claude"]
test_suites: ["testing/test-cases/risk-cybersecurity/sox-narrative.json"]
---

## system_prompt

I've been doing SOX compliance work for years -- COSO 2013 framework, PCAOB AS5, ICFR design and testing. SOX gets a bad rap as a checkbox exercise, but when it's done right, it actually improves how you run your financial systems. When it's done wrong, it's just a paper mill.

There are four layers of controls you need to understand:
- **Entity-level controls** -- tone at the top, risk assessment, monitoring
- **Process-level controls** -- transaction-level controls in significant processes
- **IT General Controls (ITGCs)** -- access, change management, operations
- **Application controls** -- automated controls embedded in business systems

## context

**Company Profile:**
- Name: {{company_name}}
- Public/Private: {{public_status}} (public filer / pre-IPO / subsidiary of public)
- Fiscal Year End: {{fiscal_year_end}}
- Auditor: {{auditor}}
- SOX History: {{sox_history}} (first year / second year / mature)
- Materiality: {{materiality}} (planning materiality)
- Significant Accounts: {{significant_accounts}}

**Process Under Review:**
- Process Name: {{process_name}} (e.g., Order-to-Cash, Procure-to-Pay, Record-to-Report, Hire-to-Retire, Treasury, Inventory, Payroll)
- System(s): {{systems}} (ERP, CRM, billing, payroll)
- Key Reports: {{key_reports}}
- Interfaces: {{interfaces}}

## user_prompt

Draft the SOX control narrative and test plan for the {{process_name}} process.

### Section 1: Process Flow Narrative

**1.1 Process Overview**
{{process_overview}}

**1.2 Transaction Flow Description**

Document the flow from initiation to financial reporting:

| Step | Description | Department | System | Document Created | Control Point? |
|------|-------------|------------|--------|-----------------|---------------|
| 1 | {{step_1}} | {{dept_1}} | {{system_1}} | {{doc_1}} | {{control_1}} |
| 2 | {{step_2}} | {{dept_2}} | {{system_2}} | {{doc_2}} | {{control_2}} |
| 3 | {{step_3}} | {{dept_3}} | {{system_3}} | {{doc_3}} | {{control_3}} |
| 4 | {{step_4}} | {{dept_4}} | {{system_4}} | {{doc_4}} | {{control_4}} |
| 5 | {{step_5}} | {{dept_5}} | {{system_5}} | {{doc_5}} | {{control_5}} |

**1.3 Systems and Data Flow Diagram:**
```
[Source System: {{source_system}}] → [Interface: {{interface}}] → [ERP: {{erp}}] → [Reporting: {{reporting_tool}}]
                              ↓                          ↓
                   [Data Warehouse]              [Subledger]
```

**1.4 Key Reports Used in Controls:**

| Report Name | Source System | Frequency | Used in Control # |
|-------------|--------------|-----------|------------------|
| {{report_1}} | {{source_1}} | {{freq_1}} | {{control_ref_1}} |
| {{report_2}} | {{source_2}} | {{freq_2}} | {{control_ref_2}} |

### Section 2: Control Matrix

**2.1 Risk and Control Mapping:**

| # | Financial Statement Assertion | Risk | Control Description | Control Type | Frequency | Preventive/ Detective | Automated/ Manual | System |
|---|------------------------------|------|---------------------|-------------|-----------|---------------------|-------------------|--------|
| 1 | Existence/Occurrence | {{risk_1}} | {{control_desc_1}} | {{type_1}} | {{freq_1}} | {{det_prev_1}} | {{auto_manual_1}} | {{sys_1}} |
| 2 | Completeness | {{risk_2}} | {{control_desc_2}} | {{type_2}} | {{freq_2}} | {{det_prev_2}} | {{auto_manual_2}} | {{sys_2}} |
| 3 | Accuracy | {{risk_3}} | {{control_desc_3}} | {{type_3}} | {{freq_3}} | {{det_prev_3}} | {{auto_manual_3}} | {{sys_3}} |
| 4 | Cutoff | {{risk_4}} | {{control_desc_4}} | {{type_4}} | {{freq_4}} | {{det_prev_4}} | {{auto_manual_4}} | {{sys_4}} |
| 5 | Valuation | {{risk_5}} | {{control_desc_5}} | {{type_5}} | {{freq_5}} | {{det_prev_5}} | {{auto_manual_5}} | {{sys_5}} |
| 6 | Rights/Obligations | {{risk_6}} | {{control_desc_6}} | {{type_6}} | {{freq_6}} | {{det_prev_6}} | {{auto_manual_6}} | {{sys_6}} |
| 7 | Presentation/Disclosure | {{risk_7}} | {{control_desc_7}} | {{type_7}} | {{freq_7}} | {{det_prev_7}} | {{auto_manual_7}} | {{sys_7}} |

**2.2 Entity-Level Controls (ELCs) Mapping:**

| COSO Component | Control Description | Control Owner | Assessment |
|---------------|-------------------|---------------|------------|
| Control Environment | {{ce_control}} | {{ce_owner}} | {{ce_assessment}} |
| Risk Assessment | {{ra_control}} | {{ra_owner}} | {{ra_assessment}} |
| Control Activities | Embedded in process controls above | | |
| Information & Communication | {{ic_control}} | {{ic_owner}} | {{ic_assessment}} |
| Monitoring Activities | {{ma_control}} | {{ma_owner}} | {{ma_assessment}} |

### Section 3: Test of Controls Plan

**3.1 Test Procedures:**

| Control Ref | Control Description | Test Procedure | Sample Size | Nature of Testing | Evidence to Inspect |
|-------------|-------------------|----------------|-------------|-------------------|-------------------|
| IC-1 | {{control_desc}} | {{test_procedure}} | {{sample_size}} | Inspection / Reperformance / Observation / Inquiry | {{evidence}} |
| IC-2 | {{control_desc}} | {{test_procedure}} | {{sample_size}} | Inspection / Reperformance | {{evidence}} |
| IC-3 | {{control_desc}} | {{test_procedure}} | {{sample_size}} | Reperformance | {{evidence}} |

**3.2 Sample Size Guidance (PCAOB AS5):**

| Control Frequency | Minimum Sample | Medium/High Risk Sample | Recommended for First Year |
|------------------|---------------|------------------------|---------------------------|
| Multiple times per day | 25 | 40 | 40 |
| Daily | 25 | 30 | 30 |
| Weekly | 5 | 10 | 10 |
| Monthly | 2 | 3 | 3 |
| Quarterly | 2 | 2 | 2 |
| Annually | 1 | 1 | 1 |

**3.3 Walkthrough Procedures:**

For each control, perform a walkthrough:
1. **Inquiry** -- Ask the control owner to explain the process
2. **Observation** -- Observe the control being performed
3. **Inspection** -- Review documentation of prior control executions
4. **Reperformance** -- independently execute the control to verify design

### Section 4: Deficiency Evaluation

**Classify findings:**

| Deficiency Type | Definition | Example | Remediation Required |
|----------------|------------|---------|---------------------|
| **Control Deficiency** | Design or operation doesn't allow timely prevention/detection | Missing approval on 1 of 40 invoices | Yes |
| **Significant Deficiency** | Less severe than material weakness but important enough to communicate to audit committee | Systematic lack of segregation of duties in AP | Yes -- accelerated |
| **Material Weakness** | Reasonable possibility that a material misstatement will not be prevented or detected | Management override of controls, lack of competent accounting personnel | Yes -- immediate |

**Deficiency Documentation:**
| Finding | Root Cause | Implication | Magnitude | Remediation Plan | Remediation Owner | Target Date |
|---------|------------|-------------|-----------|-----------------|-------------------|-------------|
| {{finding_1}} | {{root_cause_1}} | {{implication_1}} | {{magnitude_1}} | {{remediation_1}} | {{owner_1}} | {{date_1}} |
| {{finding_2}} | {{root_cause_2}} | {{implication_2}} | {{magnitude_2}} | {{remediation_2}} | {{owner_2}} | {{date_2}} |

### Section 5: SOX Readiness Checklist

- [ ] Process narratives documented for all significant accounts
- [ ] Risk and control matrices completed
- [ ] ITGC testing completed (access, change management, operations)
- [ ] Entity-level controls assessed
- [ ] Walkthroughs performed for all key controls
- [ ] Test of controls executed with appropriate sample sizes
- [ ] Deficiencies evaluated and classified
- [ ] Remediation plans in place for identified deficiencies
- [ ] Remediation testing performed (if applicable)
- [ ] Audit committee reporting prepared
- [ ] Management's assessment signed
- [ ] Auditor's opinion on ICFR received

## output_format

Present as a complete SOX workpaper package:
1. **Process Narrative** -- detailed transaction flow with RACI
2. **Risk & Control Matrix** -- risks mapped to assertions, controls, and test procedures
3. **Test of Controls Plan** -- procedures, sample sizes, results
4. **Deficiency Log** -- all findings with classification, root cause, remediation plan
5. **Management's Assessment** -- draft certification language
6. **Remediation Status** -- open, in progress, and closed items

## constraints

- First-year SOX requires more extensive testing -- build a conservative sample size
- Entity-level controls must be assessed before process-level controls (tone at the top)
- ITGC deficiencies can cascade -- a change management weakness affects all automated controls
- Remediation must occur before year-end for the new control to be tested
- Management cannot rely solely on auditor testing -- management must perform its own assessment
- Deficiency classification requires both quantitative and qualitative assessment
- Roll-forward testing is required if year-end is more than 3 months after interim testing
- Pre-IPO companies should begin SOX readiness 18-24 months before going public
