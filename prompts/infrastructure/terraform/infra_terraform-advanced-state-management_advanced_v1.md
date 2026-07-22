---
title: Advanced Terraform & State Management
service_line: infrastructure
subcategory: terraform
use_case_type: architecture-design
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: devops-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["terraform", "terraform-state", "iac", "terragrunt", "policy-as-code", "sentinel", "opa", "terraform-backend", "terraform-cloud", "terraform-modules", "claude"]
test_suites: []
---

## system_prompt

I've managed Terraform at scale across multi-account, multi-region, multi-team environments. Terraform is the most widely adopted IaC tool, but most teams use it wrong -- flat directory structures, state files on local disk, no module registry, and `terraform apply` from developer laptops.

Here's what I've learned scaling Terraform:

1. **State management is the hardest problem in Terraform** -- remote state, state locking, state isolation per environment, and state migration are the things that cause production incidents. Get the state architecture right before writing any resources.
2. **Modules are your standard library** -- don't copy-paste resource blocks across projects. Build a module registry (GitHub, Terraform Cloud, or Terraform Registry) with versioned, tested modules. Service teams consume modules, not raw resources.
3. **Terragrunt solves the right problems** -- DRY configuration, environment-specific values, and state management at scale. If you have more than 5 environments or 10 projects, you need Terragrunt or a similar abstraction.
4. **Policy-as-code is not optional for multi-team Terraform** -- without Sentinel (Terraform Cloud) or OPA (open source), you can't enforce tagging standards, instance type constraints, or region restrictions. Someone will deploy a `m5.24xlarge` in `us-gov-west-1` because it's available.
5. **CI/CD for Terraform is different from CI/CD for applications** -- `terraform plan` must produce predictable output, `terraform apply` must be gated, and state locks must prevent concurrent operations. GitHub Actions, GitLab CI, and Terraform Cloud all support this, but the pipeline design differs significantly.

## context

**Organization:**
- Name: {{organization_name}}
- Current Terraform Usage: {{terraform_maturity}} (Ad-hoc / Module-based / Terragrunt / Terraform Cloud / No Terraform)
- Number of Workspaces/Projects: {{workspace_count}}
- State Backend: {{state_backend}} (S3 / GCS / Azure Storage / Terraform Cloud / Consul / Local)
- State Locking: {{state_locking}} (DynamoDB / GCS Object Lock / Azure Blob Lease / TFC built-in / None)
- Module Strategy: {{module_strategy}} (Inline modules / Git submodules / Module registry / No modules)
- Policy Tool: {{policy_tool}} (Sentinel / OPA / Checkov / Terrascan / Custom / None)
- CI/CD for Terraform: {{terraform_cicd}} (GitHub Actions / GitLab CI / Terraform Cloud / Atlantis / Jenkins / Manual)
- Cloud Providers: {{cloud_providers}} (AWS / Azure / GCP / Multi)

## user_prompt

Design a Terraform architecture and state management standard for {{organization_name}}.

### Section 1: State Architecture

**1a. State Isolation Per Environment**

| Environment | State File Location | Backend Type | Locking | Access Controls |
|---|---|---|---|---|
| **Development** | `s3://{{tf_bucket}}/dev/{{project}}/terraform.tfstate` | S3 + DynamoDB | DynamoDB table `{{tf_lock_table}}` | DevOps team + CI/CD pipeline |
| **Staging** | `s3://{{tf_bucket}}/stg/{{project}}/terraform.tfstate` | S3 + DynamoDB | DynamoDB table `{{tf_lock_table}}` | DevOps team + CI/CD pipeline |
| **Production** | `s3://{{tf_bucket}}/prod/{{project}}/terraform.tfstate` | S3 + DynamoDB | DynamoDB table `{{tf_lock_table}}` | CI/CD pipeline only (no human apply) |

**1b. State File Naming Convention**

```
s3://{{tf_backend_bucket}}/
  └── {{environment}}/
      └── {{project-name}}/
          ├── terraform.tfstate          # Primary state
          └── .terraform.tfstate.lock.info  # Lock file (DynamoDB)
```

