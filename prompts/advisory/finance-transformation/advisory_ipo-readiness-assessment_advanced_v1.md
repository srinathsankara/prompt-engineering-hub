---
title: IPO Readiness Assessment -- Financial & Governance Framework
service_line: advisory
subcategory: finance-transformation
use_case_type: assessment
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: advisory-sme
reviewer: advisory-sme
created_date: 2026-07-10
last_modified: 2026-07-15
tags: ["ipo", "capital-markets", "sec", "sarbanes-oxley", "sox", "internal-controls", "financial-reporting", "board-governance", "claude"]
test_suites: ["testing/test-cases/advisory/ipo-readiness-advanced.json"]
---

## system_prompt

I've helped companies through IPO readiness, and the ones that fail are the ones that start SOX work three months before the S-1. The real work is eighteen months of close discipline and control documentation that nobody sees until the auditors do. You have deep experience with IPO pre-readiness assessments, including Sarbanes-Oxley (SOX) 404 implementation, SEC reporting preparation, and financial system readiness evaluation.

Your IPO advisory expertise:
- SEC registration and reporting requirements (S-1, 10-K, 10-Q, 8-K, Proxy)
- SOX 404 -- management assessment and internal control over financial reporting (ICFR)
- PCAOB auditing standards applicable to issuer audits
- Nasdaq / NYSE listing standards (corporate governance, audit committee, independence)
- Financial close and reporting process optimization for public company cadence
- pre-IPO equity structure simplification (108, 409A valuations, option plan design)
- Quiet period rules, insider trading policies, Regulation FD compliance
- SPAC merger readiness (De-SPAC accounting)

## context

**Company Profile:**
- Company Name: {{company_name}}
- Industry: {{industry}}
- Revenue (last fiscal year): {{revenue_latest}}
- Revenue Growth (3-year CAGR): {{revenue_cagr}}%
- EBITDA Margin: {{ebitda_margin}}%
- Target Exchange: {{target_exchange}} (NYSE / Nasdaq / other)
- Target Market: {{target_market}} (Global Select / Global Market / Capital Market)
- Estimated Raise: {{estimated_raise}}
- Estimated Market Cap: {{estimated_market_cap}}
- Current Legal Structure: {{legal_structure}} (C corp / S corp / LLC → C corp conversion needed)
- Pre-IPO Round Investors: {{pre_ipo_investors}}
- Current Auditor: {{current_auditor}}
- Current Fiscal Year End: {{fiscal_year_end}}

## user_prompt

Perform a comprehensive IPO readiness assessment for {{company_name}}.

### Pillar 1: Financial Reporting Readiness

**SEC Reporting & GAAP Compliance:**
| Requirement | Current Status | Gap | Remediation Plan | Owner |
|------------|---------------|-----|-----------------|-------|
| GAAP-compliant financial statements (3 years audited) | {{gaap_3yr_status}} | {{gaap_3yr_gap}} | {{gaap_3yr_plan}} | {{gaap_3yr_owner}} |
| SEC S-1 filing (non-financial sections) | {{s1_status}} | {{s1_gap}} | {{s1_plan}} | {{s1_owner}} |
| Quarterly reporting cadence (10-Q) | {{q_reporting_status}} | {{q_reporting_gap}} | {{q_reporting_plan}} | {{q_reporting_owner}} |
| MD&A disclosure capability | {{mda_status}} | {{mda_gap}} | {{mda_plan}} | {{mda_owner}} |
| Segment reporting (ASC 280) | {{segment_status}} | {{segment_gap}} | {{segment_plan}} | {{segment_owner}} |
| Revenue recognition (ASC 606) compliance | {{rev_rec_status}} | {{rev_rec_gap}} | {{rev_rec_plan}} | {{rev_rec_owner}} |
| Lease accounting (ASC 842) compliance | {{lease_status}} | {{lease_gap}} | {{lease_plan}} | {{lease_owner}} |
| Business combinations (ASC 805) history | {{bus_comb_status}} | {{bus_comb_gap}} | {{bus_comb_plan}} | {{bus_comb_owner}} |
| Earnings per share (ASC 260) capability | {{eps_status}} | {{eps_gap}} | {{eps_plan}} | {{eps_owner}} |
| Stock-based compensation (ASC 718) | {{sbc_status}} | {{sbc_gap}} | {{sbc_plan}} | {{sbc_owner}} |
| Income taxes (ASC 740) -- valuation allowance, UTPs | {{tax_status}} | {{tax_gap}} | {{tax_plan}} | {{tax_owner}} |
| Related party transactions disclosure | {{rpt_status}} | {{rpt_gap}} | {{rpt_plan}} | {{rpt_owner}} |

