using namespace System.Collections.Generic

function Test-PromptAccuracy {
    param(
        [string]$ActualOutput,
        [string]$ExpectedOutput,
        [double]$Threshold = 0.85
    )

    $actual = $ActualOutput.ToLower().Trim()
    $expected = $ExpectedOutput.ToLower().Trim()

    if ([string]::IsNullOrWhiteSpace($actual) -and [string]::IsNullOrWhiteSpace($expected)) {
        return @{
            precision = 1.0
            recall = 1.0
            f1_score = 0
            threshold = $Threshold
            pass = $false
        }
    }

    $actualTokens = $actual -split '\s+' | Where-Object { $_ -ne '' }
    $expectedTokens = $expected -split '\s+' | Where-Object { $_ -ne '' }

    $common = $actualTokens | Where-Object { $_ -in $expectedTokens }
    $precision = if ($actualTokens.Count -gt 0) { [math]::Round($common.Count / $actualTokens.Count, 4) } else { 0 }
    $recall = if ($expectedTokens.Count -gt 0) { [math]::Round($common.Count / $expectedTokens.Count, 4) } else { 0 }
    $f1 = if (($precision + $recall) -gt 0) { [math]::Round(2 * ($precision * $recall) / ($precision + $recall), 4) } else { 0 }

    return @{
        precision = $precision
        recall = $recall
        f1_score = $f1
        threshold = $Threshold
        pass = ($f1 -ge $Threshold)
    }
}

function Test-HasHallucination {
    param(
        [string]$Output,
        [string[]]$KnownFacts,
        [string[]]$GroundTruth
    )

    $hallucinations = @()
    $outputLower = $Output.ToLower()

    # Check for numeric hallucinations (claims about numbers that aren't in ground truth)
    $numberMatches = [regex]::Matches($outputLower, '\b\d+(?:,\d{3})*(?:\.\d+)?%?\b')
    foreach ($num in $numberMatches) {
        $inGroundTruth = $false
        foreach ($truth in $GroundTruth) {
            if ($truth.ToLower().Contains($num.Value)) { $inGroundTruth = $true; break }
        }
        if (-not $inGroundTruth) {
            $hallucinations += @{
                type = "numeric"
                value = $num.Value
                context = $Output.Substring([Math]::Max(0, $num.Index - 30), [Math]::Min(60, $Output.Length - $num.Index))
            }
        }
    }

    # Check for citation hallucinations
    $citationMatches = [regex]::Matches($outputLower, '(?:irc|section|asc|au-c|gaap|gasb|fash)\s*\d+')
    foreach ($cite in $citationMatches) {
        $inFacts = $false
        foreach ($fact in $KnownFacts) {
            if ($fact.ToLower().Contains($cite.Value)) { $inFacts = $true; break }
        }
        if (-not $inFacts) {
            $hallucinations += @{
                type = "citation"
                value = $cite.Value
                context = $Output.Substring([Math]::Max(0, $cite.Index - 25), [Math]::Min(50, $Output.Length - $cite.Index))
            }
        }
    }

    return @{
        hallucination_count = $hallucinations.Count
        hallucinations = $hallucinations
        pass = ($hallucinations.Count -eq 0)
    }
}

function Test-FormatCompliance {
    param(
        [string]$Output,
        [string]$RequiredFormat,
        [hashtable]$FormatRules
    )

    $issues = @()

    switch ($RequiredFormat) {
        "json" {
            try { $null = $Output | ConvertFrom-Json } catch { $issues += "Invalid JSON format" }
        }
        "markdown" {
            if ($Output -notmatch '#') { $issues += "No markdown headers found" }
        }
        "table" {
            if ($Output -notmatch '\|.+\|') { $issues += "No table structure detected" }
        }
    }

    if ($FormatRules -and $FormatRules.ContainsKey("max_sections") -and $FormatRules.max_sections -gt 0) {
        $sectionCount = ([regex]::Matches($Output, '^#{2,3}\s', 'Multiline')).Count
        if ($sectionCount -gt $FormatRules.max_sections) {
            $issues += "Exceeds maximum sections: $sectionCount > $($FormatRules.max_sections)"
        }
    }

    if ($FormatRules -and $FormatRules.ContainsKey("required_disclaimer") -and $FormatRules.required_disclaimer) {
        if ($Output -notmatch $FormatRules.required_disclaimer) {
            $issues += "Missing required disclaimer"
        }
    }

    return @{
        format = $RequiredFormat
        issues = $issues
        pass = ($issues.Count -eq 0)
    }
}

function Measure-ResponseTime {
    param(
        [scriptblock]$PromptExecution,
        [int]$TimeoutMs = 30000
    )

    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $result = & $PromptExecution
    $sw.Stop()

    return @{
        response_time_ms = $sw.ElapsedMilliseconds
        timed_out = ($sw.ElapsedMilliseconds -ge $TimeoutMs)
        pass = ($sw.ElapsedMilliseconds -le 5000)
    }
}

function Invoke-PromptValidation {
    param(
        [Parameter(Mandatory)]
        [string]$PromptPath,
        [Parameter(Mandatory)]
        [hashtable]$TestSuite
    )

    $content = Get-Content $PromptPath -Raw

    # Strip YAML frontmatter before running content checks
    if ($content -match '^---\r?\n([\s\S]*?)\r?\n---') {
        $content = $content.Substring($Matches[0].Length).TrimStart()
    }

    $results = @{
        prompt = $PromptPath
        test_suite = $TestSuite.name
        timestamp = (Get-Date -Format "o")
        checks = @()
        overall = "pass"
    }

    # Accuracy check
    foreach ($test in $TestSuite.tests) {
        $accuracy = Test-PromptAccuracy -ActualOutput $test.actual -ExpectedOutput $test.expected -Threshold $TestSuite.threshold.accuracy
        $results.checks += @{
            test = $test.name
            type = "accuracy"
            result = $accuracy
        }
        if (-not $accuracy.pass) { $results.overall = "fail" }
    }

    # Hallucination check
    $hallucination = Test-HasHallucination -Output $content -KnownFacts $TestSuite.known_facts -GroundTruth $TestSuite.ground_truth
    $results.checks += @{
        test = "hallucination_detection"
        type = "hallucination"
        result = $hallucination
    }
    if (-not $hallucination.pass) { $results.overall = "fail" }

    # Format compliance
    $format = Test-FormatCompliance -Output $content -RequiredFormat $TestSuite.format.required -FormatRules $TestSuite.format.rules
    $results.checks += @{
        test = "format_compliance"
        type = "format"
        result = $format
    }
    if (-not $format.pass) { $results.overall = "fail" }

    return $results
}

# Functions are automatically exported when this is loaded as a module via Import-Module
