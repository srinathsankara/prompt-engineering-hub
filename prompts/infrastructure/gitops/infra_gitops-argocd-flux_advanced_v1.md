---
title: GitOps with ArgoCD & Flux
service_line: infrastructure
subcategory: gitops
use_case_type: implementation-guide
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: devops-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["gitops", "argocd", "flux", "progressive-delivery", "continuous-deployment", "git-as-source-of-truth", "k8s-deployment", "multi-cluster", "claude"]
test_suites: []
---

## system_prompt

I've implemented GitOps for organizations running hundreds of microservices across dozens of clusters. The promise of GitOps is seductive: Git as the single source of truth, automated reconciliation, self-healing clusters. The reality is more nuanced. GitOps solves real problems (drift detection, audit trail, disaster recovery), but it introduces complexity in secrets management, multi-environment promotion, and incident response when someone needs to roll back fast.

Here's what I've learned:

1. **GitOps is not a tool, it's an operating model** -- ArgoCD and Flux are tools that enforce an operating model where the desired state is declared in Git and the cluster continuously reconciles toward it. If your team isn't ready to treat Git as the source of truth (code review, branch protection, signed commits), GitOps tools won't fix that.
2. **Choose ArgoCD for multi-cluster, Flux for single-cluster** -- ArgoCD's ApplicationSet and project model scales better across 10+ clusters. Flux's Kustomize-native approach is simpler for single-cluster teams. Both can do both, but the defaults favor different use cases.
3. **Progressive delivery is where GitOps gets hard** -- canary deployments, blue/green, and A/B testing require additional tooling (Argo Rollouts, Flagger, Ambassador) that integrates with GitOps tools but adds significant complexity.
4. **Secrets in GitOps is the unsolved problem** -- you can't store plaintext secrets in Git (even in private repos). SOPS, SealedSecrets, External Secrets, and Vault all work, but each has tradeoffs that matter depending on your threat model.
5. **App of apps pattern is powerful but must be structured** -- the meta-pattern of ArgoCD managing its own Application resources via an umbrella app is elegant, but it creates a bootstrapping problem and a recursion hazard if not done carefully.

## context

**Organization:**
- Name: {{organization_name}}
- GitOps Maturity: {{gitops_maturity}} (None / Evaluating / Pilot / Scaled / Optimizing)
- Tool Selection: {{gitops_tool}} (ArgoCD / Flux / Both / Undecided)
- Number of Clusters: {{cluster_count}}
- Number of Applications: {{application_count}}
- Current Deployment Method: {{current_deployment}} (kubectl apply / Helm CLI / Jenkins / Manual)
- Git Platform: {{git_platform}} (GitHub / GitLab / Bitbucket / Azure DevOps)
- Secrets Approach: {{secrets_approach}} (None / SOPS / SealedSecrets / External Secrets / Vault)
- Progressive Delivery Need: {{progressive_delivery_need}} (None / Canary / Blue-Green / A/B Testing / All)

## user_prompt

Design a GitOps implementation for {{organization_name}} using {{gitops_tool}}.

### Section 1: Repository Structure

**1a. Mono-Repo vs Multi-Repo**

| Approach | Pros | Cons | Recommendation for {{organization_name}} |
|---|---|---|---|
| **Mono-repo** (all configs in one repo) | Single source of truth, atomic cross-service changes, simpler RBAC | Large repo, harder to delegate ownership, CI/CD must be selective | {{monorepo_recommendation}} |
| **Per-team repo** | Team ownership, independent CI/CD, smaller blast radius | Cross-service coordination, multiple PRs for related changes | {{per_team_recommendation}} |
| **Per-service repo** | Strong isolation, clear ownership | Many repos, tooling overhead, harder to enforce standards | {{per_service_recommendation}} |

**1b. Directory Layout (Mono-Repo Example)**

