$scriptPath = Join-Path (Join-Path (Get-Location).Path "scripts") "validate-prompts.ps1"

Describe "validate-prompts.ps1" {
    It "exits 0 for a valid basic prompt" {
        $testPrompt = Join-Path $TestDrive "tax_corporate_basic_v1.md"
        @"
---
title: Test Prompt
service_line: tax
use_case_type: drafting
complexity_tier: basic
validation_status: draft
version: 1.0.0
---
## system_prompt
Test system prompt.
## user_prompt
Test user prompt.
## output_format
Markdown output.
"@ | Set-Content -Path $testPrompt -Encoding utf8

        $output = Join-Path $TestDrive "report.json"
        & $scriptPath -PromptPath $testPrompt -ComplexityTier basic -OutputPath $output 2>&1
        $LASTEXITCODE | Should Be 0
    }

    It "exits 0 for a valid advanced prompt" {
        $testPrompt = Join-Path $TestDrive "infra_k8s-debugging_advanced_v1.md"
        @"
---
title: Test Advanced Prompt
service_line: infrastructure
use_case_type: troubleshooting
complexity_tier: advanced
validation_status: draft
version: 1.0.0
---
## system_prompt
Test system prompt with detailed methodology.
## user_prompt
Test user prompt with {{variable}} placeholders.
## output_format
Structured markdown with sections.
"@ | Set-Content -Path $testPrompt -Encoding utf8

        $output = Join-Path $TestDrive "report.json"
        & $scriptPath -PromptPath $testPrompt -ComplexityTier advanced -OutputPath $output 2>&1
        $LASTEXITCODE | Should Be 0
    }

    It "exits 1 for a missing file" {
        $output = Join-Path $TestDrive "report.json"
        & $scriptPath -PromptPath "nonexistent.md" -OutputPath $output 2>&1
        $LASTEXITCODE | Should Be 1
    }

    It "exits 1 when frontmatter is missing" {
        $testPrompt = Join-Path $TestDrive "tax_corporate_basic_v1.md"
        "## system_prompt`nTest`n## user_prompt`nTest`n## output_format`nTest" | Set-Content -Path $testPrompt -Encoding utf8

        $output = Join-Path $TestDrive "report.json"
        & $scriptPath -PromptPath $testPrompt -OutputPath $output 2>&1
        $LASTEXITCODE | Should Be 1
    }

    It "exits 1 when required sections are missing" {
        $testPrompt = Join-Path $TestDrive "tax_corporate_basic_v1.md"
        @"
---
title: Test
service_line: tax
use_case_type: drafting
complexity_tier: basic
validation_status: draft
version: 1.0.0
---
## system_prompt
Test
"@ | Set-Content -Path $testPrompt -Encoding utf8

        $output = Join-Path $TestDrive "report.json"
        & $scriptPath -PromptPath $testPrompt -OutputPath $output 2>&1
        $LASTEXITCODE | Should Be 1
    }

    It "exits 1 for wrong naming convention" {
        $testPrompt = Join-Path $TestDrive "badfilename_v1.md"
        @"
---
title: Test
service_line: tax
use_case_type: drafting
complexity_tier: basic
validation_status: draft
version: 1.0.0
---
## system_prompt
Test
## user_prompt
Test
## output_format
Test
"@ | Set-Content -Path $testPrompt -Encoding utf8

        $output = Join-Path $TestDrive "report.json"
        & $scriptPath -PromptPath $testPrompt -OutputPath $output 2>&1
        $LASTEXITCODE | Should Be 1
    }

    It "accepts output path parameter" {
        $testPrompt = Join-Path $TestDrive "tax_corporate_basic_v1.md"
        @"
---
title: Test
service_line: tax
use_case_type: drafting
complexity_tier: basic
validation_status: draft
version: 1.0.0
---
## system_prompt
Test
## user_prompt
Test
## output_format
Test
"@ | Set-Content -Path $testPrompt -Encoding utf8

        $output = Join-Path $TestDrive "custom-report.json"
        & $scriptPath -PromptPath $testPrompt -OutputPath $output 2>&1
        Test-Path $output | Should Be $true
    }
}
