---
title: Prometheus & Metrics Pipeline
service_line: infrastructure
subcategory: monitoring
use_case_type: implementation-guide
complexity_tier: advanced
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: observability-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["prometheus", "promql", "metrics-pipeline", "prometheus-operator", "alertmanager", "thanos", "mimir", "grafana", "monitoring", "claude"]
test_suites: []
---

## system_prompt

I've designed Prometheus-based metrics pipelines for platforms running tens of thousands of metrics series across hundreds of services. Prometheus is the standard for Kubernetes monitoring, but running it at scale introduces challenges that the quickstart guides don't cover: cardinality explosions, long-term storage, high-availability, and multi-cluster aggregation.

Here's what I've learned:

1. **Cardinality is the silent killer** -- a single misconfigured metric with a high-cardinality label (user_id, request_id, email) can consume gigabytes of memory and crash your Prometheus server. You need metric labeling standards and cardinality enforcement before you scale.
2. **Prometheus is not a long-term storage system** -- the local TSDB is great for short-term (15-30 days), but you need Thanos, Mimir, or Cortex for long-term retention, global querying, and multi-cluster aggregation.
3. **The Prometheus Operator is the right way to deploy on Kubernetes** -- ServiceMonitors, PodMonitors, and PrometheusRules are Kubernetes-native CRDs that let teams self-serve monitoring configuration without touching the Prometheus server config.
4. **Alertmanager routing is under-designed by most teams** -- a flat routing tree with one receiver is the default. You need routing trees based on severity, team, and environment, with inhibition rules to reduce noise and silences for planned maintenance.
5. **Recording rules should be your first optimization** -- expensive PromQL queries that run on every dashboard refresh should be pre-computed as recording rules. This is the single highest-impact optimization you can make.

## context

**Organization:**
- Name: {{organization_name}}
- Current Prometheus Maturity: {{prometheus_maturity}} (None / Basic (single server) / Prometheus Operator / Scaled (Thanos/Mimir) / Multi-cluster)
- Metrics Volume: {{metrics_series_count}} (active time series)
- Retention Requirement: {{retention_requirement}} ({{retention_days}} days)
- Number of Clusters: {{cluster_count}}
- Current Storage: {{storage_approach}} (Local TSDB / Thanos / Mimir / Cortex / VictoriaMetrics / Grafana Cloud)
- Prometheus Version: {{prometheus_version}}
- Grafana Version: {{grafana_version}}
- Alertmanager Configured: {{alertmanager_enabled}} (Yes / No)

## user_prompt

Design a Prometheus-based metrics pipeline for {{organization_name}}.

### Section 1: Architecture Design

**1a. Deployment Model**

| Component | Deployment | HA Configuration | Resource Sizing |
|---|---|---|---|
| **Prometheus (Server)** | Prometheus Operator (Kubernetes) | 2 replicas, `--shard` for HA, sidecar for Thanos upload | {{prometheus_resources}} (CPU/Memory per replica) |
| **Alertmanager** | Prometheus Operator (Kubernetes) | 3 replicas, gossip clustering, mesh replication | {{alertmanager_resources}} |
| **Prometheus Operator** | Helm chart (`kube-prometheus-stack`) | Single operator instance, manages multiple Prometheus CRDs | {{operator_resources}} |
| **Thanos Sidecar** | Sidecar to Prometheus (for Thanos-based storage) | 1 per Prometheus pod | {{thanos_sidecar_resources}} |
| **Thanos Query** | Separate deployment | 2+ replicas, with `--store` pointing to Thanos Sidecar + Object Store | {{thanos_query_resources}} |
| **Thanos Store Gateway** | Separate deployment | 2+ replicas, caching object store queries | {{thanos_store_resources}} |
| **Grafana** | Grafana Operator / Helm chart | HA (2+ replicas) with shared PostgreSQL session store, dashboards in Git | {{grafana_resources}} |

**1b. Multi-Cluster Architecture**

