# SYAEFUR HOK Creator Studio - Create a new non-destructive episode workspace
# Usage: powershell -ExecutionPolicy Bypass -File .\scripts\new_episode.ps1 -Title "Macro Objektif" -OutputRoot "D:\content\productions"
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Title,
    [string]$OutputRoot = 'D:\content\productions',
    [string]$Date = ''
)
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($Date)) { $Date = Get-Date -Format 'yyyy-MM-dd' }
$slug = ($Title.ToLowerInvariant() -replace '\s+', '-' -replace '[^a-z0-9_-]', '').Trim('-')
if ([string]::IsNullOrWhiteSpace($slug)) { $slug = 'episode' }
New-Item -ItemType Directory -Force -Path $OutputRoot | Out-Null
$baseName = "$Date`_$slug"
$target = Join-Path $OutputRoot $baseName
$n = 2
while (Test-Path -LiteralPath $target) {
    $target = Join-Path $OutputRoot "$baseName`_$n"
    $n++
}
New-Item -ItemType Directory -Path $target | Out-Null
@('01_raw','02_voice','03_assets_used','04_premiere_project','05_exports_long','06_exports_short','07_subtitles','08_thumbnail','09_notes') |
    ForEach-Object { New-Item -ItemType Directory -Path (Join-Path $target $_) | Out-Null }

$brief = @"
# $Title

Date: $Date
Mode: [DAILY/NEWS/HERO/RAW/LONG-FIRST]
Status: IDEA
HOK official sources: [if news, fill verified links]
Raw assets: [link existing original files; do not move them]
Main format: [16:9 long / 9:16 short]
Goal: [one clear viewer question]
Recording plan: [ ]
Editing plan: [ ]
Export: [ ]
Published URL: [ ]
HOK Studio submission: [NOT CHECKED]
"@
Set-Content -LiteralPath (Join-Path $target '09_notes\brief.md') -Value $brief -Encoding UTF8
$cut = "output_in,output_out,source_file,source_in,source_out,voice_line,visual,mascot,sfx,transition,source_verified`r`n"
Set-Content -LiteralPath (Join-Path $target '09_notes\edit_cutlist.csv') -Value $cut -Encoding UTF8
Write-Host "Created episode at: $target"
Write-Host 'Existing source assets were not moved, overwritten, or deleted.'
