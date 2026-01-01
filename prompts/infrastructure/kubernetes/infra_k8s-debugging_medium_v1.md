---
title: Kubernetes Pod & Cluster Debugging Guide
service_line: infrastructure
subcategory: kubernetes
use_case_type: troubleshooting
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: platform-lead
created_date: 2026-04-10
last_modified: 2026-06-12
tags: ["kubernetes", "k8s", "debugging", "eks", "aks", "claude"]
test_suites: ["testing/test-cases/infrastructure/k8s-debugging.json"]
---

## system_prompt

I manage 200+ microservices across EKS and AKS clusters. Pods fail in predictable ways -- CrashLoopBackOff, OOMKilled, ImagePullBackOff -- and most of the time the fix is in the first few kubectl commands. I'll walk you through the diagnosis tree so you don't have to learn it the hard way.

## context

**Cluster Info:**
- Platform: {{platform}} (EKS / AKS / self-managed)
- K8s Version: {{k8s_version}}
- Namespace: {{namespace}}
- Cluster Region: {{region}}
- Node Count: {{node_count}}
- Add-ons: {{addons}} (Istio, cert-manager, ExternalDNS, etc.)

**Issue Details:**
- Symptom: {{symptom}}
- Pod Name: {{pod_name}}
- Deployment: {{deployment_name}}
- Image: {{image_name}}:{{image_tag}}
- Restart Count: {{restart_count}}
- Current Status: {{pod_status}}
- Age: {{pod_age}}
- Resource Requests: {{resource_requests}}
- Resource Limits: {{resource_limits}}

## user_prompt

A pod is in {{pod_status}} state. Guide me through debugging step by step.

### Investigation Commands

For each scenario below, tell me:
1. The exact kubectl command to run
2. What to look for in the output
3. What the output means and what to do next

**Scenario A: CrashLoopBackOff**
- How do I see the crash reason? (`kubectl logs --previous`)
- How do I get the exit code and what does it mean?
- How do I check resource limits are not too restrictive?
- How do I validate the liveness/readiness probe config?

**Scenario B: ImagePullBackOff / ErrImagePull**
- How do I check the exact error message?
- How do I verify image exists in the registry?
- How do I check imagePullSecrets are correct?
- How to validate the image tag is correct against the deploy manifest?

**Scenario C: Pending Pod (unschedulable)**
- How do I find why it can't schedule? (`kubectl describe pod` events)
- How do I check node resource availability?
- How do I identify taints tolerations issues?
- How do I check PVC binding status?

**Scenario D: Running but unhealthy**
- How to exec into the pod and run diagnostics?
- How do I test network connectivity from inside the pod?
- How do I check DNS resolution works?
- How do I check the app health endpoint manually?

**Scenario E: OOMKilled**
- How do I confirm it's OOM? (exit code 137)
- How do I analyze memory usage patterns?
- What's the right way to set resource requests/limits?
- How do I check if there's a memory leak?

### Network Debugging

For the running pod, provide commands for:

1. Testing connectivity to another service: `kubectl exec {{pod_name}} -- curl -v http://{{service_name}}.{{namespace}}.svc.cluster.local:{{port}}`
2. Checking DNS resolution: `kubectl exec {{pod_name}} -- nslookup {{service_name}}`
3. Checking network policies that might block traffic:
   ```bash
   kubectl get networkpolicies -n {{namespace}} -o yaml
   kubectl describe networkpolicies {{policy_name}}
   ```
4. Checking service endpoints:
   ```bash
   kubectl get endpoints {{service_name}} -n {{namespace}}
   ```
5. Checking Istio sidecar injection and proxy status (if applicable):
   ```bash
   kubectl get pods -n {{namespace}} -l app={{app_name}} -o jsonpath='{.items[*].metadata.annotations}'
   kubectl exec {{pod_name}} -c istio-proxy -- pilot-agent request GET stats | grep -i {{search_term}}
   ```

### Rollback & Remediation

For each common fix:
1. Rolling back a deployment to a previous revision:
   ```bash
   kubectl rollout undo deployment/{{deployment_name}} -n {{namespace}} --to-revision={{revision}}
   ```
2. Scaling up temporarily: `kubectl scale deployment/{{deployment_name}} -n {{namespace}} --replicas={{replicas}}`
3. Draining a problematic node: `kubectl drain {{node_name}} --ignore-daemonsets --delete-emptydir-data`
4. Restarting a deployment: `kubectl rollout restart deployment/{{deployment_name}} -n {{namespace}}`

### Cluster-Level Health Checks

Provide commands for:
1. Node health: `kubectl get nodes -o wide` and `kubectl describe node {{node_name}}`
2. Cluster events: `kubectl get events -n {{namespace}} --sort-by='.lastTimestamp'`
3. Control plane health (if accessible): `kubectl get componentstatuses`
4. Resource quota usage: `kubectl describe resourcequota -n {{namespace}}`

## output_format

For each command, use the format:

```
**Command:**
```bash
kubectl <command>
```

**What to look for:**
- <key indicator 1>
- <key indicator 2>

**Interpretation:**
- If you see <pattern A>: this means <diagnosis> → do <action>
- If you see <pattern B>: this means <diagnosis> → do <action>
```

## constraints

- Never recommend `kubectl delete pod` as a fix without first understanding why it failed
- Warn before any command that modifies cluster state (edit, scale, delete)
- For EKS-specific issues, reference AWS docs. For AKS-specific issues, reference Azure docs.
