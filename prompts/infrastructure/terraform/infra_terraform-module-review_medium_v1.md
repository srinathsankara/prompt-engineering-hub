---
title: Terraform Module Design & Code Review
service_line: infrastructure
subcategory: terraform
use_case_type: review
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: platform-lead
created_date: 2026-04-15
last_modified: 2026-06-10
tags: ["terraform", "iac", "code-review", "aws", "azure", "claude"]
test_suites: ["testing/test-cases/infrastructure/terraform-review.json"]
---

## system_prompt

I've reviewed 1000+ Terraform modules across AWS and Azure over the years. The same issues show up every time: state management mistakes, security holes, and modules that work for one use case but break for anything else. Here's what I check:

- **Idempotency** -- does this module produce the same result on every apply? If not, it's broken.
- **Security** -- any secrets exposed? Network locked down? IAM permissions least-privilege?
- **Scalability** -- can this handle N instances without modification or does it hardcode everything?
- **Maintainability** -- is it reusable? Are variables well-named? Is the structure clear?
- **State Safety** -- will this change cause state drift or data loss?

## context

**Module Info:**
- Module Name: {{module_name}}
- Provider: {{provider}} (AWS / Azure / GCP)
- Source: {{source_repo}}/{{module_path}}
- Terraform Version: {{terraform_version}}
- Provider Version: {{provider_version}}
- Current Usage Count: {{usage_count}} environments

**Module Purpose:** {{module_purpose}}

**Code Snippet to Review:**

```hcl
{{terraform_code}}
```

## user_prompt

Review this Terraform module using the firm's standards.

### 1. Structure & Organization

Check these structural elements:
- Does the module follow the standard layout? (`main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`, `README.md`)
- Are `locals` used for derived values? Are they documented?
- Are outputs useful for consumers or just echoing inputs?
- Is `terraform-docs` being used to generate documentation?

### 2. Variables & Inputs

Review variables against these standards:

```hcl
variable "example" {
  description = "Clear description of what this variable controls"
  type        = string
  default     = "default-value"  # sensible default where appropriate
  validation {
    condition     = can(regex("^[a-z]", var.example))
    error_message = "Must start with lowercase letter."
  }
}
```

- Are required variables distinguished from optional ones? (no default = required)
- Are validation blocks enforcing business rules?
- Are types specific? (Avoid `any` -- use `string`, `number`, `list(string)`, `map(string)`, `object({})`)
- Are sensitive variables marked `sensitive = true`?
- Are variable naming conventions consistent? (`snake_case`)

### 3. Resource Configuration

For resources, check:
- Hardcoded values that should be variables: {{hardcoded_values}}
- Missing tags block (all resources must have `Environment`, `Service`, `Owner`, `ManagedBy`)
- Missing `prevent_destroy` lifecycle on critical resources (databases, state buckets, KMS keys)
- Using deprecated arguments or provider versions
- Missing `depends_on` where implicit dependencies aren't enough

### 4. Security Review

Flag each issue by severity (Critical / High / Medium / Low):

- **Public exposure:** `cidr_blocks = ["0.0.0.0/0"]` in security groups? `publicly_accessible = true` on RDS?
- **Secrets in plaintext:** Any hardcoded passwords, access keys, or connection strings?
- **IAM over-permission:** Using `*` in IAM policy resources or actions?
- **Encryption:** Is encryption at rest disabled? Is TLS disabled or using old versions?
- **Logging:** Are audit logs disabled? Is access logging off?

### 5. State & Backend

- Does the module use `terraform_remote_state` to read from other stacks? If yes, are the outputs specific or entire state?
- Are there any `force_unlock` or state-modifying operations without safeguards?
- Does the module work with workspaces?

### 6. Provider-Specific Checks

**AWS:**
- VPC/Subnet tags for cluster auto-discovery?
- S3 bucket ACLs vs bucket policies?
- RDS deletion protection enabled?

**Azure:**
- Resource group naming convention?
- Azure Policy exemptions rather than exclusions?
- Network Security Group rules properly scoped?

### 7. Output Summary

Rate the module: (PASS / PASS-WITH-COMMENTS / FAIL)

Provide:
1. **Critical issues** (must fix before merge)
2. **Recommendations** (should fix but not blocking)
3. **Best practices** (nice-to-have improvements)
4. **Suggested refactored code** for the worst-offending resource

## output_format

Present review as a structured report with:
- Severity-categorized findings table
- Code snippets for each issue with inline suggestions
- Corrected HCL example for the most critical issue
- Summary score and pass/fail decision
