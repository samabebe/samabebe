 <#
.SYNOPSIS
    This PowerShell script ensures that the computer must deny network access to specific high-privilege accounts on workstations by configuring the Local Security Policy.

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-27-05
    Last Modified   : 2025-27-05
    Version         : 1.0
    CVEs            : 
    Plugin IDs      : Windows Compliance 
    STIG-ID         : WN10-UR-000070

.TESTED ON
    Date(s) Tested  : 2025-22-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    Example syntax:
    PS C:\> .\WN10-UR-000070.ps1 
#>

# Must be run as Administrator
$ErrorActionPreference = "Stop"

# Security identifiers to deny network access
$denySIDs = @(
    "S-1-5-113",  # Local account
    "S-1-5-114"   # Local account and member of Administrators group
)

# Define the policy name
$policyName = "SeDenyNetworkLogonRight"

# Get current setting
$currentSetting = (secedit /export /cfg "$env:TEMP\secpol.cfg" | Out-Null; 
                   Get-Content "$env:TEMP\secpol.cfg" | 
                   Where-Object { $_ -match "^$policyName\s*=" }) -replace "^$policyName\s*=\s*", ""

# Combine existing SIDs with the new ones
$currentSIDs = $currentSetting -split ',' | Where-Object { $_ -ne '' }
$newSIDs = ($currentSIDs + $denySIDs) | Sort-Object -Unique

# Create INF template
$infPath = "$env:TEMP\set_user_rights.inf"
@"
[Unicode]
Unicode=yes
[System Access]
[Event Audit]
[Privilege Rights]
$policyName = $($newSIDs -join ",")
[Version]
signature="\$CHICAGO$"
Revision=1
"@ | Set-Content -Encoding Unicode -Path $infPath

# Apply the INF file
secedit /configure /db secedit.sdb /cfg $infPath /areas USER_RIGHTS

Write-Host "WN10-UR-000070 policy applied successfully."
