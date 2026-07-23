# Prompt Engineering Hub

I've spent 20+ years in solution architecture -- federal systems, cloud modernization, SRE, AI platforms, you name it. This repo is where I keep the prompts I wish I'd had on day one of every project.

The short version: every time someone on your team fires up Claude to draft a transfer pricing study or debug an EKS cluster, they're starting from zero. The quality depends entirely on how well they know how to prompt. This repo fixes that -- battle-tested prompts that encode decades of domain expertise into templates you can actually reuse.

If you're new: think of each file as a recipe. Pick the one that matches what you're doing, fill in the blanks (the `{{variable}}` placeholders), and get output that looks like a seasoned professional wrote it. Because someone who *is* a seasoned professional designed the prompt.

---

## What's in here

```text
prompt-engineering-hub/
├── prompts/              ← The library: 110 prompts across 13 service lines
├── skills/               ← Deployable Claude skills (workflows, components, agents)
├── patterns/             ← Reusable prompt engineering patterns (few-shot, CoT, RAG)
├── testing/              ← Validation so prompts don't regress
│   ├── frameworks/       ← PowerShell + Python test runners
│   ├── test-cases/       ← 30 test suites covering the prompt library
│   └── reports/          ← Validation outputs you can show auditors
├── knowledge-base/       ← Onboarding, architecture decisions, reference docs
├── training/             ← Enablement materials for the Ambassador program
├── scripts/              ← Automation (validation, tagging, library sync)
├── config/               ← Shared standards & taxonomy (JSON)
└── .github/              ← CI/CD that validates every prompt before deploy
```

---

## Who this is for

| Role | What they do here |
|------|-------------------|
| **Junior engineer** | Grab a prompt, fill in the blanks, produce senior-quality output on day one. The Infrastructure/SRE prompts are specifically designed so you can triage a Sev1 or debug a Kubernetes cluster without paging a principal. |
| **Tax / audit senior** | Draft transfer pricing studies, cost segregation reports, audit programs, SOC 2 reports, etc. The domain knowledge is built in -- you just customize for the specific client. |
| **Partner / director** | Standardize engagement delivery, reduce your review cycles, make sure every client gets the same baseline quality. Prompts enforce methodology so nothing falls through the cracks. |
| **Prompt engineer / Ambassador** | Build new prompts, maintain the library, run validation. You live in `testing/` and own the CI/CD pipeline. |
| **Skill developer** | Create deployable Claude skills from proven prompts. `skills/` workflows chain multiple prompts for complex use cases (tax return review, document analysis). |

---

## Service lines covered

| Service Line | Prompts | What you'll find |
|---|---|---|
| **Tax** | 10 | Corporate income, SALT nexus, R&D credits, cost segregation, transfer pricing, ASC 740 provisions, comp & benefits, individual HNW planning, nonprofit 501(c)(3), controversy, international, credits & incentives |
| **Assurance** | 7 | Audit procedures, SOC 2 reporting, ASC 606 revenue recognition, EBP audit, compilations, reviews, technical accounting, accounting services / monthly close |
| **Advisory** | 8 | Risk assessment, IPO readiness, CAS setup & transition, management consulting, deal advisory, digital transformation, forensic accounting, transaction advisory |
| **Architecture** | 10 | Analysis of alternatives, proposal writing, architecture narratives & white papers, solution workshop facilitation, cloud modernization roadmaps, SRE & observability strategy, disaster recovery & BCP, AI-enabled platform architecture, developer platform / paved roads, governance & compliance |
| **Digital Workplace** | 13 | EUC standards & XLAs, M365/Teams/Zoom/Slack hub strategy, operational resilience & DORA/SLO/SLI, Zero Trust & AI TRiSM, K8s paved roads & platform engineering, observability & user sentiment analytics, M&A tech due diligence, multi-cloud infrastructure, CI/CD DevSecOps toolchains, SRE / DORA metrics, agentic AI workflows, Secure SDLC & compliance (PCI/SOC 2/HIPAA/GDPR) |
| **Infrastructure / SRE** | 19 | Incident response, K8s debugging & architecture, Terraform module review & state management, CI/CD pipeline debug, vulnerability triage, Docker & containers, Helm chart authoring, GitOps (ArgoCD/Flux), service mesh (Istio), secrets management (Vault), Prometheus & metrics pipeline, monitoring setup, database tuning, cloud cost analysis, disaster recovery |
| **Transactions** | 6 | Quality of earnings, M&A tax structuring, business valuation & PPA, deal advisory, forensic dispute, IT due diligence, transaction tax / SALT planning |
| **Risk & Cybersecurity** | 17 | CMMC L2, ISO 27001/42001/42002, HIPAA, SOX, NIST CSF 2.0, CFIUS compliance & NSA oversight, defense & federal compliance (DFARS/FAR/CMMC 2.0/NERC CIP), NIST-ISO framework harmonization, GRC automation & AI-enabled compliance, cross-functional compliance operations, AI governance operating model, AI regulatory compliance strategy, AI model risk management lifecycle, responsible AI & ethics, AI assurance & audit |
| **Digital Advisory** | 4 | ERP system selection, AI strategy, analytics & automation, technology benchmarking |
| **Industry Verticals** | 6 | Healthcare, financial services, private equity, real estate & construction, not-for-profit grants, government contracting (DCAA) |
| **Wealth Management** | 3 | Retirement planning, securities compliance, client reporting & portfolio analysis |
| **Strategic Financing** | 3 | NMTC allocation, community development tax credits, opportunity zones |
| **People & Workforce** | 4 | Compensation benchmarking, HR compliance, fractional CFO, recruiting & talent acquisition |

