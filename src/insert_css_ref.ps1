<#===========================================================================
    Author:         Ana Taualupe
    Description:    
    Date:           2026-06-29
===========================================================================#>
# $currentpath = "C:\Users\ana\Desktop\Analysis\HAP\HAP_ICD_MASTER_TYPST"
# Set-Location $currentpath
$currentPath = Split-Path -Parent $PSScriptRoot
Set-Location $currentPath


Get-ChildItem -Path $currentpath -Directory | ForEach-Object {

    Get-ChildItem -Path "$_/*" -Filter "*.html" | ForEach-Object {
       (Get-Content $_.FullName) -replace '<head>', '<head><link rel="stylesheet" href="..\src\style.css">' | Set-Content $_.FullName
    }
}


