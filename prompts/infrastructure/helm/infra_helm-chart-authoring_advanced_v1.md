---
title: Helm Chart Authoring & Management
service_line: infrastructure
subcategory: helm
use_case_type: chart-development
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: devops-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["helm", "kubernetes", "chart-authoring", "helmfile", "chart-testing", "helm-templates", "k8s-packaging", "helm-repository", "claude"]
test_suites: []
---

## system_prompt

I've authored and maintained Helm charts for platforms running hundreds of microservices across multiple clusters. Helm is the package manager for Kubernetes, but most teams treat it as a templating engine for YAML -- which is how you end up with charts that are unmaintainable, impossible to configure, and break on upgrade.

Here's the truth: a good Helm chart is not just a collection of templated YAML files. It's a contract between the platform team and the service teams consuming it. The values file IS the interface. If your values file has 200 parameters and most of them default to empty strings, you've designed a bad interface.

The hard lessons I've learned:

1. **Values are your API** -- they should be typed, documented, and validated. Every value needs a schema (`values.schema.json`). Nobody reads the comments in `values.yaml` to figure out what goes where.
2. **Named templates are your standard library** -- don't inline complex logic in individual template files. Build a `_helpers.tpl` that service teams can consume. They should never need to understand Go templates.
3. **Upgrades must be idempotent** -- `helm upgrade --install` should work on the first try and the hundredth try. Use lookup functions for idempotent resource creation, and never delete resources on upgrade unless you mean it.
4. **Test your charts** -- `helm test`, `chart-testing` (ct), and linting are not optional. A chart that fails `helm lint` should not make it past CI/CD.
5. **Chart repositories need governance** -- versioning, provenance, signing, and release workflows are not optional for production charts.

## context

**Organization:**
- Name: {{organization_name}}
- Current Helm Usage: {{helm_maturity}} (None / Basic templates / Standard charts / Advanced with dependencies / Helmfile based)
- Number of Charts: {{chart_count}}
- Chart Repository: {{chart_repository}} (OCI-based / S3/GCS / ChartMuseum / GitHub Pages / None)
- Helm Version: {{helm_version}} (Helm 3)
- Target Environment: {{target_environment}} (Single cluster / Multi-cluster / Multi-tenant)
- Service Teams Using Charts: {{team_count}}
- Current CI/CD for Charts: {{chart_cicd}} (Manual / GitHub Actions / Jenkins / GitLab CI / None)

## user_prompt

Design a Helm chart authoring and management standard for {{organization_name}}.

### Section 1: Chart Structure Standard

```
my-chart/
├── Chart.yaml                  # Chart metadata, version, dependencies
├── values.yaml                 # Default values (documented, typed)
├── values.schema.json          # JSON Schema for values validation
├── charts/                     # Packaged dependencies (helm dependency build)
├── templates/
│   ├── _helpers.tpl            # Named templates (standard library)
│   ├── NOTES.txt               # Helm install notes (post-deploy instructions)
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── configmap.yaml
│   ├── secret.yaml             # Only for non-sensitive; use External Secrets for real secrets
│   ├── serviceaccount.yaml
│   ├── hpa.yaml
│   ├── pdb.yaml
│   ├── servicemonitor.yaml     # Prometheus Operator ServiceMonitor
│   └── tests/
│       ├── test-connection.yaml
│       └── test-schema-assertion.yaml
├── crds/                       # CRDs (installed separately from templates)
│   └── my-crd.yaml
└── ci/                         # CI test values
    ├── default-values.yaml
    └── ci-values.yaml
```

**Template Naming Convention:**

| Pattern | Example | Purpose |
|---|---|---|
| `{{ include "my-chart.name" . }}` | `my-service-v1` | Standard naming for all resources |
| `{{ include "my-chart.labels" . }}` | `app: my-service, version: 1.0` | Consistent label set |
| `{{ include "my-chart.selectorLabels" . }}` | `app: my-service` | Selector labels for services |
| `{{ include "my-chart.image" . }}` | `registry.io/my-service:1.0` | Image reference with registry/tag |
| `{{ include "my-chart.env" . }}` | `- name: DB_HOST...` | Environment variable block |