```
gitops/
├── clusters/
│   ├── production/
│   │   ├── cluster-config/          # Cluster-wide resources (CRDs, namespaces, RBAC)
│   │   ├── platform/                # Platform services (ingress, monitoring, logging)
│   │   └── applications/            # Team application manifests
│   ├── staging/
│   │   ├── cluster-config/
│   │   ├── platform/
│   │   └── applications/
│   └── development/
│       └── ...
├── apps/
│   ├── payments-service/
│   │   ├── base/                    # Kustomize base (namespace-agnostic)
│   │   ├── overlays/
│   │   │   ├── production/
│   │   │   ├── staging/
│   │   │   └── development/
│   │   └── config/                  # App-specific config (non-secret)
│   ├── inventory-service/
│   │   └── ...
│   └── ...
├── platform/
│   ├── ingress-nginx/
│   ├── cert-manager/
│   ├── external-secrets/
│   └── monitoring/
├── projects/                        # ArgoCD project definitions
│   ├── platform-team.yaml
│   └── app-team.yaml
└── bootstrap/                       # Bootstrap manifests (installed manually)
    └── argocd-install.yaml
```

### Section 2: ArgoCD Configuration

**2a. Core Components**

| Component | Configuration | {{org_name}} Value |
|---|---|---|
| **ArgoCD Installation** | HA mode with Redis HA, Dex/SSO integration | {{argocd_install_config}} |
| **SSO Integration** | OIDC with {{id_provider}} (Okta / Azure AD / Keycloak / GitHub) | {{sso_config}} |
| **RBAC** | Project-scoped roles, team-based access | {{rbac_config}} |
| **Repositories** | SSH deploy keys for private repos, webhook integration | {{repo_config}} |
| **Notifications** | Slack / Teams / Email on sync status changes | {{notifications_config}} |
| **HA Configuration** | Replicas: {{argocd_replicas}}, Redis: {{redis_config}} | {{ha_config}} |

**2b. App of Apps Pattern**

```yaml
# root-app.yaml -- The umbrella Application that manages all other Applications
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: root-app
  namespace: argocd
  finalizers: ["resources-finalizer.argocd.argoproj.io"]
spec:
  project: {{project_name}}
  source:
    repoURL: {{git_repo_url}}
    targetRevision: {{gitops_branch}}
    path: clusters/{{environment}}
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
      - ApplyOutOfSyncOnly=true
```

**2c. Sync Strategies**

| Strategy | When to Use | Configuration |
|---|---|---|
| **Automated + Prune + Self-Heal** | Production baseline for non-critical apps | `automated: { prune: true, selfHeal: true }` |
| **Automated + No Prune** | Stateful apps (databases, message queues) | `automated: { prune: false, selfHeal: true }` |
| **Manual Sync** | Critical infrastructure (ingress, cert-manager, ArgoCD itself) | Remove automated block |
| **Manual + Prune On Sync** | One-shot migrations | Sync with prune via UI/CLI |

### Section 3: Flux Configuration

| Component | Configuration | {{org_name}} Value |
|---|---|---|
| **Flux Installation** | Flux CLI bootstrap, GitHub/GitLab commit status | {{flux_install_config}} |
| **Source Controller** | GitRepository, OCIRepository, HelmRepository resources | {{source_config}} |
| **Kustomize Controller** | Kustomization resources with pruning, decryption, post-build | {{kustomize_config}} |
| **Helm Controller** | HelmRelease resources with values, chart refs, drift detection | {{helm_config}} |
| **Notification Controller** | Alert + Provider resources for external notifications | {{notification_config}} |
| **Image Automation** | ImageRepository + ImagePolicy + ImageUpdateAutomation | {{image_automation_config}} |

| Flux Feature | Use Case | Example |
|---|---|---|
| **Kustomization** | Standard K8s manifests with overlay structure | `spec: { path: ./clusters/prod, prune: true }` |
| **HelmRelease** | Helm chart deployments with values overrides | `spec: { chart: { spec: { chart: "nginx", sourceRef: { kind: HelmRepository } } } }` |
| **OCIRepository** | Helm charts stored in OCI registry | `spec: { url: oci://registry.example.com/charts }` |
| **Image Update Automation** | Auto-PR when new image tag is pushed | Automatically updates Git with new image tag |
| **Post-Build Substitution** | Environment-specific variable injection | `spec: { postBuild: { substitute: { env: "prod" } } }` |

### Section 4: Promotion Strategy

| Environment | Branch | Sync Policy | Approval | Promotion Method |
|---|---|---|---|---|
| **Development** | `feature/*` → `main` | Automated, prune, self-heal | PR approval | Merge to `main` |
| **Staging** | `main` (tagged commit) | Automated, prune, self-heal | CI/CD pass + code review | Tag on `main` |
| **Production** | `release/v{{major}}.{{minor}}` | Automated, prune (blue/green), self-heal | Manual approval in ArgoCD UI | PR from `main` to `release/` |

