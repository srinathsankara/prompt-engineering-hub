$modulePath = Join-Path (Split-Path $PSCommandPath -Parent | Split-Path -Parent) "prompt-validator.ps1"
Import-Module $modulePath -Force

Describe "Test-PromptAccuracy" {
    It "returns pass when F1 meets threshold" {
        $result = Test-PromptAccuracy -ActualOutput "hello world test" -ExpectedOutput "hello world test" -Threshold 0.8
        $result.pass | Should Be $true
    }

    It "returns fail when F1 is below threshold" {
        $result = Test-PromptAccuracy -ActualOutput "completely different" -ExpectedOutput "hello world test" -Threshold 0.8
        $result.pass | Should Be $false
    }

    It "handles empty strings" {
        $result = Test-PromptAccuracy -ActualOutput "" -ExpectedOutput "" -Threshold 0.5
        $result.pass | Should Be $false
    }
}

Describe "Test-HasHallucination" {
    It "passes when no numeric hallucination" {
        $result = Test-HasHallucination -Output "The rate is 20%" -GroundTruth @("20% rate", "standard rate")
        $result.pass | Should Be $true
    }

    It "fails when numeric claim not in ground truth" {
        $result = Test-HasHallucination -Output "The penalty rate is 50%" -GroundTruth @("standard rate is 20%")
        $result.pass | Should Be $false
        $result.hallucination_count | Should BeGreaterThan 0
    }
}

Describe "Test-FormatCompliance" {
    It "detects markdown format" {
        $result = Test-FormatCompliance -Output "# Header`nContent" -RequiredFormat "markdown"
        $result.pass | Should Be $true
    }

    It "detects missing markdown" {
        $result = Test-FormatCompliance -Output "No headers here" -RequiredFormat "markdown"
        $result.pass | Should Be $false
    }

    It "validates max sections constraint" {
        $output = "# H1`n## H2`n### H3`n## H4"
        $result = Test-FormatCompliance -Output $output -RequiredFormat "markdown" -FormatRules @{ max_sections = 2 }
        $result.pass | Should Be $false
    }

    It "validates JSON format" {
        $result = Test-FormatCompliance -Output '{"key": "value"}' -RequiredFormat "json"
        $result.pass | Should Be $true
    }

    It "rejects invalid JSON" {
        $result = Test-FormatCompliance -Output "not json" -RequiredFormat "json"
        $result.pass | Should Be $false
    }

    It "validates table format" {
        $result = Test-FormatCompliance -Output "| Col1 | Col2 |`n|------|------|" -RequiredFormat "table"
        $result.pass | Should Be $true
    }

    It "handles null FormatRules" {
        $result = Test-FormatCompliance -Output "# Header" -RequiredFormat "markdown" -FormatRules $null
        $result.pass | Should Be $true
    }
}

Describe "Measure-ResponseTime" {
    It "returns timing for a fast scriptblock" {
        $result = Measure-ResponseTime -PromptExecution { Start-Sleep -Milliseconds 10; "done" }
        $result.response_time_ms | Should BeGreaterThan 0
        $result.pass | Should Be $true
        $result.timed_out | Should Be $false
    }

    It "sets timed_out when exceeding timeout" {
        $result = Measure-ResponseTime -PromptExecution { Start-Sleep -Seconds 1; "done" } -TimeoutMs 100
        $result.timed_out | Should Be $true
    }

    It "passes with response under 5s" {
        $result = Measure-ResponseTime -PromptExecution { "fast response" }
        $result.pass | Should Be $true
    }
}

Describe "Invoke-PromptValidation" {
    It "returns overall pass for valid test suite" {
        $testPath = Join-Path $TestDrive "test_prompt.md"
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
Test with 20% rate.
## user_prompt
Test user prompt.
## output_format
Markdown.
"@ | Set-Content -Path $testPath -Encoding utf8

        $suite = @{
            name = "test-suite"
            tests = @(
                @{ name = "t1"; actual = "hello world"; expected = "hello world" }
            )
            threshold = @{ accuracy = 0.5 }
            known_facts = @("20% rate is standard")
            ground_truth = @("20% rate")
            format = @{ required = "markdown"; rules = @{} }
        }

        $result = Invoke-PromptValidation -PromptPath $testPath -TestSuite $suite
        $result.overall | Should Be "pass"
        $result.checks.Count | Should BeGreaterThan 0
    }

    It "reports failures for mismatched accuracy" {
        $testPath = Join-Path $TestDrive "test_prompt2.md"
        "## system_prompt`nTest" | Set-Content -Path $testPath -Encoding utf8

        $suite = @{
            name = "bad-suite"
            tests = @(
                @{ name = "t1"; actual = "completely different"; expected = "hello world" }
            )
            threshold = @{ accuracy = 0.9 }
            known_facts = @()
            ground_truth = @()
            format = @{ required = "table"; rules = @{} }
        }

        $result = Invoke-PromptValidation -PromptPath $testPath -TestSuite $suite
        $result.overall | Should Be "fail"
    }
}
