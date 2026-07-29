param(
    [string]$TestSuitesPath = "./testing/test-cases"
)

$ErrorActionPreference = "Stop"

$sep = [System.IO.Path]::DirectorySeparatorChar
$results = @{
    timestamp = (Get-Date -Format "o")
    suites_validated = 0
    suites_passed = 0
    suites_failed = 0
    failures = @()
}

$configPath = Join-Path (Join-Path (Resolve-Path ".") "config") "prompt-standards.json"
$config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
$validTiers = $config.standards.complexity_tiers | Get-Member -MemberType NoteProperty | ForEach-Object { $_.Name }

Get-ChildItem -Path $TestSuitesPath -Recurse -Filter "*.json" | ForEach-Object {
    $filePath = $_.FullName
    $rootLen = (Resolve-Path $TestSuitesPath).Path.Length
    $relativePath = $filePath.Substring($rootLen).TrimStart($sep).TrimStart("/")
    Write-Host "Validating test suite: $relativePath" -ForegroundColor Cyan

    $suiteFailures = @()

    try {
        $suite = Get-Content -LiteralPath $filePath -Raw | ConvertFrom-Json
    } catch {
        $suiteFailures += "Invalid JSON: $_"
        $results.failures += @{ suite = $relativePath; checks = $suiteFailures }
        $results.suites_failed++
        return
    }

    $requiredFields = @("name", "version", "prompt_ref", "service_line", "complexity_tier", "tests")
    foreach ($field in $requiredFields) {
        if (-not $suite.$field) {
            $suiteFailures += "Missing required field: $field"
        }
    }

    if ($suite.prompt_ref) {
        $promptPath = Join-Path (Resolve-Path ".") $suite.prompt_ref
        if (-not (Test-Path -LiteralPath $promptPath)) {
            $suiteFailures += "Referenced prompt not found: $($suite.prompt_ref)"
        }
    }

    if ($suite.complexity_tier -and $suite.complexity_tier -notin $validTiers) {
        $suiteFailures += "Invalid complexity_tier: $($suite.complexity_tier) (valid: $($validTiers -join ', '))"
    }

    if ($suite.format) {
        if (-not $suite.format.required) {
            $suiteFailures += "Missing format.required"
        }
    } else {
        $suiteFailures += "Missing format block"
    }

    if ($suite.tests) {
        $testIndex = 0
        foreach ($test in $suite.tests) {
            if (-not $test.name) {
                $suiteFailures += "Test #$testIndex missing 'name'"
            }
            if (-not $test.input) {
                $suiteFailures += "Test '$($test.name)' missing 'input'"
            }
            if (-not $test.expected) {
                $suiteFailures += "Test '$($test.name)' missing 'expected'"
            }
            $testIndex++
        }
    }

    if ($suite.known_facts -and $suite.known_facts.Count -eq 0) {
        $suiteFailures += "known_facts is empty"
    }
    if ($suite.ground_truth -and $suite.ground_truth.Count -eq 0) {
        $suiteFailures += "ground_truth is empty"
    }

    if ($suiteFailures.Count -gt 0) {
        $results.failures += @{ suite = $relativePath; checks = $suiteFailures }
        $results.suites_failed++
        Write-Host "  FAILED ($($suiteFailures.Count) issues)" -ForegroundColor Red
        foreach ($f in $suiteFailures) { Write-Host "    - $f" -ForegroundColor Red }
    } else {
        $results.suites_passed++
        Write-Host "  PASSED ($($suite.name) | tier=$($suite.complexity_tier) | $($suite.tests.Count) tests | format=$($suite.format.required))" -ForegroundColor Green
    }

    $results.suites_validated++
}

Write-Host "`n=== Results ===" -ForegroundColor Cyan
Write-Host "Validated: $($results.suites_validated), Passed: $($results.suites_passed), Failed: $($results.suites_failed)" -ForegroundColor $(if ($results.suites_failed -eq 0) { "Green" } else { "Red" })

$reportPath = Join-Path (Resolve-Path ".") "testing/reports/suite-validation-report.json"
$results | ConvertTo-Json -Depth 5 | Set-Content -Path $reportPath -Encoding utf8
Write-Host "Report written to $reportPath"

if ($results.suites_failed -gt 0) { exit 1 } else { exit 0 }
