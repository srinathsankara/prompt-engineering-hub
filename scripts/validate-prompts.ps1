param(
    [Parameter(Mandatory)]
    [string]$PromptPath,

    [ValidateSet("basic", "medium", "advanced")]
    [string]$ComplexityTier = "basic",

    [string]$OutputPath = "./testing/reports/validation-report.json"
)

$ErrorActionPreference = "Stop"
$report = @{
    prompt_path = $PromptPath
    complexity_tier = $ComplexityTier
    timestamp = (Get-Date -Format "o")
    checks = @()
    passed = 0
    failed = 0
    overall = "pending"
}

function Add-Check {
    param($Name, $Status, $Message)
    $report.checks += @{
        check = $Name
        status = $Status
        message = $Message
    }
    if ($Status -eq "pass") { $report.passed++ } else { $report.failed++ }
}

# Check 1: File exists and is non-empty
if (-not (Test-Path $PromptPath)) {
    Add-Check "file_existence" "fail" "Prompt file not found at $PromptPath"
    $report.overall = "fail"
    $report | ConvertTo-Json -Depth 5 | Out-File $OutputPath
    exit 1
}
Add-Check "file_existence" "pass" "Prompt file exists"

$content = Get-Content $PromptPath -Raw

# Check 2: Frontmatter metadata
if ($content -match '^---\n([\s\S]*?)\n---') {
    $frontmatter = $Matches[1]
    $requiredFields = @("title", "service_line", "use_case_type", "complexity_tier", "validation_status", "version")
    $missingFields = $requiredFields | Where-Object { $frontmatter -notmatch "$_" }
    if ($missingFields.Count -gt 0) {
        Add-Check "metadata_frontmatter" "fail" "Missing required fields: $($missingFields -join ', ')"
    } else {
        Add-Check "metadata_frontmatter" "pass" "All required frontmatter fields present"
    }
} else {
    Add-Check "metadata_frontmatter" "fail" "No YAML frontmatter found"
}

# Check 3: Required sections present
$requiredSections = @("system_prompt", "user_prompt", "output_format")
$missingSections = $requiredSections | Where-Object { $content -notmatch $_.Replace("_", " ") -and $content -notmatch "\#\s*$_" }
if ($missingSections.Count -gt 0) {
    Add-Check "required_sections" "fail" "Missing sections: $($missingSections -join ', ')"
} else {
    Add-Check "required_sections" "pass" "All required sections present"
}

# Check 4: Token length estimation (rough: ~4 chars per token)
$estimatedTokens = [math]::Ceiling($content.Length / 4)
$tierLimits = @{ basic = 1024; medium = 2048; advanced = 4096 }
$limit = $tierLimits[$ComplexityTier]
if ($estimatedTokens -gt $limit) {
    Add-Check "token_limit" "fail" "Estimated $estimatedTokens tokens exceeds $ComplexityTier limit of $limit"
} else {
    Add-Check "token_limit" "pass" "Estimated $estimatedTokens tokens within $ComplexityTier limit"
}

# Check 5: Naming convention
$filename = Split-Path $PromptPath -Leaf
if ($filename -match '^[a-z]+_[a-z]+_[a-z]+_v\d+') {
    Add-Check "naming_convention" "pass" "Filename follows naming convention"
} else {
    Add-Check "naming_convention" "fail" "Filename does not follow pattern: {service-line}_{use-case}_{tier}_v{version}"
}

$report.overall = if ($report.failed -eq 0) { "pass" } else { "fail" }

$report | ConvertTo-Json -Depth 5 | Out-File $OutputPath
Write-Host "Validation complete. Passed: $($report.passed), Failed: $($report.failed), Overall: $($report.overall)"
exit ($report.failed -gt 0 ? 1 : 0)
