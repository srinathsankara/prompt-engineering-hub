---
title: Kubernetes Architecture & Operations
service_line: infrastructure
subcategory: kubernetes
use_case_type: architecture-design
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: devops-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["kubernetes", "k8s-architecture", "cluster-design", "networking", "rbac", "pod-security", "cluster-upgrades", "capacity-planning", "backup-restore", "velero", "claude"]
test_suites: []
---

## system_prompt

I've designed and operated Kubernetes clusters across cloud providers and on-premises environments for organizations running hundreds of microservices. Kubernetes makes distributed systems look easy -- until you have to deal with cluster networking, RBAC at scale, pod security standards, capacity planning, or a control plane upgrade gone wrong.

Here's what I've learned:

1. **Cluster design decisions are irreversible without migration** -- choosing a CNI plugin, cluster network CIDR, or node size is painful to change later. Get these right upfront.
2. **RBAC is the first thing you should configure, not the last** -- the default cluster-admin for everyone pattern is how breaches happen. Configure least-privilege service accounts, namespaces, and role bindings before the first workload deploys.
3. **Pod Security Admission (PSA) is not optional in 2026** -- the days of running privileged pods are over. Enforce the `restricted` profile for all production namespaces, with exceptions reviewed and documented.
4. **Cluster upgrades are the highest-risk operation** -- control plane upgrades, especially skipping minor versions, can break the API server, scheduler, and controller manager. K8s supports N-2 upgrades, but that doesn't mean you should test skipping versions.
5. **You need a backup and DR plan for the cluster itself, not just the workloads** -- Velero for workload backup, etcd backup for cluster state, and a documented cluster recovery procedure.

## context

**Organization:**
- Name: {{organization_name}}
- Current K8s Version: {{k8s_version}}
- Number of Clusters: {{cluster_count}}
- Nodes per Cluster: {{nodes_per_cluster}}
- Cloud Provider: {{cloud_provider}} (EKS / AKS / GKE / Self-Managed / On-Prem)
- CNI Plugin: {{cni_plugin}} (Calico / Cilium / Flannel / Weave / AWS VPC CNI / Azure CNI)
- Current Networking Model: {{networking_model}} (Overlay / Native VPC / Hybrid)
- Cluster Purpose: {{cluster_purpose}} (Production / Staging / Dev / Mixed)
- Current RBAC Model: {{rbac_model}} (Cluster-admin only / Namespace-scoped / GitOps-managed / OIDC-integrated)

## user_prompt

Design a Kubernetes architecture and operations standard for {{organization_name}}.

### Section 1: Cluster Architecture

**1a. Cluster Sizing**

| Environment | Node Count | Node Type | Node Size | Autoscaling | Max Pods per Node |
|---|---|---|---|---|---|
| Development | {{dev_node_count}} | {{dev_node_type}} (On-Demand / Spot) | {{dev_instance_type}} (CPU, Memory) | {{dev_autoscaling}} | {{dev_max_pods}} |
| Staging | {{stg_node_count}} | {{stg_node_type}} | {{stg_instance_type}} | {{stg_autoscaling}} | {{stg_max_pods}} |
| Production | {{prod_node_count}} | {{prod_node_type}} | {{prod_instance_type}} | {{prod_autoscaling}} | {{prod_max_pods}} |

**1b. Network CIDR Planning**

| Resource | CIDR / Range | Purpose | Notes |
|---|---|---|---|
| VPC / Virtual Network | {{vpc_cidr}} | Cluster network | /16 recommended for most orgs |
| Pod CIDR | {{pod_cidr}} | Pod IP assignments | Must not overlap with VPC CIDR, service CIDR, or peered networks |
| Service CIDR | {{service_cidr}} | ClusterIP assignments | /20 minimum for most orgs |
| Node CIDR | {{node_cidr}} | Node subnets | Per-AZ subnets required |
| Node DNS | {{node_dns_ip}} | CoreDNS / node-local-dns | 10th IP of service CIDR typically |

**1c. CNI Plugin Selection**

| CNI | Network Model | Performance | Features | Security | {{org_name}} Fit |
|---|---|---|---|---|---|
| **Cilium** | eBPF-based | Best | Network policies, observability, service mesh (no sidecar), Hubble, cluster mesh | Best (eBPF-based L7 policies) | {{cilium_fit}} |
| **Calico** | Overlay / BGP | Good | Network policies, eBPF experimental, WireGuard encryption | Good (network policies, namespace isolation) | {{calico_fit}} |
| **AWS VPC CNI** | Native VPC | Best for AWS | Integrated with AWS networking, security groups per pod | AWS-native | {{aws_cni_fit}} |
| **Azure CNI** | Native VNet | Best for Azure | Integrated with Azure networking, NSG per pod | Azure-native | {{azure_cni_fit}} |
| **Flannel** | Overlay (VXLAN) | Moderate | Simple, no network policies | None (no policy enforcement) | Not recommended for production |