---

## Prompt anatomy

Every prompt follows the same structure. Here's what each section means:

**YAML Frontmatter** --- Metadata for the CI/CD pipeline. Think of it like a nutrition label -- complexity tier (basic / medium / advanced), service line, tags. Example:

```yaml
title: Cost Segregation Study -- Engineering-Based Asset Classification
service_line: tax
subcategory: credits-incentives
complexity_tier: medium
tags: ["cost-segregation", "MACRS", "depreciation", "bonus-depreciation"]
```

**system_prompt** --- The brain. This tells the AI what expert it should be -- the methodology, regulations, and constraints a senior pro carries in their head. You should rarely need to touch this.

**context** --- Client parameters you know at engagement time (industry, revenue, location, entity type). Fill these in once and they stay.

**user_prompt** --- Where you do your work. Templates with `{{variable}}` placeholders for deal-specific numbers and facts. The variables are descriptively named so you know exactly what goes where.

**output_format** --- What the output should look like. Audit program, pricing memo, compliance checklist, dashboard blueprint. No guesswork.

**constraints** --- The "watch out for this" section. Hard lessons from years of practice. Things like "contemporaneous documentation must be prepared BEFORE filing the tax return" or "assembled workforce is NOT a recognized intangible under ASC 805." Miss these and your client loses money.

---

## How to use a prompt

1. **Find the right one** -- browse by `prompts/<service-line>/<subcategory>/`. Tax credit study? `prompts/tax/credits-incentives/`. Debugging a pod crash? `prompts/infrastructure/kubernetes/`.

2. **Check the frontmatter** -- "Basic" means you can use it with minimal domain knowledge. "Advanced" means you should talk to an SME -- the prompt handles complex scenarios but you need to know what you're filling in.

3. **Open the file** -- Read the system_prompt to understand what expert persona the AI will adopt. Then look at the context block to see what client info you need.

4. **Fill in the variables** -- Replace every `{{variable}}` with real data. If a variable doesn't apply, leave it blank or put "N/A."

5. **Run it** -- Paste system_prompt + context + user_prompt into Claude. The output follows the output_format structure.

6. **Review and customize** -- The prompt gets you 80% of the way. The last 20% is your judgment. Adjust for client specifics, add your own insights, make it yours.

---

## For junior engineers (Infrastructure/SRE prompts)

If you're supporting 400+ production apps on AWS/Azure and you just joined the team, these 19 prompts are your cheat codes. You can operate at a senior level with basic Linux and cloud knowledge:

