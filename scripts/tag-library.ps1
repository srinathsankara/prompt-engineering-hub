param(
    [string]$LibraryRoot = "./prompts",
    [string]$TaxonomyConfig = "./config/library-taxonomy.json"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $TaxonomyConfig)) {
    throw "Taxonomy config not found: $TaxonomyConfig"
}

$taxonomy = Get-Content -LiteralPath $TaxonomyConfig -Raw | ConvertFrom-Json
$index = @()

Write-Host "Scanning prompt library at $(Resolve-Path $LibraryRoot)..."

$sep = [System.IO.Path]::DirectorySeparatorChar

Get-ChildItem -Path $LibraryRoot -Recurse -File -Filter "*.md" | ForEach-Object {
    $content = Get-Content -LiteralPath $_.FullName -Raw
    $relative = $_.FullName.Substring((Resolve-Path $LibraryRoot).Path.Length).TrimStart($sep).TrimStart("/")
    $entry = @{
        file_path = $_.FullName
        relative_path = $relative
        filename = $_.Name
        last_modified = $_.LastWriteTime.ToString("o")
        size_bytes = $_.Length
    }

    # Extract frontmatter
    if ($content -match '^---\r?\n([\s\S]*?)\r?\n---') {
        $fm = $Matches[1]
        $kvPairs = [regex]::Matches($fm, '(?m)^(\w+):\s*(.+)$')
        foreach ($kv in $kvPairs) {
            $key = $kv.Groups[1].Value.Trim()
            $value = $kv.Groups[2].Value.Trim().Trim('"')
            $entry[$key] = $value
        }
    }

    # Auto-tag based on directory path
    $pathParts = $_.DirectoryName.Split($sep)
    $serviceLineIndex = [array]::IndexOf($pathParts, "prompts") + 1
    if ($serviceLineIndex -gt 0 -and $serviceLineIndex -lt $pathParts.Length) {
        $entry["directory_service_line"] = $pathParts[$serviceLineIndex]
        if ($serviceLineIndex + 1 -lt $pathParts.Length) {
            $entry["directory_subcategory"] = $pathParts[$serviceLineIndex + 1]
        }
    }

    # Validate against taxonomy
    if ($entry["service_line"] -and $entry["complexity_tier"]) {
        $validTiers = $taxonomy.taxonomy.complexity_tiers
        if ($entry["complexity_tier"] -notin $validTiers) {
            Write-Warning "Invalid complexity tier '$($entry["complexity_tier"])' in $($entry.relative_path)"
        }
        $entry["validated_against_taxonomy"] = $true
    } else {
        $entry["validated_against_taxonomy"] = $false
    }

    $index += $entry
}

# Write index
$indexPath = Join-Path $LibraryRoot "prompt-library-index.json"
$json = $index | Sort-Object @{E="service_line"; Desc=$false}, @{E="complexity_tier"; Desc=$false} | ConvertTo-Json -Depth 5
if ($null -eq $json) { $json = "[]" }
$json | Set-Content -Path $indexPath -Encoding utf8

Write-Host "Library scan complete. Indexed $($index.Count) prompts."
Write-Host "Index written to $indexPath"

$index | Group-Object service_line | ForEach-Object {
    $validated = ($_.Group | Where-Object { $_.validated_against_taxonomy -eq $true }).Count
    Write-Host "  $($_.Name): $($_.Count) prompts ($validated validated)"
}

exit 0
