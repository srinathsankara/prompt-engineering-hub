---
title: SOC 2 Report Drafting & Readiness Assessment
service_line: assurance
subcategory: soc-reporting
use_case_type: drafting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: assurance-sme
reviewer: risk-sme
created_date: 2026-05-10
last_modified: 2026-06-14
tags: ["soc-2", "aicpa", "trust-services", "security", "availability", "confidentiality", "claude"]
test_suites: ["testing/test-cases/assurance/soc2-report.json"]
---

## system_prompt

I've performed SOC 2 examinations for SaaS, technology, financial services, and healthcare companies. I know the AICPA Trust Services Criteria, SAS 136/148, and SOC 2 examination standards inside out. The key thing most teams miss: SOC 2 is about what you *actually do*, not what you *say you do*.

My approach:
1. Understand the service organization's system and commitments
2. Identify applicable Trust Services Criteria (Security, Availability, Processing Integrity, Confidentiality, Privacy)
3. Evaluate control design and operating effectiveness
4. Draft the description of the system
5. Document controls and test procedures
6. Form the opinion

## context

**Service Organization:**
- Name: {{org_name}}
- Services: {{services_description}}
- Type: {{org_type}} (SaaS / data center / BPO / financial services / healthcare)
- SOC 2 History: {{soc_history}} (first-time / repeat / bridge letter)

**Scope of Examination:**
- Reporting Period: {{reporting_period}}
- System Boundary: {{system_boundary}}
- Trust Services Criteria in Scope: {{tsc_in_scope}} (e.g., Security, Availability, Confidentiality)
- Complementary User Entity Controls (CUECs): {{cuecs}} (list applicable)
- Complementary Subservice Organization Controls (CSOCs): {{csocs}} (list applicable)
- Type of Report: {{report_type}} (Type I / Type II)

## user_prompt

Guide me through drafting the SOC 2 report for {{org_name}}.

### Section 1: System Description

Draft the system description covering:

**A. Services Provided**
- {{service_1}} -- {{desc_1}}
- {{service_2}} -- {{desc_2}}
- {{service_3}} -- {{desc_3}}

**B. Infrastructure**
- Physical environment: {{physical_infrastructure}} (data centers, colocation, cloud providers)
- Technology stack: {{technology_stack}} (hardware, software, databases, network)
- Cloud infrastructure: {{cloud_infrastructure}} (AWS/Azure/GCP regions, shared responsibility model)

**C. Software**
- Core application systems: {{core_applications}}
- Supporting software: {{supporting_software}} (monitoring, logging, CI/CD, IAM)
- Version control and deployment: {{devops_tools}}

**D. People**
- Organizational structure: {{org_chart_summary}}
- Roles and responsibilities: {{key_roles}} (CISO, SOC manager, DevSecOps, IAM team)
- Background checks and training: {{hr_controls}}

**E. Data and Information**
- Data classification: {{data_classification}}
- Data flows: {{data_flows}} (diagram description: ingestion → processing → storage → transmission)
- Encryption standards: {{encryption_standards}} (at rest: AES-256, in transit: TLS 1.2+)
- Retention and disposal: {{retention_policy}}

**F. Risk Assessment Process**
- Risk assessment methodology: {{risk_methodology}} (NIST CSF / ISO 27001 / COSO)
- Frequency: {{risk_frequency}} (quarterly / annually / continuous)
- Key risks identified in period: {{key_risks}}

### Section 2: Control Descriptions

For each Trust Services Criteria, draft the controls:

**Security -- CC1.x (Control Environment)**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| CC1.1 | {{control_description}} | {{owner}} | {{frequency}} | {{evidence}} |
| CC1.2 | {{control_description}} | {{owner}} | {{frequency}} | {{evidence}} |

**Security -- CC2.x (Communication and Information)**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| CC2.1 | {{control_description}} | {{owner}} | {{frequency}} | {{evidence}} |

**Security -- CC3.x (Risk Assessment)**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| CC3.1 | {{control_description}} | {{owner}} | {{frequency}} | {{evidence}} |

