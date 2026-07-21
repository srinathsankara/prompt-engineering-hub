---
title: Secrets Management with Vault & Kubernetes
service_line: infrastructure
subcategory: secret-management
use_case_type: architecture-design
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: security-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["secrets-management", "hashicorp-vault", "vault", "external-secrets", "kubernetes-secrets", "dynamic-secrets", "secret-rotation", "k8s-security", "claude"]
test_suites: []
---

## system_prompt

I've deployed and operated HashiCorp Vault in production across Kubernetes and VM-based workloads for organizations under FedRAMP, PCI, and SOC 2. Secrets management is one of those things that seems simple until you have to do it at scale -- and then you realize that the hardest part isn't the technology, it's the operational model.

Here's what I've learned:

1. **Static secrets (Vault kv) are table stakes** -- if all you're doing is storing static secrets in Vault, you're getting maybe 20% of the value. The real power is dynamic secrets (database credentials that expire, AWS IAM tokens on demand, PKI certs with short TTLs).
2. **Vault is an operations platform, not a developer tool** -- it requires dedicated operational expertise. If your team can't staff a Vault operator, use a managed alternative (cloud provider secrets manager) or limit Vault usage to dynamic secrets only.
3. **Kubernetes auth is the best integration point** -- Vault's Kubernetes auth method lets pods authenticate via their service account token. No static credentials needed on the pod. This is the pattern you should use for all K8s workloads.
4. **Secret rotation is the hardest problem** -- static secrets in Vault need rotation. Dynamic secrets handle this automatically, which is why they're superior. If you can't use dynamic secrets, you need a rotation workflow (which nobody implements well).
5. **Audit logging is non-negotiable** -- every secret access must be logged. Vault's audit log is your evidence for compliance audits. Ship it to your SIEM. Retain it for your audit retention period.

## context

**Organization:**
- Name: {{organization_name}}
- Current Secrets Approach: {{current_approach}} (K8s Secrets only / Vault basic / Cloud Secrets Manager / No formal approach)
- Vault Maturity: {{vault_maturity}} (None / Evaluating / Deployed / Scaled)
- Deployment Model: {{vault_deployment}} (Self-managed Vault / Vault on K8s / HCP Vault / Cloud-native (AWS SM / GCP SM / Azure KV))
- Workload Platforms: {{workload_platforms}} (Kubernetes / VMs / Serverless / Mixed)
- Secrets Volume: {{secrets_count}} (number of unique secrets)
- Rotation Requirements: {{rotation_requirements}} (None / Monthly / Quarterly / Per-regulatory)
- Compliance Scope: {{compliance_scope}} (PCI / SOC 2 / HIPAA / FedRAMP / SOX / None)
- Audit Log Destination: {{audit_destination}} (File / Syslog / Elastic / Splunk / CloudWatch / None)

## user_prompt

Design a secrets management architecture for {{organization_name}} using Vault and Kubernetes.

### Section 1: Architecture Decision

| Criteria | Self-Managed Vault | Vault on K8s (Helm) | HCP Vault (Managed) | Cloud Secrets Manager | {{org_name}} Fit |
|---|---|---|---|---|---|
| **Operational Overhead** | High - requires dedicated ops | Medium - K8s-native but still operations-intensive | Low - managed control plane | Very Low - fully managed | {{ops_fit}} |
| **Dynamic Secrets** | Full support | Full support | Full support | Limited (DB rotation only) | {{dynamic_fit}} |
| **PKI / Certificate Management** | Full support | Full support | Full support | Limited | {{pki_fit}} |
| **Multi-Cloud** | Yes (seamless) | Yes (control plane per cluster) | Yes (HCP global) | No (per-cloud) | {{multicloud_fit}} |
| **Kubernetes Integration** | Excellent (k8s auth, sidecar, CSI) | Native (same cluster, low latency) | Good (k8s auth from any cluster) | Good (CSI driver, external-sync) | {{k8s_fit}} |
| **Cost** | Infrastructure + ops time | Infrastructure + ops time | Per-client license + infra | Per-secret pricing | {{cost_fit}} |
| **Compliance Certifications** | Self-certified | Self-certified | FedRAMP / SOC 2 / PCI | Varies by provider | {{compliance_fit}} |

**Recommendation:** {{secrets_architecture_recommendation}}

### Section 2: Vault Deployment Architecture

**2a. Production Deployment (Vault on Kubernetes)**

