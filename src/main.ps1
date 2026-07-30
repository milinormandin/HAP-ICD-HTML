<#===========================================================================
    Author:         Ana Taualupe, Mili Normandin
    Description:    Main entrypoint for scripts to compile Typst files to HTML and PDF.
    Date:           2026-06-29
===========================================================================#>

# Set path to root of project
$currentPath = Split-Path -Parent $PSScriptRoot
Set-Location $currentPath

$typFileFullPath = ""
$compileHtmlFilesContent = ""
$icdFolder = ""
$htmlIndexContent = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Test</title><link rel="stylesheet" href="./src/style.css"></head><body><ul>'



Get-ChildItem -Path $currentPath -Directory | ForEach-Object {
    $icdFolder = $_.Name

    Get-ChildItem -Path "$_/*" -Filter "*.typ" | ForEach-Object {
        $typFileFullPath = $_.FullName
        $htmlIcdFullPath = $typFileFullPath.Replace('.typ', '.html')
        $htmlIcdFileName = $_.Name.Replace('typ', 'html')
        $compileHtmlFilesContent += "typst compile --features html --format html $typFileFullPath $htmlIcdFullPath `n"
        $htmlIndexContent += '<li><a href="' + "$icdFolder\$htmlIcdFileName" + '">' + $htmlIcdFullPath + '</a></li>'

    }
}
$htmlIndexContent += '</ul></body></html>'
$compileHtmlFilesFileName = "compile_html_files.ps1"
$htmlIndexContent > index.html
# Generate new PS1 script containing Typist HTML compile commands for each ICD folder
$compileHtmlFilesContent > $compileHtmlFilesFileName; 
Write-Output "Generated ${compileHtmlFilesFileName}"


# Execute newly created PS1 script
&(Join-Path $PSScriptRoot $compileHtmlFilesFileName);
Write-Output "Created ICD HTML Files"
# Execute script to inject css tag into generated HTML files
&(Join-Path $PSScriptRoot "insert_css_ref.ps1");
Write-Output "Injected CSS into HTML Files"
# Compile final ICD PDF
typst compile main.typ
Write-Output "Generated main.typ"

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
#     - exports new compileHtmlFilesContent files HTML/pdf
#     - runs tests ensure the validity of the compileHtmlFilesContent files
# 3. reviewer merge to main




