#Requires -Version 5.1
<#
.SYNOPSIS
    Linkt alle skills uit deze repo naar de persoonlijke Claude Code skills-directory.

.DESCRIPTION
    Elke map in deze repo die een SKILL.md bevat wordt als junction geplaatst in
    ~/.claude/skills/<naam>. Junctions hebben geen admin-rechten nodig en houden de
    repo als enige bron: wat je hier bewerkt is direct actief als skill.

    Bestaande junctions naar deze repo worden ververst. Een echte map (geen junction)
    op de doelplek wordt met rust gelaten, tenzij je -Force meegeeft.

.PARAMETER Force
    Overschrijf een bestaande niet-junction map op de doelplek.

.EXAMPLE
    ./link-skills.ps1
    ./link-skills.ps1 -Force
#>
[CmdletBinding()]
param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$repoRoot  = $PSScriptRoot
$skillsDir = Join-Path $env:USERPROFILE '.claude\skills'

New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null

# Skillmappen = directe submappen met een SKILL.md erin.
$skills = Get-ChildItem -Path $repoRoot -Directory |
    Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }

if (-not $skills) {
    Write-Warning "Geen skillmappen (met SKILL.md) gevonden in $repoRoot"
    return
}

foreach ($skill in $skills) {
    $link   = Join-Path $skillsDir $skill.Name
    $target = $skill.FullName

    if (Test-Path $link) {
        $item = Get-Item $link -Force
        $isJunction = $item.LinkType -eq 'Junction' -or $item.LinkType -eq 'SymbolicLink'
        if ($isJunction) {
            Remove-Item $link -Recurse -Force            # verversen
        }
        elseif ($Force) {
            Remove-Item $link -Recurse -Force            # echte map, met -Force weg
        }
        else {
            Write-Warning "Overslaan '$($skill.Name)': er staat al een echte map. Gebruik -Force om te overschrijven."
            continue
        }
    }

    New-Item -ItemType Junction -Path $link -Target $target | Out-Null
    Write-Host "  gelinkt  $($skill.Name)  ->  $target" -ForegroundColor Green
}

Write-Host ""
Write-Host "Klaar. Start een nieuwe Claude Code-sessie om de skills in te laden." -ForegroundColor Cyan