| Component | Configuration | {{org_name}} Value |
|---|---|---|
| **Vault HA** | 3+ pods, Raft integrated storage, auto-unseal with KMS | {{ha_config}} |
| **Auto-Unseal** | AWS KMS / Azure Key Vault / GCP Cloud KMS | {{auto_unseal_config}} |
| **Storage Backend** | Raft (integrated) -- recommended; Consul -- alternative | {{storage_config}} |
| **Ingress** | Internal-only (cluster-local DNS), no public endpoint | {{ingress_config}} |
| **TLS** | Vault TLS with cert-manager or self-signed CA | {{tls_config}} |
| **Audit Logging** | File + syslog, shipped to {{audit_destination}} | {{audit_config}} |
| **Monitoring** | Prometheus metrics, Vault-specific dashboards | {{monitoring_config}} |

**2b. Resource Sizing**

| Environment | Replicas | CPU per Pod | Memory per Pod | Storage | Disk Type |
|---|---|---|---|---|---|
| Development | 1 | {{dev_cpu}}  | {{dev_memory}}  | {{dev_storage}}  | Standard |
| Staging | 3 | {{stg_cpu}}  | {{stg_memory}}  | {{stg_storage}}  | SSD |
| Production | 3+ | {{prod_cpu}} | {{prod_memory}} | {{prod_storage}} | SSD (high IOPS) |

### Section 3: Kubernetes Integration Patterns

**3a. Authentication Methods**

| Method | How It Works | Use Case | Recommendation |
|---|---|---|---|
| **Kubernetes Auth** | Pod authenticates via its ServiceAccount JWT; Vault validates via K8s API | Primary method for all K8s workloads | ✅ **Standard** |
| **Vault Agent Sidecar** | Sidecar container authenticates and writes secrets to shared volume; app reads from file | Legacy apps that can't call Vault API | ✅ **For legacy apps only** |
| **Vault CSI Provider** | CSI driver mounts secrets as volumes; uses Kubernetes auth | K8s 1.20+, no sidecar needed | ✅ **Recommended for K8s 1.20+** |
| **External Secrets Operator** | Syncs Vault secrets to K8s Secret objects | Teams expecting K8s Secrets as their interface | ⚠️ **Compromise pattern** |
| **Token (Static)** | Long-lived Vault token stored in K8s Secret | Bootstrapping only | ❌ **Not for production** |

**3b. Vault CSI Provider (Recommended Pattern)**

```yaml
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
  name: {{app_name}}-vault
spec:
  provider: vault
  parameters:
    roleName: {{vault_role}}
    vaultAddress: https://vault.{{namespace}}.svc.cluster.local:8200
    objects: |
      - objectName: "db-password"
        secretPath: "secret/data/{{environment}}/{{app_name}}/database"
        secretKey: "password"
      - objectName: "api-key"
        secretPath: "secret/data/{{environment}}/{{app_name}}/api"
        secretKey: "key"
---
apiVersion: v1
kind: Pod
metadata:
  name: {{app_name}}
spec:
  serviceAccountName: {{service_account}}
  containers:
    - name: app
      image: {{app_image}}
      volumeMounts:
        - name: secrets
          mountPath: "/mnt/secrets"
          readOnly: true
  volumes:
    - name: secrets
      csi:
        driver: secrets-store.csi.k8s.io
        readOnly: true
        volumeAttributes:
          secretProviderClass: "{{app_name}}-vault"
```

### Section 4: Dynamic Secrets

**4a. Database Dynamic Secrets**

```bash
# Configure database secrets engine
vault secrets enable database
vault write database/config/postgres-{{environment}} \
    plugin_name=postgresql-database-plugin \
    allowed_roles="*" \
    connection_url="postgresql://{{vault_user}}@{{db_host}}:5432/" \
    username="{{vault_user}}" \
    password="{{vault_password}}"

# Create role with TTL
vault write database/roles/{{app_name}}-db \
    db_name=postgres-{{environment}} \
    creation_statements="CREATE USER \"{{name}}\" WITH PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="24h"
```

| Database Type | Vault Plugin | Default TTL | Max TTL | Rotation Behavior |
|---|---|---|---|---|
| PostgreSQL | `postgresql-database-plugin` | {{pg_default_ttl}} | {{pg_max_ttl}} | Auto-generated user, valid until TTL expires |
| MySQL / MariaDB | `mysql-database-plugin` | {{mysql_default_ttl}} | {{mysql_max_ttl}} | Auto-generated user, valid until TTL expires |
| MongoDB | `mongodb-database-plugin` | {{mongo_default_ttl}} | {{mongo_max_ttl}} | Auto-generated user, credentials rotated on renew |
| AWS RDS | `aws-rds-plugin` | {{rds_default_ttl}} | {{rds_max_ttl}} | Leverages IAM database auth when available |

**4b. AWS Dynamic Secrets**

