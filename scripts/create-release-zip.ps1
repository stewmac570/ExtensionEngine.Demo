param(
    [string]$Configuration = "Release",
    [string]$OutputFolder = "C:\Temp\V6EngineBundle"
)

$ErrorActionPreference = "Stop"

Write-Host "Packing release bundle..."

$repoRoot   = Resolve-Path (Join-Path $PSScriptRoot "..")
$bundleRoot = Join-Path $OutputFolder "bundle"

if (Test-Path $bundleRoot) {
    Remove-Item $bundleRoot -Recurse -Force
}
New-Item -Path $bundleRoot -ItemType Directory -Force | Out-Null

# List of DLL projects to include in the bundle
$dllProjects = @(
    "GJames.Engine.Contracts",
    "GJames.Engine.Core",
    "GJames.Engine.Rules",
    "GJames.Engine.DataProviders",
    "GJames.Engine.Infrastructure",
    "GJames.V6.Adapter"
)

foreach ($proj in $dllProjects) {
    $dllPath = Join-Path $repoRoot ("src\{0}\bin\{1}\{0}.dll" -f $proj, $Configuration)
    if (-not (Test-Path $dllPath)) {
        Write-Warning "DLL not found: $dllPath (build may not have run)"
    } else {
        Copy-Item $dllPath $bundleRoot
    }
}

# Copy config templates
$configSource = Join-Path $repoRoot "config"
if (Test-Path $configSource) {
    Copy-Item (Join-Path $configSource "rules.json") $bundleRoot -ErrorAction SilentlyContinue
    Copy-Item (Join-Path $configSource "mpa.json") $bundleRoot -ErrorAction SilentlyContinue
}

# Version stamp placeholder
$versionFile = Join-Path $bundleRoot "version.txt"
"UNVERSIONED-LOCAL-BUILD" | Out-File -FilePath $versionFile -Encoding UTF8 -Force

# Create ZIP
$zipName = "GJames.V6.ExtensionEngine_LOCAL.zip"
$zipPath = Join-Path $OutputFolder $zipName

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($bundleRoot, $zipPath)

Write-Host "Bundle created at $zipPath"