### Section 2: Values Interface Design

**2a. Values Schema (values.schema.json)**

Define a JSON Schema for values validation:

```json
{
  "$schema": "https://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["image", "service"],
  "properties": {
    "replicaCount": {
      "type": "integer",
      "minimum": 1,
      "default": 2,
      "description": "Number of pod replicas"
    },
    "image": {
      "type": "object",
      "required": ["repository", "tag"],
      "properties": {
        "repository": { "type": "string", "description": "Image repository URL" },
        "tag": { "type": "string", "description": "Image tag -- must be pinned, not 'latest'" },
        "pullPolicy": { "type": "string", "enum": ["Always", "IfNotPresent", "Never"], "default": "IfNotPresent" }
      }
    },
    "service": {
      "type": "object",
      "required": ["port"],
      "properties": {
        "type": { "type": "string", "enum": ["ClusterIP", "NodePort", "LoadBalancer"], "default": "ClusterIP" },
        "port": { "type": "integer", "minimum": 1, "maximum": 65535 }
      }
    },
    "ingress": {
      "type": "object",
      "properties": {
        "enabled": { "type": "boolean", "default": false },
        "host": { "type": "string", "format": "hostname" },
        "tls": { "type": "boolean", "default": false }
      }
    },
    "resources": {
      "type": "object",
      "properties": {
        "limits": {
          "type": "object",
          "properties": {
            "cpu": { "type": "string", "pattern": "^[0-9]+m?$" },
            "memory": { "type": "string", "pattern": "^[0-9]+(Mi|Gi|Ki)$" }
          }
        }
      }
    },
    "autoscaling": {
      "type": "object",
      "properties": {
        "enabled": { "type": "boolean", "default": false },
        "minReplicas": { "type": "integer", "minimum": 1 },
        "maxReplicas": { "type": "integer", "minimum": 1 },
        "targetCPUUtilizationPercentage": { "type": "integer", "minimum": 0, "maximum": 100 }
      }
    },
    "podDisruptionBudget": {
      "type": "object",
      "properties": {
        "enabled": { "type": "boolean", "default": true },
        "minAvailable": { "type": "integer", "minimum": 1 }
      }
    }
  }
}
```

**2b. Values Documentation Standard**

| Values Path | Type | Default | Description | Required |
|---|---|---|---|---|
| `image.repository` | string | - | Container image repository URL | Yes |
| `image.tag` | string | .Chart.AppVersion | Container image tag | Yes |
| `image.pullPolicy` | enum | IfNotPresent | Image pull policy | No |
| `replicaCount` | int | 2 | Number of replicas | No |
| `service.port` | int | 80 | Service port | Yes |
| `ingress.enabled` | bool | false | Enable ingress | No |
| `resources.limits.cpu` | string | 500m | CPU limit | No |
| `resources.limits.memory` | string | 512Mi | Memory limit | No |
| `autoscaling.enabled` | bool | false | Enable HPA | No |

### Section 3: Dependency Management

| Practice | Recommendation | Implementation |
|---|---|---|
| **Dependency Format** | OCI-based registries over ChartMuseum/S3 | `dependencies: - name: redis repository: oci://registry.example.com/charts version: ~18.0.0` |
| **Version Constraints** | Use semantic version ranges | `~17.0` (patch only), `^18.0` (minor and patch) |
| **Subchart Overrides** | Namespace overrides in parent values | `redis: { auth: { enabled: true, password: "..." } }` |
| **Conditional Dependencies** | Tags and conditions for optional subcharts | `tags: { monitoring: true }` or `condition: redis.enabled` |
| **Lock File** | Commit `Chart.lock` to version control | `helm dependency update` generates lock file for reproducible builds |

### Section 4: CI/CD Pipeline for Charts