**Financial Systems & Process:**
| Capability | Assessment | Gap | Priority |
|-----------|-----------|-----|----------|
| ERP system scalability (volume, multi-entity, multi-currency) | {{erp_status}} | {{erp_gap}} | {{erp_priority}} |
| Close cycle time (current: {{close_days}} days; target: <30) | {{close_status}} | {{close_gap}} | {{close_priority}} |
| Consolidation process (eliminations, FX translation) | {{consolidation_status}} | {{consolidation_gap}} | {{consolidation_priority}} |
| Shared service center / finance org structure | {{fss_status}} | {{fss_gap}} | {{fss_priority}} |
| Financial close checklist / SOPs | {{sop_status}} | {{sop_gap}} | {{sop_priority}} |

### Pillar 2: Internal Controls Over Financial Reporting (ICFR / SOX 404)

**Control Environment:**
| Component | Maturity | Key Findings |
|-----------|----------|-------------|
| Tone at the top / ethics / whistleblower | {{ethics_status}} | {{ethics_findings}} |
| Board and audit committee composition | {{board_status}} | {{board_findings}} |
| Organizational structure / reporting lines | {{org_status}} | {{org_findings}} |
| HR policies (competence, integrity) | {{hr_control_status}} | {{hr_control_findings}} |
| Delegation of authority matrix | {{doa_status}} | {{doa_findings}} |

**Risk Assessment:**
| Risk Area | Inherent Risk | Control Activities | Tested? |
|-----------|--------------|-------------------|---------|
| Financial statement fraud | {{fraud_risk}} | {{fraud_controls}} | {{fraud_tested}} |
| Revenue recognition | {{revenue_risk}} | {{revenue_controls}} | {{revenue_tested}} |
| IT general controls | {{itgc_risk}} | {{itgc_controls}} | {{itgc_tested}} |
| Journal entry / management override | {{je_mo_risk}} | {{je_mo_controls}} | {{je_mo_tested}} |
| Inventory / COGS completeness | {{inventory_risk}} | {{inventory_controls}} | {{inventory_tested}} |
| Tax provision / uncertain positions | {{tax_risk}} | {{tax_controls}} | {{tax_tested}} |

**IT General Controls (ITGC):**
| Domain | Current State | Gap | Remediation |
|--------|--------------|-----|-------------|
| Program development / change management | {{it_program_development}} | {{it_program_gap}} | {{it_program_plan}} |
| Access to programs and data (segregation of duties) | {{it_access}} | {{it_access_gap}} | {{it_access_plan}} |
| Computer operations / batch processing | {{it_operations}} | {{it_operations_gap}} | {{it_operations_plan}} |
| Cybersecurity program (NIST CSF, ISO 27001) | {{it_security}} | {{it_security_gap}} | {{it_security_plan}} |
| Business continuity / disaster recovery | {{it_bcp}} | {{it_bcp_gap}} | {{it_bcp_plan}} |

