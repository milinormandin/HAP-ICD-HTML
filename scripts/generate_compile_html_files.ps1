<#===========================================================================
    Author:         Ana Taualupe
    Description:    Generates a powershell script to compile Typst files to HTML
    Date:           2026-06-29
===========================================================================#>
# $currentpath = "C:\Users\ana\Desktop\Analysis\HAP\HAP_ICD_MASTER_TYPST"
# Set-Location $currentpath
$currentPath = Split-Path -Parent $PSScriptRoot
Set-Location $currentPath

$outputPath = ""
$output = ""
$icdfolder = ""
$indexoutput = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Test</title><link rel="stylesheet" href="index.css"></head><body><ul>'



Get-ChildItem -Path $currentpath -Directory | ForEach-Object {
    $icdfolder = $_.Name

    Get-ChildItem -Path "$_/*" -Filter "*.typ" | ForEach-Object {
        $outputPath = $_.FullName
        $htmloutfile = $outputPath.Replace('.typ', '.html')
        $htmlfile = $_.Name.Replace('typ', 'html')
        $output += "typst compile --features html --format html $outputPath $htmloutfile `n"
        $indexoutput += '<li><a href="' + "$icdfolder\$htmlfile" + '">' + $htmloutfile + '</a></li>'

    }
}
$indexoutput += '</ul></body></html>'
$indexoutput > index.html
$output | Set-Content (Join-Path $PSScriptRoot "compile_html_files.ps1"); & (Join-Path $PSScriptRoot "compile_html_files.ps1")