| Secret Type | Vault Engine | TTL | Use Case |
|---|---|---|---|
| AWS IAM User | `aws` secrets engine | {{aws_iam_ttl}} | Programmatic access for services |
| AWS STS (AssumeRole) | `aws` secrets engine (STS) | {{aws_sts_ttl}} (5 mins - 1 hour) | Cross-account access, short-lived |
| AWS IAM with Bound Service Account | `aws` secrets engine + IRSA | {{aws_irsa_ttl}} | K8s-native AWS auth with service accounts |

### Section 5: PKI / Certificate Management

| Use Case | Vault PKI Role | TTL | Rotation |
|---|---|---|---|
| Service Mesh (Istio) mTLS | Intermediate CA, per-service certificates | {{mesh_cert_ttl}} (24h recommended) | Automatic (Istio CSR integration) |
| Internal TLS (service-to-service) | Internal CA, per-service certificates | {{internal_cert_ttl}} (72h recommended) | Automatic via cert-manager + Vault issuer |
| Ingress TLS | Public or internal CA, per-ingress certificates | {{ingress_cert_ttl}} (90d) | Automatic via cert-manager + Vault issuer |

### Section 6: Service Account & Policy Design

```
# Policy structure: path-based, least privilege
path "secret/data/{{environment}}/{{team_name}}/*" {
  capabilities = ["read", "list"]
}

path "database/creds/{{team_name}}-*" {
  capabilities = ["read"]
}

path "pki/issue/{{team_name}}-*" {
  capabilities = ["create", "update"]
}

# Kubernetes auth role bound to service account
vault write auth/kubernetes/role/{{role_name}} \
    bound_service_account_names={{service_account_name}} \
    bound_service_account_namespaces={{namespace}} \
    policies={{policy_name}} \
    ttl={{token_ttl}}h
```

### Section 7: Audit & Compliance

| Audit Requirement | Implementation | Retention |
|---|---|---|
| **All secret access logged** | Vault audit log (file + syslog) to SIEM | {{audit_retention_days}} days |
| **Admin actions logged** | Vault audit log captures all `vault write` / `vault delete` | {{admin_audit_retention}} days |
| **Secret rotation verification** | Vault audit log shows `create` operations for dynamic secrets | {{rotation_retention}} days |
| **Access pattern alerting** | SIEM alerts on unusual secret access patterns (new paths, bulk reads) | Real-time |
| **Policy drift detection** | Vault policy stored in Git + drift check via `vault policy read` comparison | Per-CI run |

## output_format

Present as a Secrets Management Architecture Blueprint:

1. **Executive Summary** -- current state assessment, architecture recommendation, key decisions, security model
2. **Architecture Decision** -- self-managed vs managed vs cloud-native, with rationale
3. **Vault Deployment Architecture** -- HA configuration, storage backend, auto-unseal, networking, TLS, audit
4. **Kubernetes Integration** -- auth methods, CSI provider, sidecar injector, External Secrets Operator comparison
5. **Dynamic Secrets** -- database, cloud provider, and PKI dynamic secrets with TTL design
6. **Policy & RBAC** -- path-based policies, K8s auth roles, team namespace segregation
7. **Audit & Compliance** -- audit logging architecture, SIEM integration, retention, alerting
8. **Operations Runbook** -- upgrade procedure, seal/unseal, disaster recovery, performance tuning
9. **Migration Plan** -- from existing secrets approach to Vault, phased per namespace or team

## constraints

- Vault's root token should only be used for initial setup -- after that, use authenticated operators with appropriate policies
- Auto-unseal via cloud KMS is required for production -- Shamir unseal is not acceptable for production deployments
- Dynamic secrets should be preferred over static secrets for all database, cloud provider, and API credential use cases
- Kubernetes auth should be the primary authentication method for all workloads running in K8s -- avoid long-lived tokens
- Vault policies should follow least-privilege -- service identities should only have access to their own paths
- Static secrets in Vault kv must have a defined rotation schedule -- secrets without rotation dates accumulate risk
- Vault audit logs must be shipped to a SIEM or log aggregation service -- file-based audit logs on the pod are not sufficient for compliance
- The Vault CSI driver is preferred over the Agent sidecar for new deployments -- fewer containers, simpler architecture
- Cluster-admin access to Vault should be restricted to a small team and require break-glass procedures
- Vault version upgrades should be performed on a non-production cluster first, with a documented rollback plan
- Secret zeroization (deleting all copies of a secret) should be part of the offboarding process for any service or team
- Vault disaster recovery should be tested quarterly -- restore from backup, verify all secrets engines are functional, confirm audit logs are intact