**Recommendation:** {{cni_recommendation}} because {{cni_rationale}}.

### Section 2: Security

**2a. Pod Security Standards**

| Namespace | PSA Profile | Admission Mode | Rationale |
|---|---|---|---|
| `{{prod_namespace}}` | `restricted` | `enforce` | Production workloads, no privileged access |
| `{{stg_namespace}}` | `restricted` | `enforce` | Same as production |
| `{{monitoring_namespace}}` | `baseline` | `warn` | DaemonSets (node-exporter) may require host access |
| `{{istio_system}}` | `baseline` | `warn` | Istio sidecar injection requires baseline |
| `{{velero_namespace}}` | `baseline` | `warn` | Velero node agent requires host path access |

**2b. RBAC Design**

```yaml
# ClusterRole: Read-only access
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: {{reader_role_name}}
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "endpoints", "configmaps", "namespaces"]
    verbs: ["get", "list", "watch"]
  - apiGroups: ["apps"]
    resources: ["deployments", "statefulsets", "daemonsets"]
    verbs: ["get", "list", "watch"]

# Role: Deployer access (per-namespace)
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: {{deployer_role_name}}
  namespace: {{namespace}}
rules:
  - apiGroups: ["apps"]
    resources: ["deployments"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
  - apiGroups: [""]
    resources: ["pods", "services", "configmaps"]
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  - apiGroups: ["autoscaling"]
    resources: ["horizontalpodautoscalers"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
```

| Role | Permissions | Bound To | Scope |
|---|---|---|---|
| **cluster-admin** | Full cluster access | Platform team (break-glass only) | Cluster-wide |
| **platform-admin** | All namespaces, all resources | Platform team (standard) | Cluster-wide |
| {{reader_role_name}} | Read-only access to all resources | All developers | Cluster-wide |
| {{deployer_role_name}} | Deploy, update, delete resources in namespace | Service team leads | Per-namespace |
| {{viewer_role_name}} | Read-only within namespace | Service team members | Per-namespace |

**2c. OIDC / SSO Integration**

| Provider | Integration Method | Groups Claim | Cluster Role Binding |
|---|---|---|---|
| {{oidc_provider}} (Okta / Azure AD / Keycloak) | K8s OIDC flags on API server | `groups` claim from token | OIDC group-to-ClusterRole mapping via ClusterRoleBinding |

### Section 3: Cluster Operations

**3a. Upgrade Strategy**

| K8s Version | Current Version | Target Version | Upgrade Window | Impact |
|---|---|---|---|---|
| Control Plane | {{current_k8s_version}} | {{target_k8s_version}} | {{control_plane_window}} | API server downtime during rolling upgrade |
| Node Pool | {{current_node_version}} | {{target_node_version}} | {{node_window}} | Pod eviction and rescheduling |
| CNI Plugin | {{current_cni_version}} | {{target_cni_version}} | {{cni_upgrade_window}} | Network disruption during upgrade |

| Phase | Action | Duration | Validation |
|---|---|---|---|
| Pre-Upgrade | Backup etcd, run preflight checks, verify deprecated API removal | {{pre_upgrade_duration}} | All preflight checks pass, etcd backup verified |
| Dev Cluster | Upgrade dev, verify workloads | {{dev_upgrade_duration}} | E2E tests pass |
| Staging Cluster | Upgrade staging, run integration tests | {{stg_upgrade_duration}} | All integration tests pass, canary deploy succeeds |
| Production (Canary Node) | Upgrade single node, observe metrics | {{canary_duration}} | No error budget burn, no customer impact |
| Production (Rolling) | Upgrade remaining nodes, rolling | {{rolling_duration}} | Gradual, no more than {{max_unavailable_nodes}} nodes unavailable at once |
| Post-Upgrade | Verify all workloads, run extended tests | {{post_upgrade_duration}} | All monitored metrics green, cert-manager certs re-issued |

**3b. Backup & Disaster Recovery**

| Component | Backup Method | Frequency | Retention | Recovery Time |
|---|---|---|---|---|
| **etcd** | etcd snapshot via cronjob or Velero | {{etcd_backup_frequency}} | {{etcd_retention}} | {{etcd_recovery_time}} |
| **PVCs** | Velero with CSI snapshot or restic | {{pvc_backup_frequency}} | {{pvc_retention}} | {{pvc_recovery_time}} |
| **K8s Resources** | Velero (YAML backup to S3/GCS) | {{resource_backup_frequency}} | {{resource_retention}} | {{resource_recovery_time}} |
| **Cluster Config** | IaC (Terraform / Crossplane) stored in Git | Git history | Git history | {{iac_recovery_time}} |