- **Sev1 happening right now?** → `prompts/infrastructure/incident-response/infra_incident-triage_sev1-v2_v1.md` -- walks you through triage, containment, escalation, and fix steps with actual commands and diagnostic questions.
- **Pod won't start?** → `prompts/infrastructure/kubernetes/infra_k8s-debugging_medium_v1.md` -- covers CrashLoopBackOff, OOMKilled, ImagePullBackOff, and ten other failure modes with structured diagnosis trees.
- **Terraform PR to review?** → `prompts/infrastructure/terraform/infra_terraform-module-review_medium_v1.md` -- checks state management, security, cost, and maintainability. Gives you a scored review ready to paste into the PR.
- **CI/CD pipeline failing?** → `prompts/infrastructure/ci-cd/infra_cicd-pipeline-debug_v1.md` -- classifies failures by stage (build/test/deploy/infra) with fix patterns for each.
- **On call for the first time?** → `knowledge-base/onboarding/sre-devops-onboarding.md` -- what to do when you get paged, how to hand off, escalation tree, runbook locations.

---

## Infrastructure / SRE library

| Category | What it covers | File pattern |
|---|---|---|
| **Incident Response** | Sev1/Sev2 triage, root cause analysis, blameless post-mortems | `infra_incident-triage_*`, `infra_root-cause-analysis_*`, `infra_post-mortem-*` |
| **Kubernetes** | Pod debugging, cluster health, networking diagnostics | `infra_k8s-debugging_*` |
| **Terraform** | Module design review, IaC best practices, state management | `infra_terraform-module-review_*` |
| **CI/CD** | Pipeline failure classification and fix patterns | `infra_cicd-pipeline-debug_*` |
| **Security** | Vulnerability triage, CVE remediation, DevSecOps | `infra_vulnerability-triage_*` |
| **Monitoring** | RED/USE metrics, Prometheus/Grafana dashboards, alert rules | `infra_monitoring-setup_*` |
| **Database** | Slow query analysis, index strategy, connection pooling | `infra_db-performance-tuning_*` |
| **Cost Optimization** | FinOps, rightsizing, reserved instances, savings plans | `infra_cloud-cost-analysis_*` |
| **Disaster Recovery** | DR strategy, RTO/RPO definition, tabletop exercises, failover runbooks | `infra_dr-plan-review_*` |

---

## How to contribute

See `CONTRIBUTING.md` for the full playbook, but the basics:

1. **New prompt idea?** Open a GitHub Issue using the `use-case-intake.md` template
2. **Writing a prompt?** Follow the structure in `config/prompt-standards.json`
3. **Tagging?** Use the taxonomy in `config/library-taxonomy.json` -- don't invent new tags
4. **Validation?** Run `scripts/validate-prompts.ps1` before opening a PR
5. **Test suite?** Every prompt needs at least one test case in `testing/test-cases/`
6. **CI/CD?** Three GitHub Actions pipelines handle validation, skill deployment, and library sync -- don't bypass them

---

## Validation & quality

Every prompt goes through automated checks before it lands in the library:

- **Accuracy** -- Does it produce factually correct output? Tests compare against ground truth.
- **Hallucination** -- Does it invent regulations, code sections, or case law? Zero tolerance for this.
- **Format compliance** -- Does the output match the required structure? Sections, headings, disclaimers.
- **Response time** -- Is the prompt fast enough for production? Nobody waits 3 minutes for a prompt.
- **Edge cases** -- What happens with missing data, extreme values, or unusual client scenarios?

The test runner (`testing/frameworks/prompt-validator.ps1`) runs all of these automatically.

---

## Why I built it this way

- **YAML frontmatter?** So the CI/CD pipeline can parse, sort, filter, and validate prompts without reading the actual content. The library-sync workflow uses frontmatter tags to build a searchable index.
- **Double-brace variables?** Consistent with Jinja2 and Handlebars. Also trivial to find with regex (`\{\{.*?\}\}`) so validation can check all placeholders are filled before deployment.
- **Separate test suites?** Each test validates a specific input/output pair. When a prompt changes, you run the suite. Tests pass means the prompt still works. No regressions across 110 prompts.
- **Separate skills/ from prompts/?** A prompt is a single file. A skill is a deployable Claude configuration that may chain multiple prompts, include tool definitions, and have its own lifecycle. Keeping them separate lets me version each independently.

---

## Quick stats

- **110 prompts** across 13 service lines
- **36 test suites** with automated validation
- **19 infrastructure / SRE prompts** for cloud operations
- **17 risk & cybersecurity prompts** (CFIUS & NSA compliance, DFARS/FAR/CMMC 2.0, NIST CSF/800-53/800-171, ISO 27001/42001/42002, AI governance, HIPAA, SOX)
- **CI/CD** with GitHub Actions (validation + skill deployment + library sync)
