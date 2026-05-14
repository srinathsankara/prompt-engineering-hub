---
title: Developer Platform & Paved Road Design -- Internal Developer Platforms
service_line: architecture
subcategory: developer-platform
use_case_type: planning
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["developer-platform", "paved-road", "internal-developer-platform", "idp", "developer-experience", "platform-engineering", "backstage", "claude"]
test_suites: []
---

## system_prompt

I built and deployed a paved-road developer platform used by 12 engineering teams. It cut onboarding effort by 50% and improved deployment consistency by 35%. Here's what I learned: a developer platform is not a collection of tools. It's a product. Your internal developers choose to use it because it makes them faster -- or they bypass it entirely if it doesn't.

My design philosophy:

**The platform is a product.** It has users, a backlog, a roadmap, and an SLO. If you're treating it as an infrastructure project, developers will treat it as something to work around.

**Paved roads, not walls.** Provide a well-supported path that handles 80% of use cases. The remaining 20% can go off-road, but they own the support burden. Don't block them -- just make the default path so good they don't want to leave it.

**Golden paths reduce cognitive load.** Every decision the platform makes for the developer (CI/CD, monitoring, secrets, networking) is one less thing they need to think about. That's the whole point.

**Abstract complexity, don't hide it.** Developers need to understand the architecture underneath, even if they interact through a self-service portal. A black box that breaks and nobody can debug is worse than no platform at all.

**API-first, GUI-second.** Everything the platform does should be callable through an API. GUIs are convenience layers. If your platform only works through a web UI, it's not a platform -- it's a tool.

## context

- Organization: {{organization}}
- Engineering Teams: {{team_count}} teams
- Developers Served: {{developer_count}} developers
- Current Onboarding Time: {{current_onboarding}} days
- Current Deploy Frequency: {{current_deploy_frequency}}
- Target Deploy Frequency: {{target_deploy_frequency}}
- Primary Languages / Runtimes: {{primary_languages}}
- Cloud Provider(s): {{cloud_providers}}

## user_prompt

Design a paved-road developer platform for {{organization}}.

### Platform Vision

**Platform Mission Statement (one sentence):**
{{platform_mission}}

**Key Outcomes (what success looks like after 12 months):**
| Outcome | Current Baseline | 12-Month Target | Measurement |
|:--------|:---------------:|:---------------:|:-----------|
| Onboarding Time | {{onboard_baseline}} days | {{onboard_target}} days | {{onboard_measure}} |
| Deploy Frequency | {{deploy_baseline}} | {{deploy_target}} | {{deploy_measure}} |
| Time from Commit to Production | {{commit_baseline}} | {{commit_target}} | {{commit_measure}} |
| Developer Satisfaction | {{satisfaction_baseline}}/10 | {{satisfaction_target}}/10 | {{satisfaction_measure}} |
| Mean Time to Recover | {{mttr_baseline}} | {{mttr_target}} | {{mttr_measure}} |
| Change Failure Rate | {{cfr_baseline}}% | {{cfr_target}}% | {{cfr_measure}} |

### Platform Capabilities

| Capability | Current State | Target State | Priority | Dependencies |
|:-----------|:-------------|:-------------|:--------:|:------------|
| Development Environment Provisioning | {{dev_env_current}} | {{dev_env_target}} | {{dev_env_priority}} | {{dev_env_deps}} |
| CI/CD Pipeline Templates | {{cicd_current}} | {{cicd_target}} | {{cicd_priority}} | {{cicd_deps}} |
| Deployment / Release Management | {{deploy_current}} | {{deploy_target}} | {{deploy_priority}} | {{deploy_deps}} |
| Observability (logs, metrics, traces) | {{observability_current}} | {{observability_target}} | {{observability_priority}} | {{observability_deps}} |
| Secrets & Configuration Management | {{secrets_current}} | {{secrets_target}} | {{secrets_priority}} | {{secrets_deps}} |
| Service Catalog / Discovery | {{catalog_current}} | {{catalog_target}} | {{catalog_priority}} | {{catalog_deps}} |
| Access Control & Permissions | {{access_current}} | {{access_target}} | {{access_priority}} | {{access_deps}} |
| Cost Visibility (per team/service) | {{cost_current}} | {{cost_target}} | {{cost_priority}} | {{cost_deps}} |

### Architecture

**Platform Stack:**
| Layer | Technology | Rationale | Operational Owner |
|:------|:-----------|:----------|:----------------:|
| Developer Portal / Frontend | {{portal_tech}} | {{portal_rationale}} | {{portal_owner}} |
| CI/CD Engine | {{cicd_tech}} | {{cicd_rationale}} | {{cicd_owner}} |
| Service Catalog | {{catalog_tech}} | {{catalog_rationale}} | {{catalog_owner}} |
| Observability Backend | {{observability_tech}} | {{observability_rationale}} | {{observability_owner}} |
| Secrets Management | {{secrets_tech}} | {{secrets_rationale}} | {{secrets_owner}} |
| IaC / Provisioning | {{iac_tech}} | {{iac_rationale}} | {{iac_owner}} |
| Container / Runtime | {{runtime_tech}} | {{runtime_rationale}} | {{runtime_owner}} |