```
Cluster 1 (us-east-1)              Cluster 2 (eu-west-1)           Global
┌─────────────────────┐          ┌─────────────────────┐          ┌─────────────────┐
│ Prometheus ─── Thanos│          │ Prometheus ─── Thanos│          │ Thanos Query    │
│ Sidecar ──── S3      │          │ Sidecar ──── S3      │───────▶  │ (Global View)   │
│ ServiceMonitor CRDs  │          │ ServiceMonitor CRDs  │          │ ── Store GW (S3)│
│ Alertmanager         │          │ Alertmanager         │          │ ── Query Front  │
└─────────────────────┘          └─────────────────────┘          │ ── Grafana      │
                                                                    └─────────────────┘
```

### Section 2: Prometheus Operator Configuration

**2a. ServiceMonitor Design**

```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{service_name}}
  namespace: {{namespace}}
  labels:
    release: kube-prometheus-stack
    team: {{team_name}}
spec:
  selector:
    matchLabels:
      app: {{service_name}}
  namespaceSelector:
    matchNames:
      - {{namespace}}
  endpoints:
    - port: metrics
      interval: {{scrape_interval}}s
      scrapeTimeout: {{scrape_timeout}}s
      metricRelabelings:
        - sourceLabels: [__name__]
          regex: '.*(request_duration_seconds|requests_total|errors_total).*'
          action: keep
      relabelings:
        - sourceLabels: [__meta_kubernetes_pod_node_name]
          targetLabel: instance
          replacement: $1
```

| ServiceMonitor Field | Recommended Value | Rationale |
|---|---|---|
| `scrapeInterval` | {{global_scrape_interval}}s (default) | Override per ServiceMonitor for high-cardinality services |
| `scrapeTimeout` | {{global_scrape_timeout}}s (default) | Must be less than scrapeInterval |
| `metricRelabelings` | Drop high-cardinality labels | `__name__ != ".*(request_id|user_id|session_id).*"` |
| `honorLabels` | `false` (default) | Prevents scraped targets from overriding Prometheus labels |

**2b. PodMonitor Design (for non-Service endpoints)**

```yaml
apiVersion: monitoring.coreos.com/v1
kind: PodMonitor
metadata:
  name: {{pod_monitor_name}}
  namespace: {{namespace}}
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{app_name}}
  podMetricsEndpoints:
    - port: metrics
      interval: {{scrape_interval}}s
      relabelings:
        - action: labelmap
          regex: __meta_kubernetes_pod_label_(.+)
```

### Section 3: Metric Standards

**3a. Naming Convention**

| Pattern | Standard | Example |
|---|---|---|
| **Rate/Count** | `<namespace>_<service>_<metric>_total` | `http_requests_total` |
| **Duration** | `<namespace>_<service>_<metric>_duration_seconds` | `http_request_duration_seconds` |
| **Gauge** | `<namespace>_<service>_<metric>` | `http_requests_in_flight` |
| **Histogram** | `<namespace>_<service>_<metric>_duration_seconds` | `http_request_duration_seconds_bucket`, `_sum`, `_count` |
| **Summary** | `<namespace>_<service>_<metric>_duration_seconds` | `http_request_duration_seconds_summary{quantile="0.99"}` |

**3b. Required Labels**

| Label | Description | Example | Required |
|---|---|---|---|
| `service` | Service name | `payments-api` | Yes |
| `namespace` | Kubernetes namespace | `prod-payments` | Yes |
| `instance` | Node/pod identifier | `ip-10-0-1-23.ec2.internal` | Yes |
| `team` | Owning team | `payments-team` | Yes |
| `environment` | Deployment environment | `production` | Yes |
| `version` | Application version | `v1.2.3` | Recommended |

**3c. High-Cardinality Label Enforcement**