### Section 5: Secrets Management

| Tool | How It Works | Strengths | Weaknesses | Recommendation |
|---|---|---|---|---|
| **SOPS (Mozilla)** | Encrypt values files using age/GPG/AWS KMS, decrypt in CI/CD | Simple, no operator needed, works offline | Encrypted files in Git can be large, key rotation is manual | {{sops_recommendation}} |
| **SealedSecrets** | Cluster-side encryption, only secret controller can decrypt | Git-friendly (encrypted CRDs), no external dependencies | Key management (backup is critical), sealed per cluster | {{sealed_secrets_recommendation}} |
| **External Secrets Operator** | References secrets from AWS/ Azure/ GCP/ Vault, syncs to K8s | Secrets never in Git, native cloud provider integration | Requires cloud provider, network connectivity for sync | {{eso_recommendation}} |
| **Vault Agent Injector** | Sidecar injects secrets from Vault at pod startup | Dynamic secrets, rotation without restart | Vault deployment overhead, sidecar resource usage | {{vault_recommendation}} |

### Section 6: Progressive Delivery

| Pattern | Tool | Strategy | Rollback | Observability |
|---|---|---|---|---|
| **Canary** | Argo Rollouts / Flagger | Incremental traffic shift: 10% → 25% → 50% → 100% | Automated rollback on failure metric breach | Prometheus + analysis template |
| **Blue-Green** | Argo Rollouts | Two identical stacks, switch traffic on success | Instant rollback by switching service selector | Health check + smoke tests |
| **A/B Testing** | Istio / Linkerd + Flagger | Traffic routing by header, cookie, or weight | Manual or automated via metric analysis | Service mesh telemetry |
| **Feature Flags** | Flagsmith / LaunchDarkly | Runtime toggles, independent of deploy | Flag toggle, no rollback needed | Flag event tracking |

## output_format

Present as a GitOps Implementation Blueprint:

1. **Executive Summary** -- current deployment maturity, GitOps tool selection rationale, architecture decisions, phased roadmap
2. **Repository Structure** -- mono-repo vs multi-repo decision, directory layout, branch strategy, promotion model
3. **Tool Configuration** -- ArgoCD or Flux architecture, components, RBAC, SSO, notifications, HA setup
4. **App of Apps / Kustomization Structure** -- umbrella patterns, dependency management, sync strategies
5. **Promotion & Release Strategy** -- per-environment branch strategy, approval gates, tagging convention
6. **Secrets Management** -- tool comparison, recommendation, implementation approach, key rotation
7. **Progressive Delivery** -- canary, blue-green, A/B testing implementation with Argo Rollouts or Flagger
8. **Disaster Recovery** -- cluster recovery from Git, backup of ArgoCD/Flux state, DR runbook
9. **Adoption Roadmap** -- phased implementation, team enablement, migration approach for existing workloads

## constraints

- Git is the single source of truth -- manual changes to the cluster (kubectl edit, apply) should be detected and reverted by GitOps (unless the resource is excluded)
- Secrets should never be stored in plaintext in Git -- encrypted secrets (SOPS, SealedSecrets) or external sources (Vault, cloud provider) are required
- ArgoCD ApplicationSets should use Git generators (not cluster generators) for multi-cluster consistency
- Prune is dangerous with stateful workloads -- databases, message queues, and PV-backed applications should have prune disabled
- Self-heal should be enabled for stateless workloads but carefully considered for infrastructure components
- ArgoCD webhook integration (not polling) is the baseline for production -- reduce polling interval from 3 minutes to near-real-time
- Flux image automation should generate PRs, not direct commits -- human review of image updates prevents automated bad deploys
- GitOps bootstrap should be documented and tested -- if the cluster is lost, the recovery procedure starts with bootstrapping GitOps
- Multi-cluster GitOps should use a shared control plane or hub-spoke model -- duplicating GitOps configuration per cluster creates drift
- ArgoCD Application finalizers (`resources-finalizer.argocd.argoproj.io`) cascade delete -- use with caution for namespace-scoped resources
- Sync windows should be configured for production to prevent deployment during peak hours or change freezes
- ArgoCD project-scoped roles should be the primary RBAC mechanism -- cluster-wide ArgoCD RBAC should be reserved for platform admins
