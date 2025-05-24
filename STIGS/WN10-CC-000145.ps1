 <#
.SYNOPSIS
    This PowerShell script ensures users must be prompted for a password on resume from sleep (on battery).

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-24-05
    Last Modified   : 2025-24-05
    Version         : 1.0
    CVEs            : 
    Plugin IDs      : Windows Compliance 
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 2025-24-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    ## MUST HAVE LGPO IN THE SAME PATH ##
    Example syntax:
    PS C:\> .\WN10-CC-000145.ps1 
#>
# Set registry values
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$ValueName = "DCSettingIndex"
$DesiredValue = 1

# Path to LGPO.exe (adjust if needed)
$LGPOPath = ".\LGPO.exe"

# Self-elevate the script if not running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Check LGPO.exe presence
if (-not (Test-Path $LGPOPath)) {
    Write-Error "❌ LGPO.exe not found at $LGPOPath. Please download it from https://www.microsoft.com/en-us/download/details.aspx?id=55319 and place it in the script directory."
    exit 1
}

# Set the registry key
try {
    if (-not (Test-Path $RegPath)) {
        Write-Verbose "Creating registry path: $RegPath"
        New-Item -Path $RegPath -Force | Out-Null
    }

    Set-ItemProperty -Path $RegPath -Name $ValueName -Value $DesiredValue -Type DWord
    Write-Host "✅ Registry setting applied successfully." -ForegroundColor Green
}
catch {
    Write-Error "❌ Failed to set registry value: $_"
}

# Set GPO via LGPO.exe
try {
    $PolicyName = "RequirePasswordOnWakeBattery"
    $GPOString = @"
Computer
Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51!DCSettingIndex=DWORD:1
"@

    $TempFolder = "$env:TEMP\$PolicyName"
    $GPOPolicyFile = "$TempFolder\gpo.txt"

    # Create temp folder
    if (-not (Test-Path $TempFolder)) {
        New-Item -ItemType Directory -Path $TempFolder | Out-Null
    }

    # Write the GPO template
    $GPOString | Out-File -Encoding ASCII -FilePath $GPOPolicyFile

    # Apply the GPO
    & $LGPOPath /v /t $TempFolder
    Write-Host "✅ Group Policy setting applied successfully via LGPO.exe" -ForegroundColor Green
}
catch {
    Write-Error "❌ Failed to apply Group Policy setting: $_"
}