| Label | Cardinality Risk | Control | Action |
|---|---|---|---|
| `user_id` | EXTREME (millions) | Drop via `metricRelabelings` | `action: drop` on `user_id` |
| `request_id` | EXTREME (unbounded) | Drop via `metricRelabelings` | `action: drop` on `request_id` |
| `session_id` | EXTREME (unbounded) | Drop via `metricRelabelings` | `action: drop` on `session_id` |
| `customer_id` | HIGH (thousands to millions) | Drop or aggregate in application | Aggregate before exposing metric |
| `pod` | MODERATE (recycles) | Replace with `instance` via relabeling | `action: replace` with `instance` |
| `http_method` | LOW (<10) | Keep | Allow |
| `http_status` | LOW (<100) | Keep | Allow |
| `endpoint` | MODERATE (10-100) | Keep, but limit with histogram buckets | Ensure bounded endpoints |

### Section 4: PromQL & Recording Rules

**4a. Standard SRE Metrics (Recording Rules)**

```yaml
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: {{slo_rules_name}}
  namespace: {{namespace}}
spec:
  groups:
    - name: slo.rules
      interval: 30s
      rules:
        # Error Rate (Rate of 5xx / Total Rate)
        - record: namespace:error_rate:rate5m
          expr: |
            sum(rate(http_requests_total{status=~"5.."}[5m])) 
            / 
            sum(rate(http_requests_total[5m]))
        
        # Latency P99 (from histogram)
        - record: namespace:latency_p99:rate5m
          expr: |
            histogram_quantile(0.99, 
              sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service))
        
        # Apdex Score (satisfied + tolerating / total)
        - record: namespace:apdex_score:rate5m
          expr: |
            (sum(rate(http_request_duration_seconds_bucket{le="0.1"}[5m])) 
             + sum(rate(http_request_duration_seconds_bucket{le="0.3"}[5m])))
            / sum(rate(http_request_duration_seconds_count[5m]))
        
        # Error Budget Burn (30-day window)
        - record: namespace:error_budget_burn:rate30d
          expr: |
            1 - (sum(rate(http_requests_total{status=~"5.."}[30d])) 
                 / sum(rate(http_requests_total[30d])))
```

**4b. Common Aggregation Patterns**

| Pattern | PromQL | Use Case |
|---|---|---|
| Per-service error rate | `sum(rate(http_requests_total{status=~"5.."}[5m])) by (service)` | Service-level dashboard |
| P99 latency per endpoint | `histogram_quantile(0.99, sum(rate(http_request_duration_seconds_bucket[5m])) by (le, endpoint))` | Endpoint-level performance |
| CPU utilization rate | `rate(node_cpu_seconds_total{mode!="idle"}[5m])` | Node-level CPU usage |
| Memory utilization | `node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes` | Node-level memory usage |
| Container restarts | `sum(rate(kube_pod_container_status_restarts_total[5m])) by (namespace, pod)` | Pod stability monitoring |

### Section 5: Alerting

**5a. Alert Rules**

| Alert Name | Expression | Severity | Duration | Summary |
|---|---|---|---|---|
| **HighErrorRate** | `namespace:error_rate:rate5m > {{error_rate_threshold}}` | Critical | 5m | Error rate exceeds {{error_rate_threshold}} for 5 minutes |
| **HighLatencyP99** | `namespace:latency_p99:rate5m > {{latency_threshold}}` | Warning | 10m | P99 latency > {{latency_threshold}} for 10 minutes |
| **ErrorBudgetBurn** | `namespace:error_budget_burn:rate30d < {{error_budget_threshold}}` | Critical | 0m | Error budget consumed |
| **PodCrashLooping** | `rate(kube_pod_container_status_restarts_total[15m]) > {{restart_threshold}}` | Warning | 5m | Pod {{ $labels.pod }} is crash-looping |
| **PrometheusDown** | `absent(up{job="prometheus"})` | Critical | 1m | Prometheus is down |
| **HighCardinality** | `count by(__name__)({__name__=~".+"}) > {{cardinality_threshold}}` | Warning | 10m | Metric count exceeds {{cardinality_threshold}} |

**5b. Alertmanager Configuration**

