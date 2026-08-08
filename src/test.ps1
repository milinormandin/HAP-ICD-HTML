<#===========================================================================
    Author:         Ana Taualupe, Mili Normandin
    Description:    Verifies that new html and main.pdf files were generated 
                    check existence of:  
                    - main pdf
                    - .\index.html
                    - html sections
                    check that timestamps of generated files match the last successful run
                    - create timestamp variable from first line in main.log
                    - check that ts of generated files are greater than latest ts from log
    Date:           2026-07-30
===========================================================================#>
$path = $PSScriptRoot
$logFolder = "$path\log"

$latestLogFile = (Get-ChildItem $logFolder -Filter "*.log" | Sort-Object LastWriteTime | Select-Object -last 1).FullName

$lastRun = [datetime](Get-Content $latestLogFile -Head 1)

# if ($lastRun -eq [datetime]"2026/08/07 16:22:36") {
#     "Same time"
# }
# else {
#     "Different time"
# }
# $lastRun

# Set path to root of project
$currentPath = Split-Path -Parent $PSScriptRoot

# Check that html ts is greater than ts of last script run
Get-ChildItem -Path $currentPath -Recurse -Filter "*.html" | Where-Object { $_.FullName -notmatch '\\(GRAPHICS (TRANSPARENT)|icd_xxx_template|src|)\\' } | ForEach-Object {
    $_.Name + " " + ($_.CreationTimeUtc).ToLocalTime()

    if (($_.CreationTimeUtc).ToLocalTime() -gt $lastRun) {
        "Good " + $_.Name + " " + ($_.CreationTimeUtc).ToLocalTime()
    }
    else {
        "Bad " + $_.Name + " " + ($_.CreationTimeUtc).ToLocalTime()
    }
}

# Check that main pdf ts is greater than ts of last script run

# # Generate new PS1 script containing Typist HTML compile commands for each typ file within the ICD folders
# $compileHtmlFilesContent | Set-Content (Join-Path $PSScriptRoot $compileHtmlFilesFileName)
# WriteLog "Generated $compileHtmlFilesFileName"
# & (Join-Path $PSScriptRoot $compileHtmlFilesFileName)
# WriteLog "Compiled ICD HTML Files"
# & (Join-Path $PSScriptRoot "insert_css_ref.ps1")
# WriteLog "Inserted CSS reference into HTML Files"
