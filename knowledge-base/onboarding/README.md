# Onboarding Guide

Welcome to the Prompt Engineering Hub. This guide will get you set up to contribute prompts, skills, and testing to the firm's AI practice.

## Prerequisites

- Access to the firm's AI platform (Claude, Copilot, etc.)
- Git installed and configured with your GitHub account
- PowerShell 7+ (for validation scripts)
- Access to the prompt library repository

## Setup

```bash
# Clone the repository
git clone <repo-url>
cd prompt-engineering-hub

# Verify the structure
ls prompts/
ls skills/
ls config/

# Run a validation test to confirm your environment works
pwsh ./scripts/validate-prompts.ps1 -PromptPath ./prompts/tax/corporate/tax_corporate-income_basic_v1.md -ComplexityTier basic
```

## First Tasks

1. **Read the standards** -- Start with `knowledge-base/architecture/prompt-architecture.md` and `config/prompt-standards.json`
2. **Explore the library** -- Review existing prompts in your assigned service line
3. **Understand the taxonomy** -- Read `config/library-taxonomy.json` to understand how prompts are categorized
4. **Run existing tests** -- Execute validation on a production prompt to see the testing framework in action
5. **Submit a prompt** -- Follow the prompt template structure and open a PR

## Working with Service Line SMEs

- Schedule a 30-minute session with the assigned SME for your service line
- Review 2-3 existing prompts together to calibrate quality expectations
- Identify the top 3 use cases in their workflow that would benefit from AI
- Document domain-specific terminology, references, and conventions they use

## Validation Workflow

```
Write prompt -> Self-validate -> Peer review -> SME approval -> Tag & merge -> Monitor
```

## Daily Tools

- `scripts/validate-prompts.ps1` -- Validate individual prompt files
- `scripts/tag-library.ps1` -- Rebuild the prompt library index
- `testing/frameworks/prompt-validator.ps1` -- Run accuracy, hallucination, and format tests
- `.github/workflows/prompt-validation.yml` -- CI pipeline (runs on PRs)

## Key Contacts

- **Workflow Architect** -- Architectural standards and pattern decisions
- **Service Line SME** -- Domain accuracy and terminology
- **Ambassador Lead** -- Training and deployment support
- **Platform Admin** -- Model access and environment setup
