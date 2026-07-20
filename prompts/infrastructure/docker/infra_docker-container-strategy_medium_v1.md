---
title: Docker & Container Strategy
service_line: infrastructure
subcategory: docker
use_case_type: architecture-review
complexity_tier: medium
validation_status: draft
version: 1.0.0
author: sre-team
reviewer: devops-lead
created_date: 2026-07-23
last_modified: 2026-07-23
tags: ["docker", "containers", "container-image", "dockerfile", "multi-stage-build", "container-registry", "image-optimization", "container-security", "distroless", "claude"]
test_suites: []
---

## system_prompt

I've been building and containerizing applications since before Docker was the default -- I remember when "works on my machine" was actually a valid excuse. Containers solved that, but they introduced a whole new set of problems: bloated images, unnecessary layers, security vulnerabilities from base images, and registry sprawl.

The biggest mistake I see: teams treat their Dockerfile as an afterthought. They copy-paste a multi-stage build from a blog post, use `node:latest` as a base, and ship 1.2GB images to production. Then they wonder why their deploy times are 8 minutes and their surface area for vulnerabilities is enormous.

Here's what I've learned the hard way:

1. **Start distroless, add only what you need** -- `scratch`, `distroless`, or `alpine` base images. Your app needs a runtime, not a package manager and a shell.
2. **Multi-stage builds are not optional** -- one stage for build toolchains, one for runtime. Never ship a compiler to production.
3. **Pin everything** -- base image digests, not tags. `node:20` changes under you. `node:20@sha256:abc123` does not.
4. **Scan early, scan often** -- image scanning in CI/CD (Trivy, Snyk, Grype), not just in the registry. A known CVE in your base image is a deploy blocker.
5. **Registry hygiene matters** -- retention policies, immutable tags, signed images (Cosign), and least-privilege access to registries.

## context

**Organization:**
- Name: {{organization_name}}
- Application Type: {{app_type}} (Java / Node.js / Python / Go / .NET / Polyglot)
- Current Registry: {{container_registry}} (Docker Hub / ECR / ACR / GCR / Artifactory / Harbor / Quay)
- Number of Container Images: {{image_count}}
- Build System: {{build_system}} (GitHub Actions / Jenkins / GitLab CI / CircleCI / BuildKit)
- Image Size Range: {{image_size_range}} (MB -- average image size)
- Current Base Image Strategy: {{base_image_strategy}} (Alpine / Ubuntu / Distroless / Scratch / Mixed)
- Container Runtime: {{container_runtime}} (Docker Engine / containerd / CRI-O / Podman)
- Image Scanning Tool: {{scanning_tool}} (Trivy / Snyk / Grype / Clair / None)

## user_prompt

Design a container strategy for {{organization_name}} covering the full image lifecycle.

### Section 1: Base Image Strategy

| Application Type | Recommended Base | Rationale | Size Savings vs Default | CVE Surface |
|---|---|---|---|---|
| Go / Rust (static binaries) | `scratch` or `gcr.io/distroless/static` | No OS layer, truly minimal | ~800MB vs `golang:latest` | Near zero |
| Java (JRE only) | `eclipse-temurin:{{java_version}}-jre-alpine` or `gcr.io/distroless/java` | JRE without JDK, Alpine for libc | ~500MB vs `openjdk:latest` | Minimal |
| Node.js | `gcr.io/distroless/nodejs` or `node:{{node_version}}-alpine` | No npm/yarn at runtime, no build tools | ~700MB vs `node:latest` | Low |
| Python | `python:{{python_version}}-slim` or `gcr.io/distroless/python3` | No pip/compilers in production | ~600MB vs `python:latest` | Moderate |
| .NET | `mcr.microsoft.com/dotnet/aspnet:{{dotnet_version}}` | Microsoft official runtime-only image | ~1GB vs SDK image | Low |

**Base Image Decision Matrix:**

| Criteria | Scratch | Distroless | Alpine | Slim | Full |
|---|---|---|---|---|---|
| Image Size (MB) | 0-5 | 15-30 | 5-15 | 50-150 | 300-1500 |
| CVE Surface | Minimal | Minimal | Low | Moderate | High |
| Shell Access | None | None | BusyBox | Full | Full |
| Package Manager | None | None | apk | apt | apt |
| Debugging | Difficult (need `kubectl debug`) | Moderate | Easy | Easy | Easy |
| Compliance Best | Best | Best | Good | Fair | Poor |

**Recommendation:** {{base_image_recommendation}} targeting {{target_image_size_mb}} MB per image.

### Section 2: Dockerfile Best Practices

**2a. Structure & Layering**

```
# Stage 1: Build
FROM {{builder_image}} AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /app/server .

# Stage 2: Runtime
FROM {{runtime_image}}
WORKDIR /app
COPY --from=builder /app/server .
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
USER 10001:10001
EXPOSE 8080
ENTRYPOINT ["/app/server"]
```

**Layer Optimization Checklist:**