**Golden Path Templates:**
| Template | Language/Runtime | Services Architecture | Storage | CI/CD Pattern | Monitoring |
|:---------|:---------------:|:--------------------:|:-------:|:------------:|:---------:|
| {{template_1_name}} | {{template_1_lang}} | {{template_1_arch}} | {{template_1_storage}} | {{template_1_cicd}} | {{template_1_mon}} |
| {{template_2_name}} | {{template_2_lang}} | {{template_2_arch}} | {{template_2_storage}} | {{template_2_cicd}} | {{template_2_mon}} |
| {{template_3_name}} | {{template_3_lang}} | {{template_3_arch}} | {{template_3_storage}} | {{template_3_cicd}} | {{template_3_mon}} |

### Self-Service Workflows

| Developer Action | Current Process (manual steps) | Platform-Enabled (time) | Adoption Target |
|:----------------|:------------------------------:|:----------------------:|:--------------:|
| Create new service | {{workflow_new_service_current}} | {{workflow_new_service_platform}} | {{workflow_new_service_adoption}} |
| Add environment | {{workflow_add_env_current}} | {{workflow_add_env_platform}} | {{workflow_add_env_adoption}} |
| Deploy to production | {{workflow_deploy_current}} | {{workflow_deploy_platform}} | {{workflow_deploy_adoption}} |
| Rotate secrets | {{workflow_rotate_current}} | {{workflow_rotate_platform}} | {{workflow_rotate_adoption}} |
| Grant access | {{workflow_access_current}} | {{workflow_access_platform}} | {{workflow_access_adoption}} |
| Request resources | {{workflow_request_current}} | {{workflow_request_platform}} | {{workflow_request_adoption}} |

### Platform Team Structure

| Role | Responsibilities | Staffing (FTE) | Skills Required |
|:-----|:---------------|:--------------:|:---------------|
| Platform Product Manager | {{pm_responsibilities}} | {{pm_staffing}} | {{pm_skills}} |
| Platform Engineer | {{pe_responsibilities}} | {{pe_staffing}} | {{pe_skills}} |
| SRE / Reliability Engineer | {{sre_responsibilities}} | {{sre_staffing}} | {{sre_skills}} |
| Developer Advocate | {{da_responsibilities}} | {{da_staffing}} | {{da_skills}} |

### Adoption & Migration Plan

| Phase | Capabilities | Teams Enabled | Timeline | Success Metric |
|:-----:|:------------|:------------:|:--------:|:--------------|
| 1 -- Foundation | {{phase_1_capabilities}} | {{phase_1_teams}} | {{phase_1_timeline}} | {{phase_1_metric}} |
| 2 -- Core | {{phase_2_capabilities}} | {{phase_2_teams}} | {{phase_2_timeline}} | {{phase_2_metric}} |
| 3 -- Scale | {{phase_3_capabilities}} | {{phase_3_teams}} | {{phase_3_timeline}} | {{phase_3_metric}} |
| 4 -- Optimize | {{phase_4_capabilities}} | {{phase_4_teams}} | {{phase_4_timeline}} | {{phase_4_metric}} |

## output_format

Present as a developer platform design: 1. Platform Vision with Quantified Outcomes, 2. Capability Matrix (current vs. target, prioritized), 3. Platform Architecture (technology stack per layer), 4. Golden Path Templates by language/runtime, 5. Self-Service Workflow Automation (before/after times), 6. Platform Team Structure, 7. Phased Adoption & Migration Plan.

## constraints

- The platform team should not exceed 1 platform engineer per 10-15 application developers -- beyond that ratio, the platform team becomes a bottleneck rather than an accelerator
- Golden paths should cover the most common 3-4 service archetypes (e.g., REST API, event processor, web frontend, batch job) -- do not try to template every possible service type
- Self-service must come before platform adoption -- if developers need to file a ticket to use the platform, they will go back to doing it themselves
- Backstage (Spotify) is the most widely adopted developer portal -- evaluate it first before considering custom solutions, but only if you have the engineering bandwidth to maintain the plugin ecosystem
- Platform observability (is the platform healthy?) is separate from application observability (are the apps healthy?) -- instrument both independently
- Every golden path must include built-in observability (logs, metrics, traces) -- developers should not need to instrument their application to see how it is performing in production
- The platform must have a defined SLO and error budget, just like any other production service -- if the platform is down, developers cannot deploy, and that is a Sev1 incident
- Developer adoption should be measured, not assumed -- track percentage of services using golden paths, onboarding time reduction, and NPS
- Platform engineering should follow the same CI/CD practices it provides to developers -- dogfooding is the most effective quality signal
- Do not build a custom service catalog from scratch -- use a proven open-source or commercial product (Backstage, OpsLevel, Cortex) and customize only what differentiates your platform
- The paved road should include security and compliance controls by default -- developers should not need to think about encryption, network policies, or vulnerability scanning for standard service types
- Governance boundaries (environments, approvals, audit trails) should be configurable per workload criticality tier -- the same pipeline that deploys a low-risk internal tool should not block on approvals required for a production customer-facing system
