# Contributing to the Prompt Engineering Hub

## How to Contribute

### 1. Use Case Intake

Before building, open a [Use Case Intake issue](.github/ISSUE_TEMPLATE/use-case-intake.md) to get your idea triaged by the Workflow Architect. This ensures alignment with the production roadmap and avoids duplicate work.

### 2. Branch Naming

```
{type}/{service-line}/{short-description}
```

Examples:
- `feat/tax/corporate-income-deduction-prompt`
- `fix/assurance/audit-risk-formatting`
- `docs/advisory/risk-methodology-update`

Types: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`

### 3. Prompt Authoring

- Follow the architecture standards in `config/prompt-standards.json`
- Include all required frontmatter metadata
- Use `{{variable_name}}` for injection points
- Include at least one test case in `testing/test-cases/`
- Run validation before opening a PR:
  ```bash
  pwsh ./scripts/validate-prompts.ps1 -PromptPath "path/to/your-prompt.md" -ComplexityTier <tier>
  ```

### 4. Testing Requirements

| Tier | Required Tests |
|---|---|
| Basic | 1 accuracy test, format compliance |
| Medium | 2+ accuracy tests, 1 edge case, format compliance |
| Advanced | 3+ accuracy tests, 2+ edge cases, hallucination check, compliance check |

### 5. Pull Request Process

1. PR title format: `{type}({scope}): {description}`
2. Reference the intake issue number
3. Include validation report output
4. Tag the appropriate SME for review based on CODEOWNERS
5. PR is merged after:
   - All CI checks pass
   - SME approves
   - Workflow Architect signs off (for advanced prompts)

### 6. Review Criteria

| Criterion | Description |
|---|---|
| Accuracy | Does the prompt produce correct domain-specific output? |
| Consistency | Does the prompt produce consistent results across similar inputs? |
| Robustness | Does the prompt handle edge cases gracefully? |
| Compliance | Does the output include required disclaimers and meet regulatory standards? |
| Performance | Does the prompt complete within SLA? |
| Reusability | Can other teams adapt this prompt for related use cases? |

### 7. Versioning

Follow the versioning strategy in `knowledge-base/architecture/prompt-architecture.md`.

### 8. Library Maintenance

After merge, the library index is automatically rebuilt. Run locally if you need an immediate update:
```bash
pwsh ./scripts/tag-library.ps1
```