**Security -- CC4.x (Monitoring Activities)**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| CC4.1 | System monitoring alerts on {{monitored_events}} | {{owner}} | {{frequency}} | {{evidence}} |
| CC4.2 | Vulnerability scanning of {{scan_scope}} | {{owner}} | {{frequency}} | {{evidence}} |

**Security -- CC5.x (Control Activities)**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| CC5.1 | Change management process for {{change_scope}} | {{owner}} | {{frequency}} | {{evidence}} |
| CC5.2 | Access provisioning and deprovisioning for {{access_scope}} | {{owner}} | {{frequency}} | {{evidence}} |
| CC5.3 | Logical access controls: MFA, segregation of duties, least privilege | {{owner}} | {{frequency}} | {{evidence}} |

**Availability -- A1.x**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| A1.1 | {{availability_control_desc}} | {{owner}} | {{frequency}} | {{evidence}} |
| A1.2 | {{capacity_management_desc}} | {{owner}} | {{frequency}} | {{evidence}} |

**Confidentiality -- C1.x**
| Control ID | Control Description | Owner | Frequency | Evidence |
|------------|-------------------|-------|-----------|----------|
| C1.1 | {{confidentiality_control_desc}} | {{owner}} | {{frequency}} | {{evidence}} |
| C1.2 | {{data_classification_control_desc}} | {{owner}} | {{frequency}} | {{evidence}} |

### Section 3: Test of Controls Design

For each control, draft the test procedure:

| Control ID | Control Description | Test Procedure | Sample Size | Results |
|------------|-------------------|----------------|-------------|---------|
| CC5.2 | Access reviews performed quarterly | Inspect access review documentation for {{num_reviews}} quarterly periods. Verify: (1) review completed on time, (2) all systems covered, (3) action items resolved | 4 quarters | {{test_result}} |
| CC5.1 | Change management requires approval | Inspect {{num_changes}} changes in the period. Verify: (1) change request exists, (2) peer review completed, (3) approval recorded, (4) testing documented | {{sample_size}} | {{test_result}} |

### Section 4: Complementary Controls

**Complementary User Entity Controls (CUECs):**
| CUEC | User Entity Responsibility | Recommended Language |
|------|---------------------------|---------------------|
| {{cuec_1}} | {{user_responsibility_1}} | {{cuec_language_1}} |
| {{cuec_2}} | {{user_responsibility_2}} | {{cuec_language_2}} |

**Complementary Subservice Organization Controls (CSOCs):**
| Subservice Organization | Services Provided | Type of Report | Applicable Controls |
|------------------------|------------------|----------------|-------------------|
| {{sub_org_1}} | {{sub_services_1}} | {{sub_report_type_1}} | {{sub_controls_1}} |

### Section 5: Management Assertion & Practitioner Opinion

**Management Assertion:**
{{management_assertion_draft}}

**Practitioner Opinion:**
{{practitioner_opinion_draft}} -- (Unmodified / Qualified / Adverse / Disclaimer)

## output_format

Present as a structured SOC 2 report framework:
1. **System Description** -- narrative and diagram description
2. **Control Matrix** -- Trust Services Criteria mapped to controls
3. **Test of Controls** -- procedures and results by control
4. **CUEC and CSOC Language** -- complementary controls
5. **Management Assertion** -- draft language
6. **Practitioner Opinion** -- draft opinion paragraph
7. **Gap Assessment** -- design or operating effectiveness gaps identified
8. **Remediation Roadmap** -- recommendations to close gaps before Type II

## constraints

- SOC 2 Type I = design effectiveness only (point-in-time); Type II = design + operating effectiveness (12-month period)
- Type II requires continuous testing across the entire reporting period -- not just a sample month
- Evidence must be retained for each test -- opinion letters without evidence files are insufficient
- Carve-out vs inclusive method for subservice organizations must be stated clearly in the system description
- CUECs must be communicated to user entities in the report -- missing CUECs can cause scope gaps
- System boundaries must be updated each year -- scope creep is common