| Project | State Key | Team |
|---|---|---|
| Shared Networking | `prod/network/terraform.tfstate` | Platform |
| EKS Cluster | `prod/cluster/terraform.tfstate` | Platform |
| Team A Microservices | `prod/team-a/terraform.tfstate` | Team A |
| Monitoring Stack | `prod/monitoring/terraform.tfstate` | Platform |

**1c. State Architecture Principles**

| Principle | Rationale | Implementation |
|---|---|---|
| **Separate state per environment** | Dev changes should not risk production | Different state files, different backends |
| **Separate state per logical component** | Reduce blast radius of state corruption | `network.tfstate`, `cluster.tfstate`, `apps.tfstate` |
| **Remote state only** | No local state files in production | Backend configured via partial config or Terragrunt |
| **State encryption at rest** | State files contain secrets | S3 SSE-S3/S3-KMS, GCS CMEK, Azure SSE |
| **State file access audit** | Who changed what, when | S3 access logs / CloudTrail |

### Section 2: Module Architecture

**2a. Module Structure**

```
terraform-modules/
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── versions.tf
│   │   ├── README.md
│   │   └── examples/
│   │       └── basic/
│   │           ├── main.tf
│   │           └── terraform.tfvars
│   ├── eks-cluster/
│   │   └── ...
│   └── ecs-service/
│       └── ...
└── modules.json                 # Module registry index
```

**2b. Module Design Standards**

| Aspect | Standard | Rationale |
|---|---|---|
| **Source** | `git::https://github.com/{{org}}/terraform-modules.git//modules/{{module_name}}?ref=v{{version}}` | Version-pinned module sources via Git tags |
| **Versioning** | Semantic versioning (SemVer 2.0) | Breaking changes require major version bumps |
| **Input Validation** | `validation { condition = ... }` blocks on all variables | Catch invalid inputs at plan time, not apply time |
| **Outputs** | All significant resource attributes exposed as outputs | Consuming modules compose outputs into new resources |
| **Testing** | Terratest or `terraform test` for all modules | Module changes must pass tests before new version tag |
| **Documentation** | `terraform-docs` auto-generated, committed to repo | Module consumers need to understand inputs and outputs |

**2c. Module Catalog (Recommended)**

| Module | Source | Latest Version | Maintainers |
|---|---|---|---|
| VPC (multi-AZ, public/private/isolated subnets) | `terraform-modules//modules/vpc` | {{vpc_module_version}} | Platform Team |
| EKS Cluster (control plane, node groups, IRSA) | `terraform-modules//modules/eks-cluster` | {{eks_module_version}} | Platform Team |
| RDS (PostgreSQL/MySQL, multi-AZ, backup) | `terraform-modules//modules/rds` | {{rds_module_version}} | Platform Team |
| S3 Bucket (encryption, versioning, logging) | `terraform-modules//modules/s3-bucket` | {{s3_module_version}} | Platform Team |
| ECS/Fargate Service | `terraform-modules//modules/ecs-service` | {{ecs_module_version}} | Platform Team |
| Monitoring (CloudWatch / Prometheus) | `terraform-modules//modules/monitoring` | {{monitoring_module_version}} | Platform Team |

### Section 3: Terragrunt Architecture

**3a. Terragrunt Directory Layout**

```
infrastructure-live/
├── terragrunt.hcl                          # Root config (remote state, provider config)
├── account.hcl                              # Account-level variables
├── region.hcl                               # Region-level variables
├── env.hcl                                  # Environment-level variables (common)
├── _envcommon/                              # Shared environment configurations
│   ├── vpc.hcl
│   └── eks.hcl
├── dev/
│   ├── terragrunt.hcl                       # Dev-specific overrides
│   ├── us-east-1/
│   │   ├── vpc/
│   │   │   └── terragrunt.hcl
│   │   ├── eks/
│   │   │   └── terragrunt.hcl
│   │   └── team-a-service/
│   │       └── terragrunt.hcl
├── stg/
│   ├── terragrunt.hcl
│   ├── us-east-1/
│   │   ├── vpc/
│   │   ├── eks/
│   │   └── team-a-service/
│   └── eu-west-1/
│       ├── vpc/
│       └── eks/
└── prod/
    ├── terragrunt.hcl
    ├── us-east-1/
    │   ├── vpc/
    │   ├── eks/
    │   └── team-a-service/
    └── eu-west-1/
        ├── vpc/
        └── eks/
```

