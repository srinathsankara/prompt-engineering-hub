---
title: Cloud-Native Paved Road Engineering -- Kubernetes, Terraform & Push-Left Security
service_line: digital-workplace
subcategory: paved-road
use_case_type: planning
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: Srinath Sankara
reviewer: Srinath Sankara
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["paved-road", "kubernetes", "eks", "aks", "gke", "terraform", "aws", "azure", "gcp", "push-left", "wiz", "snyk", "prisma-cloud", "claude"]
test_suites: []
---

## system_prompt

I've architected paved-road platforms using Kubernetes (EKS/AKS/GKE), Terraform, and multi-cloud patterns. The goal: give developers and IT teams a well-supported path that handles 80% of use cases so they can move fast without having to become infrastructure experts.

Push-left security is how I keep those roads safe. Instead of scanning for vulnerabilities after deployment, I embed security into every stage of the pipeline: IaC scanning before apply, container scanning before registry push, admission controls before pod scheduling, runtime monitoring after deployment. Wiz, Snyk, and Prisma Cloud are my tools, but the principle is more important than any tool -- find the problem before it reaches production.

Kubernetes is not the goal. It's the substrate. The paved road abstracts the complexity of K8s so that a developer deploying a service doesn't need to think about PodDisruptionBudgets, HorizontalPodAutoscalers, or NetworkPolicies -- they just pick their resource requirements and the platform handles the rest. If your paved road requires developers to understand Kubernetes concepts, it's not paved enough.

## context

- Organization: {{organization}}
- Cloud Provider(s): {{cloud_providers}} (AWS / Azure / GCP / multi-cloud)
- Current Container Platform: {{container_platform}} (EKS / AKS / GKE / OpenShift / self-managed / none)
- IaC Tool: {{iac_tool}} (Terraform / Pulumi / CloudFormation / ARM / Bicep)
- Current Security Tools: {{security_tools}} (Wiz / Snyk / Prisma Cloud / Aqua / Twistlock / none)
- Developer Teams Served: {{developer_teams}} teams
- Current Deploy Frequency: {{deploy_frequency}} deploys/week
- Current Environment Count: {{environment_count}} (dev/staging/prod)

## user_prompt

Design a cloud-native paved road platform for {{organization}}.

### Platform Architecture

| Component | Technology | Purpose | Operational Owner |
|:----------|:----------|:--------|:----------------:|
| Container Orchestration | {{k8s_tech}} | {{k8s_purpose}} | {{k8s_owner}} |
| CI/CD Pipeline | {{cicd_tech}} | {{cicd_purpose}} | {{cicd_owner}} |
| IaC Provisioning | {{iac_tech}} | {{iac_purpose}} | {{iac_owner}} |
| Secret Management | {{secrets_tech}} | {{secrets_purpose}} | {{secrets_owner}} |
| Container Registry | {{registry_tech}} | {{registry_purpose}} | {{registry_owner}} |
| Service Mesh | {{mesh_tech}} | {{mesh_purpose}} | {{mesh_owner}} |
| Observability | {{observability_tech}} | {{observability_purpose}} | {{observability_owner}} |
| Ingress / API Gateway | {{ingress_tech}} | {{ingress_purpose}} | {{ingress_owner}} |

### Push-Left Security Pipeline

| Stage | Scan Type | Tool | Blocking? | Remediation Path |
|:-----:|:---------:|:----:|:--------:|:--------------:|
| Code Commit | {{commit_scan}} | {{commit_tool}} | {{commit_blocking}} | {{commit_remediation}} |
| IaC Plan | {{iac_scan}} | {{iac_tool}} | {{iac_blocking}} | {{iac_remediation}} |
| Build | {{build_scan}} | {{build_tool}} | {{build_blocking}} | {{build_remediation}} |
| Container Registry | {{registry_scan}} | {{registry_tool}} | {{registry_blocking}} | {{registry_remediation}} |
| Admission | {{admission_scan}} | {{admission_tool}} | {{admission_blocking}} | {{admission_remediation}} |
| Runtime | {{runtime_scan}} | {{runtime_tool}} | {{runtime_blocking}} | {{runtime_remediation}} |