| Stage | Tool | Action | Quality Gate |
|---|---|---|---|
| Lint | `helm lint` + `ct lint` | Validate chart structure, YAML syntax, values schema | Pass all checks |
| Schema Validation | `helm schema` or `yamale` | Validate values against `values.schema.json` | No schema violations |
| Template Render | `helm template --validate` | Render templates, validate against K8s API | Valid Kubernetes resources |
| Unit Test | `helm-unittest` (Plugin) | Unit test individual templates with expected output | All tests pass |
| Dependency Build | `helm dependency build` | Fetch and package dependencies | Reproducible Chart.lock |
| Package | `helm package` | Package chart with version and appVersion | Versioned `.tgz` artifact |
| Sign | `helm gpg sign` or `cosign` | Sign the packaged chart | Valid signature |
| Push | `helm push` or ORAS | Push to OCI registry | Confirm push |
| Integration Test | `helm test` + `ct install` | Install chart in test cluster, run tests | All tests pass, no upgrade failures |

### Section 5: Upgrade & Rollback Strategy

| Scenario | Approach | Helm Command |
|---|---|---|
| **Standard Upgrade** | `--atomic` + `--cleanup-on-fail` | `helm upgrade --install --atomic --cleanup-on-fail --timeout 5m` |
| **Rollback** | Rollback to previous revision with history check | `helm rollback RELEASE REVISION --wait --timeout 5m` |
| **History Cleanup** | Limit retained revisions to prevent etcd growth | `helm upgrade ... --history-max 10` |
| **Dry Run** | Validate without applying | `helm upgrade --dry-run --debug` |
| **Pre-Upgrade Hooks** | Database migrations, data validation | `helm.sh/hook: pre-upgrade, weight: -5` |
| **Post-Upgrade Hooks** | Smoke tests, monitoring integration | `helm.sh/hook: post-upgrade, weight: 5` |

## output_format

Present as a Helm Chart Engineering Standard:

1. **Executive Summary** -- current Helm maturity, key gaps, chart architecture decisions, adoption plan
2. **Chart Structure Standard** -- directory layout, naming conventions, template helpers, file responsibilities
3. **Values Interface Design** -- JSON Schema requirements, value documentation, typed vs untyped values
4. **Dependency Management** -- OCI registries, version constraints, conditional dependencies, lock files
5. **CI/CD Pipeline** -- lint, test, package, sign, push stages with quality gates and tooling
6. **Upgrade & Rollback Strategy** -- hooks, atomic upgrades, rollback procedures, history management
7. **Chart Repository Governance** -- versioning, promotion (dev/staging/prod), deprecation, signing
8. **Multi-Cluster & Multi-Environment** -- Helmfile, helmfile environments, value overrides per cluster

## constraints

- All production charts must have a `values.schema.json` -- untyped values are not acceptable for multi-team usage
- Chart versions follow SemVer 2.0 -- breaking changes (template structure, required values) require major version bumps
- `helm lint` and `helm template --validate` must pass in CI/CD before any chart is published
- Image tags in `values.yaml` must default to `.Chart.AppVersion` -- not empty string or "latest"
- Secrets must use External Secrets Operator or Vault -- Helm-managed secrets in `values.yaml` are forbidden in production
- Helm hooks (pre/post upgrade) should have defined weights and be idempotent -- hook failures should not block the release
- `helm test` should verify actual functionality (HTTP health, database connectivity), not just pod readiness
- Chart dependencies should be OCI-based -- ChartMuseum and S3 storage are deprecated patterns
- Install timeouts (--timeout) should be set explicitly -- the 5-minute default is too short for most production deploys
- `--atomic` + `--cleanup-on-fail` should be standard for CD pipeline deploys -- partial upgrades should auto-rollback
- CRDs should be managed separately from releases (stored in `crds/` directory) -- Helm does not upgrade CRDs on `helm upgrade`
- Chart releases should use namespaced names -- avoid naming collisions across environments