**Key Control Matrices:**
| Process | Entity-Level Controls | IT Application Controls | Manual Controls | Monitoring |
|---------|----------------------|----------------------|-----------------|------------|
| Order-to-cash | {{otc_elecs}} | {{otc_it_app}} | {{otc_manual}} | {{otc_monitoring}} |
| Procure-to-pay | {{ptp_elecs}} | {{ptp_it_app}} | {{ptp_manual}} | {{ptp_monitoring}} |
| Record-to-report | {{rtr_elecs}} | {{rtr_it_app}} | {{rtr_manual}} | {{rtr_monitoring}} |
| Hire-to-retire | {{htr_elecs}} | {{htr_it_app}} | {{htr_manual}} | {{htr_monitoring}} |
| Treasury | {{treasury_elecs}} | {{treasury_it_app}} | {{treasury_manual}} | {{treasury_monitoring}} |

### Pillar 3: Governance & Board Readiness

| Requirement | Current State | Target | Gap | Timeline |
|------------|--------------|--------|-----|----------|
| Independent board members (majority or supermajority) | {{board_independence_current}} | {{board_independence_target}} | {{board_independence_gap}} | {{board_independence_timeline}} |
| Audit committee (100% independent, financial expert) | {{audit_committee_current}} | {{audit_committee_target}} | {{audit_committee_gap}} | {{audit_committee_timeline}} |
| Compensation committee structure | {{comp_committee_current}} | {{comp_committee_target}} | {{comp_committee_gap}} | {{comp_committee_timeline}} |
| Nominating committee / governance committee | {{nom_committee_current}} | {{nom_committee_target}} | {{nom_committee_gap}} | {{nom_committee_timeline}} |
| Audit committee charter adoption | {{ac_charter_current}} | {{ac_charter_target}} | {{ac_charter_gap}} | {{ac_charter_timeline}} |
| Code of business conduct & ethics | {{code_conduct_current}} | {{code_conduct_target}} | {{code_conduct_gap}} | {{code_conduct_timeline}} |
| Insider trading policy | {{insider_trading_current}} | {{insider_trading_target}} | {{insider_trading_gap}} | {{insider_trading_timeline}} |
| Related party transaction policy | {{rpt_policy_current}} | {{rpt_policy_target}} | {{rpt_policy_gap}} | {{rpt_policy_timeline}} |
| Disclosure controls & procedures (DCP) | {{dcp_current}} | {{dcp_target}} | {{dcp_gap}} | {{dcp_timeline}} |
| Whistleblower / anonymous hotline | {{whistleblower_current}} | {{whistleblower_target}} | {{whistleblower_gap}} | {{whistleblower_timeline}} |
| Clawback policy (Dodd-Frank / Nasdaq/NYSE) | {{clawback_current}} | {{clawback_target}} | {{clawback_gap}} | {{clawback_timeline}} |

### Pillar 4: Capital Markets Readiness

**Equity Structure Simplification:**
| Item | Current | Recommended |
|------|---------|-------------|
| Authorized shares | {{authorized_current}} | {{authorized_recommended}} |
| Class structure (dual class, voting rights) | {{class_structure_current}} | {{class_structure_recommended}} |
| Preferred stock conversion | {{preferred_conversion_current}} | {{preferred_conversion_recommended}} |
| Warrants / convertible instruments | {{warrants_current}} | {{warrants_recommended}} |
| Option plan / equity incentive plan | {{option_plan_current}} | {{option_plan_recommended}} |
| 409A valuation status | {{409a_current}} | {{409a_recommended}} |
| Pool shares available for grant | {{pool_current}} | {{pool_recommended}} |

**Underwriter / Advisor Selection:**
| Role | Selected? | Leading Candidate |
|------|-----------|-------------------|
| Lead underwriter | {{lead_selected}} | {{lead_candidate}} |
| Co-manager(s) | {{comanager_selected}} | {{comanager_candidate}} |
| Legal counsel (issuer) | {{issuer_counsel_selected}} | {{issuer_counsel}} |
| Legal counsel (underwriters) | {{uw_counsel_selected}} | {{uw_counsel}} |
| Auditor (PCAOB-registered) | {{auditor_selected}} | {{auditor_name}} |
| Transfer agent | {{ta_selected}} | {{ta_name}} |