### Golden Path Templates

| Template | Runtime | Database | CI/CD Pipeline | Observability | Scaling |
|:---------|:-------:|:-------:|:-------------:|:------------:|:------:|
| {{template_1_name}} | {{template_1_runtime}} | {{template_1_db}} | {{template_1_cicd}} | {{template_1_obs}} | {{template_1_scaling}} |
| {{template_2_name}} | {{template_2_runtime}} | {{template_2_db}} | {{template_2_cicd}} | {{template_2_obs}} | {{template_2_scaling}} |
| {{template_3_name}} | {{template_3_runtime}} | {{template_3_db}} | {{template_3_cicd}} | {{template_3_obs}} | {{template_3_scaling}} |

### Multi-Cloud Strategy

| Workload | Primary Cloud | DR Cloud | Replication Strategy | Failover RTO |
|:---------|:-----------:|:-------:|:-------------------:|:----------:|
| {{workload_1}} | {{primary_1}} | {{dr_1}} | {{replication_1}} | {{failover_rto_1}} |
| {{workload_2}} | {{primary_2}} | {{dr_2}} | {{replication_2}} | {{failover_rto_2}} |
| {{workload_3}} | {{primary_3}} | {{dr_3}} | {{replication_3}} | {{failover_rto_3}} |

### Governance & Guardrails

| Guardrail | Policy | Enforcement Mode | Exception Process |
|:----------|:-------|:---------------:|:----------------:|
| Resource Limits | {{resource_policy}} | {{resource_mode}} | {{resource_exception}} |
| Network Policies | {{network_policy}} | {{network_mode}} | {{network_exception}} |
| Container Security | {{container_policy}} | {{container_mode}} | {{container_exception}} |
| Cost Budgets | {{cost_policy}} | {{cost_mode}} | {{cost_exception}} |
| Data Residency | {{data_policy}} | {{data_mode}} | {{data_exception}} |

## output_format

Present as a cloud-native paved road platform design: 1. Platform Architecture (components, technologies, ownership), 2. Push-Left Security Pipeline (scan stages, tools, blocking vs advisory), 3. Golden Path Templates (runtimes, databases, CI/CD), 4. Multi-Cloud Strategy, 5. Governance & Guardrails, 6. Platform Adoption Plan (onboard teams, measure success).

## constraints

- A paved road should handle 80% of use cases out of the box. The remaining 20% can go off-road, but they own the support burden. The paved road is not a wall.
- Golden paths should not require developers to understand Kubernetes. If a developer needs to know what a PodDisruptionBudget is, the abstraction is leaking.
- Push-left security means: the vulnerability is found and fixed before it reaches production, not scanned for after deployment. Block critical and high findings at the CI/CD stage.
- Container images should be rebuilt and rescanned on a regular cadence (weekly minimum), not just on change. New CVEs are discovered daily -- yesterday's clean scan is not today's clean scan.
- Every paved road component must be deployable via IaC. If someone has to click a button in a cloud console to provision infrastructure, that component is not part of the paved road.
- The platform should have its own SLO and error budget. If the platform is down, developers can't deploy -- and that's a Sev1 incident for the platform team.
- Developer adoption of the paved road should be measured by percentage of services using golden paths, not by how many developers attended the training session.
- Multi-cloud should be a deliberate choice, not a default. Multi-cloud adds significant complexity. Use it for specific reasons (compliance, provider resilience, best-of-breed services), not because it sounds impressive.
- The platform team should not exceed 1 engineer per 10-15 developers. Beyond that ratio, the platform becomes a bottleneck instead of an accelerator.
- Service mesh (Istio, Linkerd) should be evaluated for need before adoption. Many organizations don't need a service mesh -- they need better observability and simpler networking. Don't add complexity you don't need.