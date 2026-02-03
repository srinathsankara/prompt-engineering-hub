---
title: Forensic & Dispute Advisory -- Damages, Valuation & Expert Testimony
service_line: transactions
subcategory: forensic-dispute
use_case_type: investigation
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: transactions-sme
reviewer: transactions-sme
created_date: 2026-07-22
last_modified: 2026-07-23
tags: ["forensic", "dispute", "damages", "expert-witness", "litigation", "arbitration", "lost-profits", "claude"]
test_suites: []
---

## system_prompt

I'm a . You have experience providing expert testimony in deposition and trial settings.

## context

- Engagement Type: {{engagement_type}} (damages analysis / valuation for litigation / lost profits / shareholder dispute / IP infringement / breach of contract / matrimonial)
- Retaining Party: {{retaining_party}} (plaintiff / defendant / neutral)
- Case: {{case_name}}
- Venue: {{venue}} (federal court / state court / arbitration / mediation)
- Opposing Expert: {{opposing_expert}} (name / firm)
- Trial Date: {{trial_date}}

## user_prompt

Develop a damages or valuation analysis for {{engagement_type}} in {{case_name}}.

### Engagement Scope

| Issue | Methodology | Data Required | Opposing Position | Key Assumptions |
|-------|:-----------:|:-------------:|:-----------------:|:---------------:|
| {{issue_1}} | {{methodology_1}} | {{data_1}} | {{opposing_1}} | {{assumptions_1}} |
| {{issue_2}} | {{methodology_2}} | {{data_2}} | {{opposing_2}} | {{assumptions_2}} |

### Damages Calculation

| Damages Component | Period | Calculation | Amount | Assumptions |
|:-----------------:|:-----:|:-----------:|:------:|:-----------:|
| Lost Revenue / Profits | {{period_1}} | {{calc_1}} | {{amount_1}} | {{assumptions_damages_1}} |
| Incremental Costs Saved | {{period_2}} | {{calc_2}} | {{amount_2}} | {{assumptions_damages_2}} |
| Pre-judgment Interest | {{period_pj}} | {{calc_pj}} | {{amount_pj}} | {{rate_pj}}% |
| **Total Damages** | | | **{{total_damages}}** | |

### Expert Report Checklist

| Requirement | Status | Notes |
|-------------|:------:|-------|
| Complete factual basis and data considered | {{factual_basis_status}} | {{factual_basis_notes}} |
| Methodology explained and justified | {{methodology_status}} | {{methodology_notes}} |
| Exhibits attached supporting calculations | {{exhibits_status}} | {{exhibits_notes}} |
| Qualifications and prior testimony (Rule 26) | {{qualifications_status}} | {{qualifications_notes}} |
| Reports and compensation from prior 4 years (Rule 26) | {{prior_reports_status}} | {{prior_reports_notes}} |
| Daubert / Frye admissibility assessment | {{daubert_status}} | {{daubert_notes}} |
| Deposition preparation and mock cross-examination | {{deposition_status}} | {{deposition_notes}} |

## output_format

Present as a forensic dispute analysis: 1. Engagement Scope & Methodology, 2. Damages / Valuation Calculation, 3. Sensitivity Analysis on Key Assumptions, 4. Opposing Expert Analysis, 5. Expert Report Checklist, 6. Trial / Deposition Preparation Plan.

## constraints

- Federal Rule 26(a)(2)(B) expert reports must contain complete statement of opinions, basis, data considered, exhibits, qualifications, prior 4 years of testimony, and compensation
- Daubert standard (federal): expert testimony must be based on sufficient facts, reliable principles, and reliably applied to the case
- Lost profits must be proven with reasonable certainty -- speculative or conjectural damages are excluded
- The but-for world (revenues/incomes but-for the alleged harm) must be constructed with economic and industry evidence
- Prejudgment interest: generally calculated from the date of harm to the date of judgment -- rates vary by jurisdiction
- Expert independence: the expert's role is to assist the trier of fact, not to advocate for the retaining party
- Work product: communications with counsel are generally protected, but all data, assumptions, and calculations provided to the expert are discoverable
- Expert voir dire: qualifications, methodology, and potential bias are all subject to challenge before the expert may testify
- Hearsay rules: experts may rely on otherwise inadmissible evidence if it is of the type reasonably relied on in their field (Rule 703)
- Settlement vs. trial considerations: expert analyses prepared for settlement discussions may need to differ from trial-ready reports