**Timeline to IPO (Estimated {{estimated_timeline_months}} months):**

| Phase | Months | Key Milestones |
|-------|--------|---------------|
| Pre-filing preparation | Month 1-3 | Select underwriters, audit committee, begin SOX readiness, begin S-1 draft |
| Initial filing | Month 3-4 | Submit confidential S-1 (if eligible), begin SEC review |
| SEC review | Month 4-6 | Respond to SEC comments, amend S-1 |
| Marketing & roadshow | Month 6-7 | Roadshow, book building, pricing |
| Pricing & closing | Month 7 | Price IPO, close, begin trading |
| Post-IPO quarter 1 | Month 7-10 | First 10-Q, quiet period compliance, lock-up expiration planning |

### Pillar 5: Post-IPO Compliance Roadmap

| Post-IPO Requirement | Frequency | First Due | Owner |
|---------------------|-----------|-----------|-------|
| Form 10-K (annual report) | Annual | {{first_10k}} | {{owner_10k}} |
| Form 10-Q (quarterly report) | Quarterly | {{first_10q}} | {{owner_10q}} |
| Form 8-K (current report) | As needed | -- | {{owner_8k}} |
| Proxy statement (DEF 14A) | Annual | {{first_proxy}} | {{owner_proxy}} |
| Section 16 filings (Forms 3, 4, 5) | Transaction-based | {{first_section16}} | {{owner_section16}} |
| SOX 404(a) management assessment | Annual | {{first_sox404a}} | {{owner_sox404a}} |
| SOX 404(b) auditor attestation | Annual | {{first_sox404b}} | {{owner_sox404b}} |
| Form 144 (proposed sale of restricted stock) | As needed | -- | {{owner_144}} |
| Regulation FD compliance training | Ongoing | {{reg_fd_date}} | {{owner_reg_fd}} |
| Annual shareholder meeting | Annual | {{first_annual_meeting}} | {{owner_annual_meeting}} |

## output_format

Present as an IPO readiness assessment report:
1. **Executive Summary** -- overall readiness score (RAG), timeline estimate, critical path items
2. **Financial Reporting Readiness** -- GAAP compliance, SEC reporting, close process, systems
3. **Internal Controls (SOX 404)** -- control environment, risk assessment, ITGC, key controls
4. **Governance & Board** -- independence, committee charters, policies, disclosure controls
5. **Capital Markets** -- equity structure, underwriters, timeline, 409A, lock-up
6. **Post-IPO Compliance** -- ongoing obligations checklist with owner assignments
7. **Gap Closure Roadmap** -- prioritized remediation, resource needs, estimated cost

## constraints

- JOBS Act -- EGC (emerging growth company) status provides scaled disclosure (<$1.07B revenue in most recent fiscal year) -- confidential filing, 2-year reduced SOX 404(b), 3-year reduced executive comp disclosure
- Accelerated filer and large accelerated filer thresholds trigger progressively more stringent compliance requirements
- S-1 confidential filing is available for all issuers (not just EGC) as of 2020 rule changes
- SPAC reverse merger requires additional PCAOB audit of target (traditional IPO is selling shareholders, not business combination)
- FINRA filing fees, SEC registration fees, exchange listing fees are all separate cost items
- Financial statements must comply with SEC Regulation S-X (not just ASC) -- XBRL tagging is required for S-1 and ongoing filings
- Sarbanes-Oxley Section 304 (clawback of CEO/CFO compensation) applies to all issuers -- include in equity award agreements
- Lock-up agreements (typically 180 days) restrict insider sales -- consider Rule 10b5-1 trading plan adoption
- CEO/CFO certification under SOX 302 requires quarterly sign-off -- implement DCP (disclosure controls and procedures) before filing
- PCAOB inspections apply to auditor -- ensure auditor has experience with public company audits in your industry
