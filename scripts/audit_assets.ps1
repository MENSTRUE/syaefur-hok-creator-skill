# SYAEFUR HOK Creator Studio - Read-only local asset inventory
# Usage: powershell -ExecutionPolicy Bypass -File .\scripts\audit_assets.ps1 -SourceRoot "D:\content"
[CmdletBinding()]
param(
    [string]$SourceRoot = 'D:\content',
    [string]$OutputFile = ''
)

$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $SourceRoot -PathType Container)) {
    throw "Folder not found: $SourceRoot"
}
$resolved = (Resolve-Path -LiteralPath $SourceRoot).Path
if ([string]::IsNullOrWhiteSpace($OutputFile)) {
    $OutputFile = Join-Path (Split-Path -Parent $PSScriptRoot) 'reports\asset_manifest.csv'
}
$destination = Split-Path -Parent $OutputFile
if (-not (Test-Path -LiteralPath $destination)) {
    New-Item -ItemType Directory -Force -Path $destination | Out-Null
}

function Get-AssetGroup([string]$p) {
    $lower = $p.ToLowerInvariant()
    if ($lower -match '03_mulut|mulut|mouth') { return 'mascot_mouth' }
    if ($lower -match '02_mata|mata_alis|eyebrow|eyelid') { return 'mascot_eyes_brows' }
    if ($lower -match '01_rambut|rambut|hair') { return 'mascot_hair' }
    if ($lower -match '04_badan|badan_aksesoris|accessor') { return 'mascot_body_accessory' }
    if ($lower -match '00_karakter|character asset|maskot|mascot') { return 'mascot_candidate' }
    if ($lower -match '\\sound\\|\\audio\\|\\sfx\\') { return 'audio_candidate' }
    if ($lower -match 'background play hok|hok_assets|gameplay') { return 'game_asset_candidate' }
    if ($lower -match '\\youtube\\') { return 'youtube_media_candidate' }
    return 'unclassified'
}

$skipDirs = @('\node_modules\', '\.git\', '\.venv\', '\__pycache__\', '\productions\')
$items = Get-ChildItem -LiteralPath $resolved -File -Recurse -Force -ErrorAction SilentlyContinue |
    Where-Object {
        $p = $_.FullName.ToLowerInvariant()
        $skip = $false
        foreach ($s in $skipDirs) { if ($p.Contains($s)) { $skip = $true; break } }
        -not $skip
    } |
    Sort-Object FullName |
    ForEach-Object {
        [PSCustomObject]@{
            filename         = $_.Name
            full_path        = $_.FullName
            relative_path    = $_.FullName.Substring($resolved.TrimEnd('\').Length).TrimStart('\')
            ext              = $_.Extension.ToLowerInvariant()
            size_bytes       = $_.Length
            category_hint    = Get-AssetGroup $_.FullName
            modified_local   = $_.LastWriteTime.ToString('yyyy-MM-dd HH:mm:ss')
            contents_checked = 'NO - filename and metadata only'
            license_status   = 'UNKNOWN'
            notes            = ''
        }
    }
$items | Export-Csv -LiteralPath $OutputFile -NoTypeInformation -Encoding UTF8
Write-Host "Asset manifest: $OutputFile"
Write-Host ("Files indexed: " + @($items).Count)
Write-Host 'Read-only: source media were not modified or opened.'
Write-Host 'Review paths for private information before sharing the manifest.'
