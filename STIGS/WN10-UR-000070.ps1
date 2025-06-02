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

# Stop script if any command fails
$ErrorActionPreference = "Stop"

# Define SIDs to deny network logon rights
$denySIDs = @(
    "S-1-5-113",  # Local account
    "S-1-5-114"   # Local account + member of Administrators group
)

# Define the privilege to set
$policyName = "SeDenyNetworkLogonRight"

# Export current local security policy to a temp file
$secpolPath = "$env:TEMP\secpol.cfg"
secedit /export /cfg $secpolPath | Out-Null

# Extract existing SIDs assigned to this policy
$currentLine = Get-Content $secpolPath | Where-Object { $_ -match "^$policyName\s*=" }
$currentSetting = if ($currentLine) {
    $currentLine -replace "^$policyName\s*=\s*", ""
} else {
    ""
}

# Combine existing and required SIDs, ensuring uniqueness
$currentSIDs = $currentSetting -split ',' | Where-Object { $_ -ne '' }
$finalSIDs = ($currentSIDs + $denySIDs) | Sort-Object -Unique

# Build updated INF template
$infPath = "$env:TEMP\set_user_rights.inf"
$infContent = @"
[Unicode]
Unicode=yes

[System Access]

[Event Audit]

[Privilege Rights]
$policyName = $($finalSIDs -join ",")

[Version]
signature="\$CHICAGO$"
Revision=1
"@

# Write the INF file using Unicode encoding
Set-Content -Path $infPath -Value $infContent -Encoding Unicode

# Apply the updated user rights assignment
secedit /configure /db secedit.sdb /cfg $infPath /areas USER_RIGHTS /quiet

# Final confirmation message
Write-Host " no STIG WN10-UR-000070 applied successfully."
Write-Host "SIDs denied network access: $($finalSIDs -join ', ')"
