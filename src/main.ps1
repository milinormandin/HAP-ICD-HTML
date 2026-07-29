<#===========================================================================
    Author:         Ana Taualupe, Mili Normandin
    Description:    Main entrypoint for scripts to compile Typst files to HTML and PDF.
    Date:           2026-06-29
===========================================================================#>
# $currentpath = "C:\Users\ana\Desktop\Analysis\HAP\HAP_ICD_MASTER_TYPST"
# Set-Location $currentpath
$currentPath = Split-Path -Parent $PSScriptRoot
Set-Location $currentPath

$outputPath = ""
$output = ""
$icdfolder = ""
$indexoutput = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Test</title><link rel="stylesheet" href="./src/style.css"></head><body><ul>'



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
$scriptOutputFileName = "compile_html_files.ps1"

# Generate the new ps1 file and run subsequent ps1 scripts
$output | Set-Content (Join-Path $PSScriptRoot $scriptOutputFileName); 
&(Join-Path $PSScriptRoot $scriptOutputFileName);
&(Join-Path $PSScriptRoot "insert_css_ref.ps1");
typst compile main.typ

# TODO
# - improve clarity
# - unit testing
# - logging
# - existence of:  
#     - main pdf
#     - .\index.html
#     - html sections
# - check that timestamps of generated files match the last run
#     - create timestamp variable in .\main.pdf or write to log
#     - check that ts of generated files are greater than latest ts from log

# PR Review Process 
# 1. reviewer manually reviews the content of the changes
# 2. run main.ps1
#     - exports new output files HTML/pdf
#     - runs tests ensure the validity of the output files
# 3. reviewer merge to main




