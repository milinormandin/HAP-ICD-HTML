<#===========================================================================
    Author:         Mili Normandin
    Description:    Helper functions for debugging ps1 script development. Uncomment function calls below individually or in tandem as needed.
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

# Set path to the parent folder of where the script is being called from 
$currentPath = Split-Path -Parent $PSScriptRoot
Set-Location $currentPath

Remove-HTML-Files






