$scriptPath = Join-Path (Join-Path (Get-Location).Path "scripts") "tag-library.ps1"

Describe "tag-library.ps1" {
    It "runs successfully on the repo" {
        & $scriptPath -LibraryRoot "./prompts" -TaxonomyConfig "./config/library-taxonomy.json" 2>&1
        $? | Should Be $true
    }

    It "generates a prompt-library-index.json file" {
        & $scriptPath 2>&1
        $indexPath = Join-Path (Resolve-Path "prompts") "prompt-library-index.json"
        Test-Path $indexPath | Should Be $true
    }

    It "index contains service_line entries" {
        & $scriptPath 2>&1
        $index = Get-Content (Join-Path (Resolve-Path "prompts") "prompt-library-index.json") -Raw | ConvertFrom-Json
        $index | Should Not Be $null
        $index.Count | Should BeGreaterThan 0
    }

    It "index entries have required fields" {
        & $scriptPath 2>&1
        $index = Get-Content (Join-Path (Resolve-Path "prompts") "prompt-library-index.json") -Raw | ConvertFrom-Json
        foreach ($entry in $index) {
            $entry.file_path | Should Not Be $null
            $entry.filename | Should Not Be $null
            $entry.relative_path | Should Not Be $null
        }
    }

    It "reports error with missing taxonomy config" {
        try {
            & $scriptPath -TaxonomyConfig "nonexistent.json" 2>&1 | Out-Null
            throw "Expected error was not thrown"
        } catch {
            $_.Exception.Message | Should Match "Taxonomy config not found"
        }
    }

    It "handles an empty directory gracefully" {
        $emptyDir = Join-Path $env:TEMP "pwsh-tag-test-$(Get-Random)"
        New-Item -ItemType Directory -Path $emptyDir -Force | Out-Null
        try {
            & $scriptPath -LibraryRoot $emptyDir 2>&1 | Out-Null
            $? | Should Be $true
            $indexPath = Join-Path $emptyDir "prompt-library-index.json"
            Test-Path -LiteralPath $indexPath | Should Be $true
            $index = Get-Content -LiteralPath $indexPath -Raw -ErrorAction Stop | ConvertFrom-Json
            $index.Count | Should Be 0
        } finally {
            Remove-Item -LiteralPath $emptyDir -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}