| Practice | Current State | Target State | Impact |
|---|---|---|---|
| Combine RUN commands to reduce layers | {{layer_consolidation_current}} | {{layer_consolidation_target}} | {{layer_consolidation_impact}} |
| Order layers by change frequency (least -> most) | {{layer_ordering_current}} | {{layer_ordering_target}} | {{layer_ordering_impact}} |
| Copy dependencies first, then source (cache optimization) | {{cache_optimization_current}} | {{cache_optimization_target}} | {{cache_optimization_impact}} |
| Use `--chown` to avoid post-copy permission changes | {{chown_current}} | {{chown_target}} | {{chown_impact}} |
| Remove package manager caches in build stage | {{cache_cleanup_current}} | {{cache_cleanup_target}} | {{cache_cleanup_impact}} |

**2b. Dockerfile Linting (Hadolint)**

| Rule | Severity | Current Compliance | Fix |
|---|---|---|---|
| Pin base image versions by digest (DL3006) | Error | {{dl3006_status}} | `FROM node:20@sha256:abc123` |
| Use WORKDIR instead of `cd` (DL3000) | Warning | {{dl3000_status}} | `WORKDIR /app` |
| Avoid `apt-get upgrade` (DL3005) | Error | {{dl3005_status}} | Remove, rebuild from patched base instead |
| Use COPY instead of ADD (DL3008) | Warning | {{dl3008_status}} | `COPY` for local files, `ADD` only for URLs/tars |
| Specify `--no-install-recommends` (DL3018) | Warning | {{dl3018_status}} | `apt-get install --no-install-recommends` |
| Don't use `latest` tag (DL3007) | Error | {{dl3007_status}} | Pin to specific version digest |

### Section 3: Registry Strategy

| Registry Feature | Current State | Target State | Implementation |
|---|---|---|---|
| Image Immutability | {{immutability_current}} | Immutable tags via digest pinning | {{immutability_implementation}} |
| Retention Policy | {{retention_current}} | {{retention_target}} (Keep last N versions, delete PR images after M days) | {{retention_implementation}} |
| Image Signing | {{signing_current}} | Cosign signing in CI/CD pipeline | {{signing_implementation}} |
| Vulnerability Scanning | {{scanning_current}} | Pre-push scan, block on critical CVEs | {{scanning_implementation}} |
| Access Control | {{access_current}} | Least-privilege IAM, scoped per repo | {{access_implementation}} |
| Geo-Replication | {{geo_current}} | {{geo_target}} (for global deploy speed) | {{geo_implementation}} |
| Pull Through Cache | {{cache_current}} | Mirror Docker Hub / public registries locally | {{cache_implementation}} |

### Section 4: CI/CD Container Pipeline

| Pipeline Stage | Tool | Action | Quality Gate |
|---|---|---|---|
| Build | Docker BuildKit / Kaniko | Build image with cached layers, multi-stage | Build succeeds |
| Lint | Hadolint | Check Dockerfile against best practices | No errors |
| Scan | Trivy / Snyk | Scan for CVEs in base image and dependencies | {{cve_threshold}}: Block on HIGH/CRITICAL |
| Sign | Cosign | Sign image with private key | Signature created and verified |
| Push | Docker / ORAS | Push to registry with digest tag and semantic tag | Push succeeds |
| Attest | Cosign + SLSA | Generate provenance attestation | Attestation stored in registry |
| Deploy | ArgoCD / Flux | Deploy image to {{environment}} | Health check passes |
| Runtime Scan | Trivy / Falco | Post-deploy image rescan + runtime monitoring | {{runtime_scan_threshold}} |

## output_format

Present as a Container Strategy Blueprint:

1. **Executive Summary** -- current state assessment, key findings, quick wins, strategic recommendations
2. **Base Image Strategy** -- per-language recommendations with rationale, size targets, CVE reduction estimates
3. **Dockerfile Best Practices** -- layer optimization, linting rules, cache strategy, security patterns
4. **Registry Strategy** -- configuration, retention, signing, scanning, access control, replication
5. **CI/CD Container Pipeline** -- end-to-end pipeline stages, tools, quality gates, automation
6. **Container Security** -- runtime security, rootless containers, seccomp, AppArmor, read-only root filesystem
7. **Migration Roadmap** -- phased plan for adopting new container practices across the organization

## constraints

- Rootless containers are the baseline for production -- `USER 10001:10001` or equivalent is not optional
- Image layers should be kept to a minimum -- each RUN, COPY, ADD adds a layer; combine where possible
- Base image digests must be pinned in all production Dockerfiles -- tag-based references are acceptable only for development
- Multi-stage builds are required for compiled languages (Go, Rust, Java, .NET, C/C++)
- Container images must be rebuilt at least monthly with updated base images to patch CVEs
- `latest` tag is forbidden in production -- all production deployments must reference semantic versions or commit SHAs
- Image scanning must be integrated into CI/CD as a quality gate -- post-push scanning is detective, not preventive
- Registry access must follow least-privilege -- developers should not have write access to production image repositories
- Container runtime security: no privileged containers, read-only rootfs, seccomp default profile, AppArmor/SELinux enabled
- Docker Hub rate limits apply to anonymous pulls -- use a pull-through cache or authenticated pulls for CI/CD
- Kubernetes Secrets (or External Secrets) should be used for registry credentials -- not environment variables or image pull secrets committed to repos
- Windows containers require different base images (`mcr.microsoft.com/windows/servercore`, `nanoserver`) -- the same principles apply but OS layer is unavoidably larger
