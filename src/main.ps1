<#===========================================================================
    Author:         Ana Taualupe, Mili Normandin
    Description:    Main entrypoint for scripts to compile Typst files to HTML and PDF.
    Date:           2026-06-29
===========================================================================#>
# Set static variables

# Set path to root of project
$currentPath = Split-Path -Parent $PSScriptRoot
# Define log file
$logFile = (Join-Path $PSScriptRoot "main.log")

<#
Write string and timestamp to log file
#>
function WriteLog {
    Param ([string]$LogString = "")
    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-content $logFile -value $LogMessage -Encoding UTF8
}

<#
Generates the following HTML files:
1. index.html - Located in project root. Main entrypoint for all ICD HTML pages. Required for Github pages deployment.
2. HTML file for each .typ file within the ICD folders  
#>
function GenerateHTMLFiles {
    $typFileFullPath = ""
    $icdFolder = ""
    $htmlIndexContent = '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Test</title><link rel="stylesheet" href="./src/style.css"></head><body><ul>'
    $compileHtmlFilesContent = ""
    $compileHtmlFilesFileName = "compile_html_files.ps1"

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

    $htmlIndexContent > index.html
    # Generate new PS1 script containing Typist HTML compile commands for each typ file within the ICD folders
    $compileHtmlFilesContent | Set-Content (Join-Path $PSScriptRoot $compileHtmlFilesFileName)
    WriteLog "Generated $compileHtmlFilesFileName"
    & (Join-Path $PSScriptRoot $compileHtmlFilesFileName)
    WriteLog "Compiled ICD HTML Files"
    & (Join-Path $PSScriptRoot "insert_css_ref.ps1")
    WriteLog "Inserted CSS reference into HTML Files"
}

WriteLog
GenerateHTMLFiles
typst compile main.typ
WriteLog "Compiled main.typ"


# TODO
# [X] improve clarity
# [X] logging
# - unit testing
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