### Section 4: Policy-as-Code

| Policy | Enforcement | Action | Implementation |
|---|---|---|---|
| **Tagging Standards** | All resources must have `Environment`, `Team`, `CostCenter` tags | Sentinel / OPA | Block apply if missing required tags |
| **Instance Type Constraints** | Only allow approved instance types | Sentinel / OPA | Allow list: {{allowed_instance_types}} |
| **Region Restrictions** | Resources allowed only in {{allowed_regions}} | Sentinel / OPA / IAM | Block resource creation in disallowed regions |
| **Encryption Required** | All storage resources must have encryption enabled | Sentinel / OPA | Block if encryption disabled |
| **Public Access Prohibited** | S3 buckets, RDS, and ELBs must not be publicly accessible | Sentinel / OPA / IAM | Block if public access enabled |
| **Cost Controls** | Maximum instance size, max provisioned IOPS | Sentinel / OPA | Block resources exceeding budget thresholds |

### Section 5: CI/CD Pipeline

| Stage | Tool | Action | Gating |
|---|---|---|---|
| **Format** | `terraform fmt -check` | Validate formatting | All files must be formatted |
| **Validate** | `terraform validate` | Validate configuration syntax | Valid config |
| **Lint** | `tflint` | Catch anti-patterns, deprecated arguments | No errors |
| **Security Scan** | `checkov` / `tfsec` | Scan for security misconfigurations | No HIGH or CRITICAL findings |
| **Plan** | `terraform plan -out=tfplan` | Generate execution plan | Plan output reviewed (manual for prod) |
| **Cost Estimation** | `infracost` | Show cost impact of changes | {{cost_threshold}} budget alert threshold |
| **Apply** | `terraform apply tfplan` | Apply changes | Manual approval for staging and production |
| **Post-Apply Validation** | Custom smoke tests | Verify resources are operational | All smoke tests pass |

## output_format

Present as a Terraform Architecture & State Management Standard:

1. **Executive Summary** -- current IaC maturity, state architecture decisions, module strategy, policy requirements
2. **State Architecture** -- environment isolation, naming conventions, backend configuration, encryption, access controls
3. **Module Design Standards** -- structure, versioning, input validation, testing, documentation, module registry
4. **Terragrunt Architecture** -- directory layout, DRY configuration, dependency management, state management at scale
5. **Policy-as-Code** -- tagging, security, cost, region enforcement policies with Sentinel or OPA
6. **CI/CD Pipeline** -- pipeline stages, quality gates, approval workflows, plan output review, apply gating
7. **Migration Guide** -- from ad-hoc Terraform to standardized modules and Terragrunt, state migration procedure
8. **Operational Runbook** -- state recovery, state migration, module deprecation, Terraform version upgrades

## constraints

- State files must never be stored locally -- all state must use remote backends with locking
- State file access must be restricted to CI/CD pipelines and authorized operators -- no direct state file editing
- Module sources must pin versions via Git tags -- `ref=v1.2.3`, never `ref=main` or `ref=develop`
- Breaking changes in modules require a major version bump per SemVer -- minor and patch versions should be backward-compatible
- `terraform destroy` in production requires a separate approval workflow -- accidental destruction of production is a real risk
- State locking (DynamoDB, GCS, Azure Blob Lease) must be enabled for all operations -- concurrent `terraform apply` without locking causes state corruption
- Policy-as-code (Sentinel or OPA) must enforce at minimum: tagging standards, encryption requirements, and region restrictions
- `terraform plan` output must be reviewed by a human for production applies -- automated applies are acceptable for ephemeral environments only
- Sensitive output values must be marked as `sensitive = true` in the module outputs -- Terraform logs plan details to stdout, which can leak secrets
- Terraform version upgrades must be coordinated across all workspaces -- different Terraform versions can produce different plan results
- State files should be inspected for secrets regularly -- if a secret ends up in state, it must be rotated and the state must be re-encrypted or migrated
- Backend configuration should use partial configuration (backend config file or Terragrunt) -- hardcoded backend config in `main.tf` prevents reusing the same code across environments
