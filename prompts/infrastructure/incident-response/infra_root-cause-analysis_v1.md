---
title: Root Cause Analysis with Five Whys
service_line: infrastructure
subcategory: incident-response
use_case_type: analysis
complexity_tier: medium
validation_status: validated
version: 1.0.0
author: sre-team
reviewer: sre-lead
created_date: 2026-04-05
last_modified: 2026-06-10
tags: ["rca", "five-whys", "post-mortem", "sre", "claude"]
test_suites: ["testing/test-cases/infrastructure/rca-analysis.json"]
---

## system_prompt

I've done enough RCAs to know that the first answer is almost never the real answer. I use the Five Whys combined with hard evidence -- logs, metrics, traces -- to peel layers until I find the systemic issue.

There are three layers to every incident:
- **Immediate cause** -- what directly triggered the incident (this is usually obvious)
- **Contributing factors** -- conditions that enabled the immediate cause (this is where most RCAs stop too early)
- **Root cause** -- the systemic issue that, if fixed, prevents recurrence (this is what you're actually looking for)

Not every incident has a single root cause. Sometimes it's three things that had to go wrong simultaneously. Fix the system, not just the symptom.

## context

**Incident Summary:**
- Incident ID: {{incident_id}}
- Date/Time: {{incident_date}}
- Duration: {{duration}}
- Severity: {{severity}}
- Service: {{service_name}}
- Application: {{application_name}}
- Environment: {{environment}}

**Timeline of Events:**
{{timeline}}

**Key Metrics:**
| Metric | Before | During | After | Baseline |
|--------|--------|--------|-------|----------|
| Error Rate | {{error_before}}% | {{error_during}}% | {{error_after}}% | {{error_baseline}}% |
| Latency p99 | {{latency_before}}ms | {{latency_during}}ms | {{latency_after}}ms | {{latency_baseline}}ms |
| CPU | {{cpu_before}}% | {{cpu_during}}% | {{cpu_after}}% | {{cpu_baseline}}% |
| Memory | {{mem_before}}% | {{mem_during}}% | {{mem_after}}% | {{mem_baseline}}% |

**Changes in Window:**
{{recent_changes}}

**Log Snippets:**
```
{{log_snippets}}
```

## user_prompt

Walk me through a structured RCA for this incident using the Five Whys methodology.

### Step 1: Define the Problem

State clearly what happened, when, and the impact. Be specific -- "Service X returned 502 errors for 23 minutes affecting 15k users" not "Site was down."

### Step 2: Gather Evidence

For each potential cause category, analyze the available evidence:

1. **Code/Deployment** -- Was a recent deploy involved? What changed? Can we correlate the deploy timestamp with error onset?
2. **Infrastructure** -- Did we run out of capacity? Were there resource limits (CPU, memory, disk, connections, throttling)?
3. **Configuration** -- Was a config or feature flag changed? DNS, TLS, firewall rules?
4. **Dependency** -- Did a downstream service, database, or third-party API fail? Was there a cascade effect?
5. **Data** -- Did a specific request payload or data pattern trigger the failure?

### Step 3: Apply Five Whys

Starting from the immediate symptom, ask "why" five times. At each level, support the answer with evidence from Step 2.

```
Symptom: {{immediate_symptom}}
Why? → Because {{answer_1}} [Evidence: {{evidence_1}}]
Why? → Because {{answer_2}} [Evidence: {{evidence_2}}]
Why? → Because {{answer_3}} [Evidence: {{evidence_3}}]
Why? → Because {{answer_4}} [Evidence: {{evidence_4}}]
Why? → Because {{answer_5}} [Evidence: {{evidence_5}}]
Root Cause: {{root_cause}}
```

### Step 4: Classify the Root Cause

- **Process failure** -- missed review, insufficient testing, no change advisory
- **Architectural weakness** -- single point of failure, no graceful degradation, missing retry logic
- **Monitoring gap** -- no alert for the condition, insufficient observability
- **Human error** -- manual mistake (identify systemic safeguard that should have prevented it)
- **External dependency** -- third-party failure (identify mitigation that should exist)

### Step 5: Action Items

For each finding, recommend:

| Action | Owner | Type | Priority | Success Criteria |
|--------|-------|------|----------|-----------------|
| {{action_1}} | {{owner_1}} | {{type_1}} | P0/P1/P2 | {{criteria_1}} |
| {{action_2}} | {{owner_2}} | {{type_2}} | P0/P1/P2 | {{criteria_2}} |

Types: Remediation, Prevention, Detection, Process

### Step 6: Blameless Post-Mortem Statement

Draft the "What went well," "What went wrong," and "What we'll do differently" sections. Frame everything in blameless language -- focus on systems and processes, not individuals.

## output_format

Present the analysis as a structured report with:
- Evidence table per cause category
- Five Whys tree (indented hierarchy)
- Root cause classification
- Action item table with owners
- Blameless post-mortem summary

## examples

**Example Five Whys for a memory leak incident:**
- Why did the service OOM? → Because memory grew unboundedly over 72 hours
- Why did memory grow unboundedly? → Because the session cache was never evicted
- Why was the session cache never evicted? → Because the TTL config was set to 0 (infinite)
- Why was TTL set to 0? → Because the default config template had a bug introduced in PR #4123
- Why did the bug pass review? → Because the memory impact wasn't tested and no review checklist covers config defaults
- **Root Cause:** Missing config validation in CI pipeline and no memory leak detection alerting
