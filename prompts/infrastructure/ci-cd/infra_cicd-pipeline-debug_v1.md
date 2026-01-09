---
title: CI/CD Pipeline Failure Debugging
service_line: infrastructure
subcategory: ci-cd
use_case_type: troubleshooting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: devops-lead
created_date: 2026-04-12
last_modified: 2026-06-14
tags: ["ci-cd", "pipeline", "github-actions", "azure-devops", "jenkins", "claude"]
test_suites: ["testing/test-cases/infrastructure/cicd-debug.json"]
---

## system_prompt

I've built and maintained CI/CD pipelines for 400+ production applications across GitHub Actions, Azure DevOps, Jenkins, and GitLab CI. The pipeline failures I see most often are the same ones repeating across teams. Here's what to look for:

- Flaky tests that mask real failures
- Environment-specific configuration drift
- Secrets and credential expiry (this one's always at 3 AM)
- Dependency version mismatches
- Resource contention in runners/agents
- Network timeouts to package registries and artifact stores

## context

**Pipeline Info:**
- Platform: {{platform}} (GitHub Actions / Azure DevOps / Jenkins / GitLab CI)
- Repository: {{repo_name}}
- Branch: {{branch}}
- Pipeline Name: {{pipeline_name}}
- Run ID: {{run_id}}
- Trigger: {{trigger}} (push / PR / schedule / manual)
- Agent/Runner Type: {{agent_type}}

**Failure Details:**
- Stage Failed: {{failed_stage}}
- Job Name: {{job_name}}
- Error Code: {{error_code}}
- Error Message:
  ```
  {{error_message}}
  ```
- Full Log Snippet (last 50 lines):
  ```
  {{log_snippet}}
  ```
- Duration Before Failure: {{duration_before_failure}}

**Recent Changes:**
- Pipeline file changes: {{pipeline_changes}}
- Dependency changes: {{dependency_changes}}
- Agent/runner changes: {{agent_changes}}

## user_prompt

The CI/CD pipeline failed at the **{{failed_stage}}** stage. Help me diagnose and fix it.

### Step 1: Classify the Failure

Based on the error message and context, classify into one of:

| Category | Pattern | Typical Cause |
|----------|---------|---------------|
| **Compile/Build** | `error TS2304`, `cannot find symbol`, `build FAILED` | Missing dependency, wrong SDK version, corrupted lockfile |
| **Test** | `FAILED`, `AssertionError`, `test timed out` | Flaky test, environment mismatch, missing test data |
| **Lint/Style** | `violation`, `formatting`, `lint error` | New rule, config change, pre-commit hook mismatch |
| **Dependency** | `404 Not Found`, `Could not resolve`, `Authentication failed` | Expired token, removed package, registry down |
| **Docker** | `OCI runtime`, `exec format error`, `no matching manifest` | Base image change, architecture mismatch, Dockerfile syntax |
| **Deploy** | `403 Forbidden`, `AccessDenied`, `Throttling` | Expired credentials, IAM role change, rate limit |
| **Infra** | `Error acquiring state`, `Provider error`, `timeout` | State lock, provider API change, network issue |

**What category is this failure? What's the likely specific cause?**

### Step 2: Common Fixes by Stage

**If the failure is in the BUILD stage:**

1. Clear cache and retry:
   - GitHub Actions: `Cache` action -- check cache key mismatch
   - Azure DevOps: `Cache@2` task -- verify cache key includes `**/*.lock`
2. Check for lockfile drift: `package-lock.json`, `requirements.txt`, `go.sum`, `Gemfile.lock`
3. Check for platform-specific build issues (Windows vs Linux runner, architecture mismatch)
4. Provide the exact command to reproduce locally:
   ```bash
   # Example for Node.js
   rm -rf node_modules package-lock.json
   npm install --force
   npm run build
   ```
   ```bash
   # Example for Python
   pip install --no-cache-dir -r requirements.txt
   python -m build
   ```

**If the failure is in the TEST stage:**

1. Are these unit, integration, or e2e tests? Suggest the appropriate retry approach.
2. Is it a known flaky test? Check for:
   - Timing-dependent tests (suggest `--retry` or `waitFor` improvements)
   - Environment-specific tests (suggest mock or fixture isolation)
   - Order-dependent tests (suggest `--shuffle` and `--test-affected-only`)
3. For flaky tests, recommend a quarantine strategy:
   ```yaml
   # Example: Jest flaky test retry in CI
   - name: Run tests with retry
     run: npx jest --maxRetries=3 --retryAfter=5s
   ```

**If the failure is in the DEPLOY stage:**

1. Check credential expiry:
   ```bash
   # Check AWS credential expiry
   aws sts get-caller-identity
   aws sts get-session-token
   ```
   ```bash
   # Check Azure credential expiry
   az account show
   az ad sp credential list --id <service-principal-id>
   ```
2. Check environment drift between environments:
   ```
   # Compare config between staging and prod
   diff <(kubectl get configmap app-config -n staging -o yaml) <(kubectl get configmap app-config -n prod -o yaml)
   ```
3. Check state lock for Terraform deployments:
   ```bash
   terraform force-unlock <lock_id>  # Only after verifying no active apply
   ```

**If the failure is a TIMEOUT:**

1. Increase timeout at the job/step level:
   ```yaml
   # GitHub Actions
   - name: Long running step
     timeout-minutes: 30
     run: ./long-task.sh
   ```
2. Check runner resource limits (disk space, memory)
3. Check if the process is waiting for user input (blocked on a prompt)

### Step 3: Provide a Fix

Write the exact change needed. Show both the broken config and the fixed config:

```yaml
# BROKEN:
- name: Install dependencies
  run: npm install    # No lockfile check, might produce different versions

# FIXED:
- name: Install dependencies
  run: |
    if [ -f package-lock.json ]; then
      npm ci  # Clean install from lockfile
    else
      npm install
    fi
```

### Step 4: Preventive Measures

Recommend 3 changes to prevent this type of failure in the future:

1. {{prevention_1}}
2. {{prevention_2}}
3. {{prevention_3}}

Examples:
- Add cache key validation to workflow
- Add flaky test detection with auto-retry
- Set up credential expiry monitoring and alerts
- Add pre-merge pipeline validation gate

## output_format

Present the diagnosis and fix as:
1. **Failure Classification** -- one-line category and likely cause
2. **Immediate Fix** -- exact code change or config change needed
3. **Manual Verification** -- steps to confirm the fix works locally
4. **Prevention** -- 3 recommendations to avoid recurrence
