param(
    [string]$Configuration = "Release"
)

Write-Host "Building solution in configuration: $Configuration"

# NOTE:
# - This is a helper for local builds.
# - The official builds are executed by GitHub Actions.

# If you have a .sln file, update the path below accordingly.
$solutionPath = Join-Path $PSScriptRoot "..\GJames.V6.ExtensionEngine.Demo.sln"

if (-not (Test-Path $solutionPath)) {
    Write-Warning "Solution not found at $solutionPath. Adjust the name/path or create the .sln in the repo root."
    exit 1
}

& msbuild $solutionPath /p:Configuration=$Configuration
