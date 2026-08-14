<#===========================================================================
    Author:         Ana Taualupe, Mili Normandin
    Description:    Verifies that new html and main.pdf files were generated 
                    check existence of:  
                    - main pdf
                    - .\main.pdf
                    - html sections
                    check that timestamps of generated files match the last successful run
                    - create timestamp variable from first line in main.log
                    - check that ts of generated files are greater than latest ts from log
    Date:           2026-07-30
===========================================================================#>
$path = $PSScriptRoot
$logFolder = "$path\log"

$latestLogFile = (Get-ChildItem $logFolder -Filter "*.log" | Sort-Object LastWriteTime | Select-Object -last 1).FullName

$lastRunTs = [datetime](Get-Content $latestLogFile -Head 1)

# Set path to root of project
$currentPath = Split-Path -Parent $PSScriptRoot

$results = @{
    successfulFileCount = 0
    totalFileCount      = 0
}

# Check that html ts is greater than ts of last script run
Get-ChildItem -Path $currentPath -Recurse -Filter "*.html" | Where-Object { $_.FullName -notmatch '\\(GRAPHICS (TRANSPARENT)|icd_xxx_template|src|)\\' } | ForEach-Object {

    if (($_.LastWriteTime).ToLocalTime() -gt $lastRunTs) {
        $results.successfulFileCount += 1
    }
    else {
        Write-Output "CHECK!! File was not updated during last run: " + $_.Name + " " + ($_.LastWriteTime).ToLocalTime()
    }

    $results.totalFileCount += 1
}

Write-Output "TEST 01: HTML file last update time check: $($results.successfulFileCount)/$($results.totalFileCount) files PASSED"

# Check that main pdf ts is greater than ts of last script run

try {
    $mainPDF = (Get-ChildItem $currentPath -Filter "main.pdf")
    
    if ($null -eq $mainPDF) {
        throw [System.IO.FileNotFoundException]::new(
            "main.pdf not found"
        )
    }

    if ($mainPDF.LastWriteTime.ToLocalTime() -gt $lastRunTs) {
        Write-Output "TEST 02: main.pdf file last update time check: PASSED"
    }
    else {
        Write-Output "TEST 02: main.pdf file last update time check: FAILED"
    }
}
catch {
    Write-Output "TEST 02: main.pdf file last update time check: FAILED WITH ERRORS: $($PSItem)"
}

