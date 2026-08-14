<#===========================================================================
    Author:         Mili Normandin
    Description:    Helper functions for debugging ps1 script development.
    Date:           2026-07-21
===========================================================================#>

# Removes all HTML files from ICD folders
function Remove-HTML-Files {

    # Delete html files in root dir

    Get-ChildItem -Path $currentpath -Filter "*.html" | ForEach-Object {
        $outputPath = $_.FullName
        Remove-Item -Path $outputPath
        Write-Output 'Removed all HTML files from root folder.'

    }

    
    # Delete html files in ICD Folders
    Get-ChildItem -Path $currentpath -Directory | ForEach-Object {

        Get-ChildItem -Path "$_/*" -Filter "*.html" | ForEach-Object {
            $outputPath = $_.FullName
            Remove-Item -Path $outputPath

        }
    }
    Write-Output 'Removed all HTML files from ICD Folders.'
    
}

function Remove-Main-PDF {

    try {
        Remove-Item ".\main.pdf"
        if ($LASTEXITCODE -ne 0) {
            throw [System.IO.FileNotFoundException]::new()
        }
        Write-Output 'Removed main.pdf from root folder.'
            
    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Output $PSItem.ToString()
    }
    
}

function Remove-Main-Logs {

    Get-ChildItem -Path "$PSScriptRoot\log" -Filter "*.log" | ForEach-Object {
        $outputPath = $_.FullName
        Remove-Item -Path $outputPath


    }
    Write-Output 'Removed all log files from log folder.'
    
}

# Set path to the parent folder of where the script is being called from 
$currentPath = Split-Path -Parent $PSScriptRoot
Set-Location $currentPath

Remove-HTML-Files
Remove-Main-PDF
# Remove-Main-Logs






