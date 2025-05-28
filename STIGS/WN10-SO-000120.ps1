<#
.SYNOPSIS
    This PowerShell script disables the SMBv1 server feature on Windows 10.

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-27-05
    Last Modified   : 2025-27-05
    Version         : 1.0
    CVEs            : 
    Plugin IDs      : Windows Compliance 
    STIG-ID         : WN10-SO-000120

.TESTED ON
    Date(s) Tested  : 2025-22-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    Example syntax:
    PS C:\> .\WN10-SO-000120.ps1 
#>

Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -NoRestart -ErrorAction SilentlyContinue
