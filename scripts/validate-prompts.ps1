param(
    [Parameter(Mandatory)]
    [string]$PromptPath,

    [ValidateSet("basic", "medium", "advanced")]
    [string]$ComplexityTier = "basic",

    [string]$OutputPath = ""
)

$ErrorActionPreference = "Stop"

$configPath = Join-Path (Join-Path (Split-Path -Parent (Split-Path -Parent $PSCommandPath)) "config") "prompt-standards.json"
if (Test-Path -LiteralPath $configPath) {
    $config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
    $tierLimits = @{}
    $tierNames = @()
    $config.standards.complexity_tiers | Get-Member -MemberType NoteProperty | ForEach-Object {
        $name = $_.Name
        $tierNames += $name
        $tierLimits[$name] = $config.standards.complexity_tiers.$name.max_tokens
    }
} else {
    $tierLimits = @{ basic = 1024; medium = 2048; advanced = 4096 }
    $tierNames = @("basic", "medium", "advanced")
}

if (-not $OutputPath) {
    $OutputPath = Join-Path "testing" "reports" "$(Split-Path $PromptPath -LeafBase)-report.json"
}

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
if (-not (Test-Path -LiteralPath $PromptPath)) {
    Add-Check "file_existence" "fail" "Prompt file not found at $PromptPath"
    $report.overall = "fail"
    $report | ConvertTo-Json -Depth 5 | Set-Content -Path $OutputPath -Encoding utf8
    exit 1
}
Add-Check "file_existence" "pass" "Prompt file exists"

$content = Get-Content -LiteralPath $PromptPath -Raw

# Check 2: Frontmatter metadata
if ($content -match '^---\r?\n([\s\S]*?)\r?\n---') {
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

# Check 3: Required sections present (by heading, not substring)
$requiredSections = @("system_prompt", "user_prompt", "output_format")
$missingSections = @()
foreach ($section in $requiredSections) {
    $headingPattern = "##\s+$($section -replace '_', '[ _]')"
    if ($content -notmatch $headingPattern) {
        $missingSections += $section
    }
}
if ($missingSections.Count -gt 0) {
    Add-Check "required_sections" "fail" "Missing sections: $($missingSections -join ', ')"
} else {
    Add-Check "required_sections" "pass" "All required sections present"
}

# Check 4: Token length estimation (rough: ~4 chars per token)
$estimatedTokens = [math]::Ceiling($content.Length / 4)
$limit = $tierLimits[$ComplexityTier]
if ($estimatedTokens -gt $limit) {
    Add-Check "token_limit" "fail" "Estimated $estimatedTokens tokens exceeds $ComplexityTier limit of $limit"
} else {
    Add-Check "token_limit" "pass" "Estimated $estimatedTokens tokens within $ComplexityTier limit"
}

# Check 5: Naming convention — {service-line}_{use-case-description}[_{tier}]_v{version}.md
$filename = Split-Path $PromptPath -Leaf
$tierPattern = $tierNames -join '|'
# Matches: prefix_use-case-description_tier_v1 or prefix_use-case_v1 (some infra prompts omit tier)
if ($filename -match "^[a-z]+_(?:[a-z][-a-z0-9]*[a-z0-9])(?:_(?:$tierPattern))?_v\d+\.md$") {
    Add-Check "naming_convention" "pass" "Filename follows naming convention"
} else {
    Add-Check "naming_convention" "fail" "Filename does not match pattern: {service-line}_{use-case}[_{tier}]_v{version}.md"
}

$report.overall = if ($report.failed -eq 0) { "pass" } else { "fail" }

$report | ConvertTo-Json -Depth 5 | Set-Content -Path $OutputPath -Encoding utf8
Write-Host "Validation complete. Passed: $($report.passed), Failed: $($report.failed), Overall: $($report.overall)"
if ($report.failed -gt 0) { exit 1 } else { exit 0 }