### Section 4: Capacity Planning & Autoscaling

| Scaling Dimension | Component | Metric | Scale-Up Threshold | Scale-Down Threshold | Min / Max |
|---|---|---|---|---|---|
| **Node** | Cluster Autoscaler | Unschedulable pods + resource utilization | Pending pods > 0 OR CPU > {{node_cpu_up}}% | Utilization < {{node_cpu_down}}% for {{node_down_duration}} min | {{node_min}} / {{node_max}} |
| **Pod** | HPA | CPU / Memory / Custom metrics | CPU > {{hpa_cpu_threshold}}% OR Memory > {{hpa_memory_threshold}}% | Below threshold for {{hpa_down_duration}} | {{hpa_min}} / {{hpa_max}} |
| **Pod (Advanced)** | KEDA | Queue length, event-driven, custom Prometheus metrics | {{keda_metric}} > {{keda_threshold}} | Below threshold for {{keda_down_duration}} | {{keda_min}} / {{keda_max}} |
| **Cluster** | Cluster Autoscaler + HPA + PDB | Combined, with PDB preventing disruption of critical workloads | Pod disruption budget ensures {{pdb_min_available}} replicas always available | N/A | Cluster-level |

### Section 5: Namespace & Resource Governance

| Namespace | Requests (CPU) | Requests (Memory) | Limits (CPU) | Limits (Memory) | Quota Scope |
|---|---|---|---|---|---|
| `{{prod_namespace}}` | {{prod_request_cpu}} | {{prod_request_memory}} | {{prod_limit_cpu}} | {{prod_limit_memory}} | Hard quota |
| `{{stg_namespace}}` | {{stg_request_cpu}} | {{stg_request_memory}} | {{stg_limit_cpu}} | {{stg_limit_memory}} | Hard quota |
| `{{dev_namespace}}` | {{dev_request_cpu}} | {{dev_request_memory}} | {{dev_limit_cpu}} | {{dev_limit_memory}} | Hard quota |
| `{{monitoring_namespace}}` | {{mon_request_cpu}} | {{mon_request_memory}} | {{mon_limit_cpu}} | {{mon_limit_memory}} | Hard quota |

**LimitRange (per-namespace defaults):**

```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: {{namespace}}-limits
  namespace: {{namespace}}
spec:
  limits:
    - default:
        cpu: {{default_cpu_limit}}
        memory: {{default_memory_limit}}
      defaultRequest:
        cpu: {{default_cpu_request}}
        memory: {{default_memory_request}}
      type: Container
```

## output_format

Present as a Kubernetes Architecture & Operations Standard:

1. **Executive Summary** -- current cluster posture, key risks, architecture decisions, ops maturity
2. **Cluster Architecture** -- sizing, network CIDR planning, CNI selection, multi-AZ topology
3. **Security Standards** -- Pod Security Admission, RBAC model, OIDC integration, secrets management
4. **Operations Runbook** -- upgrade strategy, backup/DR, etcd management, node management
5. **Capacity Planning** -- cluster autoscaler, HPA, KEDA, resource quotas, LimitRanges
6. **Namespace Governance** -- namespace structure, RBAC per namespace, resource quotas per workload tier
7. **Observability** -- cluster-level monitoring, kube-state-metrics, custom metrics, cost allocation
8. **Cluster Recovery Procedure** -- full cluster loss recovery, partial failure, etcd restoration, DR testing schedule

## constraints

- Pod Security Admission (PSA) `restricted` profile is the baseline for all production namespaces -- exceptions must be documented and reviewed quarterly
- RBAC must use least-privilege -- the `cluster-admin` ClusterRoleBinding should have no subjects by default outside of break-glass procedures
- etcd backups must be encrypted at rest and stored off-cluster -- a cluster failure should not destroy the backups
- Cluster upgrades cannot skip minor versions -- N-1 is the maximum supported jump (e.g., 1.30 -> 1.31, not 1.30 -> 1.32)
- CNI plugin selection must consider network policy enforcement and encryption requirements, not just performance
- HPA and Cluster Autoscaler should be configured in all production clusters -- static capacity is not acceptable for production workloads
- Pod Disruption Budgets (PDBs) are required for all production workloads -- deployments without PDBs can be fully disrupted during node upgrades
- Network policies should implement default-deny for all namespaces -- allow rules should be explicit for inter-service communication
- Resource quotas should be set at the namespace level -- unlimited resource consumption in any namespace is a capacity planning risk
- OIDC integration for K8s auth is required for all human users -- static tokens and service account tokens for humans are forbidden
- Velero backup schedules should include a backup retention policy that meets organizational recovery point objectives (RPO)
- Cluster configuration should be managed as IaC (Terraform, Crossplane, ClusterAPI) -- manual cluster configuration is not acceptable for production
