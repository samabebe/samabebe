  <#
.SYNOPSIS
    PowerShell Transcription must be enabled to capture command inputs and outputs, enhancing audit and forensics capabilities.

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-26-05
    Last Modified   : 2025-26-05
    Version         : 1.0
    CVEs            : 
    Plugin IDs      : Windows Compliance 
    STIG-ID         : WN10-CC-000327 

.TESTED ON
    Date(s) Tested  : 2025-24-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    ## MUST HAVE LGPO IN THE SAME PATH ##
    Example syntax:
    PS C:\> \.WN10-CC-000327.ps1 
#>
# Define the transcription output directory
$transcriptionPath = "C:\Transcripts"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $transcriptionPath)) {
    New-Item -ItemType Directory -Path $transcriptionPath
}

# Enable transcription logging via Group Policy registry key
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" -Force

Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" `
    -Name "EnableTranscripting" -Value 1

Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" `
    -Name "OutputDirectory" -Value $transcriptionPath

# Optional: Include invocation headers (recommended)
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" `
    -Name "IncludeInvocationHeader" -Value 1

Write-Output "PowerShell transcription logging has been enabled." 