| Feature | Configuration | Description |
|---|---|---|
| **Routing Tree** | Route by severity (critical -> real-time, warning -> business hours, info -> no notification) | Ensure critical alerts page on-call, warnings go to slack |
| **Grouping** | Group by `namespace` and `service` with 5m window | Prevent alert storms per service |
| **Inhibition Rules** | `source: HighErrorRate` inhibits `HighLatencyP99` and `PodCrashLooping` in the same namespace | Reduce noise when root cause is clear |
| **Silences** | Maintenance windows: `env="production", alertname="HighErrorRate", service="{{deploying_service}}"` during deploy | Planned deploys should not page |
| **Receivers** | Critical: PagerDuty + Slack, Warning: Slack only, Info: Dashboard annotation | Match notification urgency to severity |
| **Repeat Interval** | Critical: 1h, Warning: 4h, Info: 24h | Don't re-notify on every firing cycle |

### Section 6: Long-Term Storage

| Solution | Scalability | Retention | Query Capability | Operational Cost |
|---|---|---|---|---|
| **Local TSDB** | Single server | {{local_retention}}d | Per-cluster only | Low |
| **Thanos** | Multi-store, object storage backend | Unlimited (object store) | Global, cross-cluster query | Medium |
| **Mimir** | Horizontally scalable, microservices architecture | Unlimited | Global, multi-tenant, continuous query | High (but managed option available) |
| **VictoriaMetrics** | Single binary, vertical + horizontal scaling | Unlimited | Single-cluster view, cluster version supports global | Low-Medium |
| **Grafana Cloud** | Fully managed | Configurable | Global, Mimir-based | Pay-per-series |

**Recommendation:** {{storage_recommendation}} because {{storage_rationale}}.

## output_format

Present as a Prometheus & Metrics Pipeline Blueprint:

1. **Executive Summary** -- current metrics maturity, architecture decision, key risks, adoption roadmap
2. **Architecture Overview** -- deployment model for Prometheus, Alertmanager, Thanos/Mimir, Grafana with HA configuration
3. **ServiceMonitor & PodMonitor Design** -- CRD patterns, relabeling, metric filtering, scrape configuration
4. **Metric Standards** -- naming convention, required labels, cardinality enforcement, high-cardinality drop rules
5. **Recording Rules & PromQL Patterns** -- SLO metrics, common aggregations, dashboard queries, pre-computed rules
6. **Alerting** -- alert rules, Alertmanager routing, grouping, inhibition, silences, receivers, escalation
7. **Long-Term Storage** -- Thanos, Mimir, VictoriaMetrics comparison, selection, deployment, retention configuration
8. **Dashboard Strategy** -- Grafana dashboard structure, folder hierarchy, team-owned dashboards, Git-based dashboard management

## constraints

- High-cardinality labels (user_id, request_id, email, session_id) must be dropped at the scrape target or via metricRelabelings -- they must never reach the Prometheus TSDB
- The Prometheus Operator (kube-prometheus-stack) is the recommended deployment approach -- bare Prometheus configurations are not acceptable for production
- Recording rules should be used for any PromQL expression used in more than 3 dashboards or alerts -- compute once, query many times
- Alertmanager grouping should prevent alert storms -- group by namespace + service with a 5-minute window
- Multi-cluster metrics should be aggregated via Thanos Query (or Mimir/Cortex) -- each cluster's Prometheus should remain independent
- Scrape intervals below 15 seconds require justification -- most services do not need sub-15-second scrape resolution
- Alertmanager inhibition rules should be configured to prevent cascading alerts -- if the root cause (e.g., node failure) is already firing, downstream alerts should be inhibited
- PrometheusRule resources should be managed per-team (in their namespace) via the Prometheus Operator -- not centrally managed by the platform team
- Metric retention in local TSDB should not exceed 30 days for most use cases -- longer retention requires external storage (Thanos, Mimir)
- Grafana dashboards should be stored in Git and managed via Grafana Operator or provisioning -- manual dashboard creation in the UI is not acceptable for production
- Prometheus resource requests and limits must be set based on cardinality estimates -- under-provisioned Prometheus OOMs when metrics volume spikes
- Alertmanager should use gossip clustering for HA -- a single Alertmanager replica is a single point of failure for alert delivery
