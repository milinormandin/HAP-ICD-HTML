<#===========================================================================
    Author:         Ana Taualupe, Mili Normandin
    Description:    Compiles Typst files to HTML and PDF.
    Date:           2026-06-29
===========================================================================#>

<#
-----------------------------/// Define static variables ///-----------------------------
#>

# Standardize encoding for capturing command output
[Console]::InputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Set path to root of project
$currentPath = Split-Path -Parent $PSScriptRoot
# Define log file
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logFile = Join-Path $PSScriptRoot "log\main_$timestamp.log"

<#
-----------------------------/// Supporting functions ///-----------------------------
#>

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

    Get-ChildItem -Path $currentPath -Directory | Where-Object { $_.FullName -notmatch 'icd_xxx_template' } | ForEach-Object {
        $icdFolder = $_.Name

        Get-ChildItem -Path "$_/*" -Filter "*.typ" | ForEach-Object {
            $typFileFullPath = $_.FullName
            $htmlIcdFullPath = $typFileFullPath.Replace('.typ', '.html')
            $htmlIcdFileName = $_.Name.Replace('typ', 'html')

            try {
                # Execute typst html file command
                # Capture stderr
                $stdErr = $($null = typst compile --features html --format html $typFileFullPath $htmlIcdFullPath) 2>&1 
                if ($LASTEXITCODE -ne 0) {
                    throw [System.IO.IOException]::new(
                        "typst html compile with error message: $stdErr"
                    )
                }
                WriteLog "Generated: $htmlIcdFullPath"
            
            }
            catch {
                
                WriteLog "ERROR attempted to generate ${htmlIcdFullPath}: $($PSItem.ToString())"
                throw
            }

            # Create ps1 file of typst html calls for reference
            $compileHtmlFilesContent += "typst compile --features html --format html $typFileFullPath $htmlIcdFullPath `n"
            $htmlIndexContent += '<li><a href="' + "$icdFolder\$htmlIcdFileName" + '">' + $htmlIcdFullPath + '</a></li>'

        }
    }
    $htmlIndexContent += '</ul></body></html>'

    $htmlIndexContent > index.html
    WriteLog "Generated index.html"
    
    try {
        # Generate new PS1 script containing Typist HTML compile commands for each typ file within the ICD folders
        $compileHtmlFilesContent | Set-Content (Join-Path $PSScriptRoot $compileHtmlFilesFileName)
        WriteLog "Generated $compileHtmlFilesFileName"
        
    }
    catch {
        
        WriteLog "ERROR attempting to generate ${compileHtmlFilesFileName}: $($PSItem.ToString())"
        throw $PSItem
    }

    try {
        & (Join-Path $PSScriptRoot "insert_css_ref.ps1")
        WriteLog "Inserted CSS reference into HTML Files"
        
    }
    catch {
        
        WriteLog "ERROR inserting CSS reference into HTML files: $($PSItem.ToString())"
        throw $PSItem
    }

}

<#
-----------------------------/// Main logic ///-----------------------------
#>

# DO NOT DELETE OR MOVE THIS LINE. Must be first line written to log. Tests rely on this line
WriteLog ""

WriteLog "$($MyInvocation.MyCommand.Name) script start"

<#
ICD HTML files generation
#>
try {
    GenerateHTMLFiles
    WriteLog "Compiled HTML ICD files successfully."
        
}
catch {
    
    WriteLog "ERROR One or more errors occurred while attempting to generate HTML files."
}

<#
main.pdf generation
#>
try {
    $stdErr = $($null = typst compile main.typ) 2>&1 
    if ($LASTEXITCODE -ne 0) {
        throw [System.IO.IOException]::new(
            "typst compile main.typ returned with error message: $stdErr"
        )
    }
    WriteLog "Compiled main.typ successfully."
            
}
catch {
    
    WriteLog "ERROR compiling main.typ: $($PSItem.ToString())"
}


# TODO
# [X] improve clarity
# [X] logging
# [X] change log to append instead of overwrite
# [X] add log folder
# [X] generate new log file for every run
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




