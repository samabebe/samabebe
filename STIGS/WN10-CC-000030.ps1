<#
.SYNOPSIS
    This PowerShell script disables inbound ICMP Echo (ping) requests using the Windows Firewall.

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-27-05
    Last Modified   : 2025-27-05
    Version         : 1.0
    CVEs            : 
    Plugin IDs      : Windows Compliance 
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 2025-22-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    Example syntax:
    PS C:\> .\WN10-CC-000030.ps1 
#>

# Disable ICMPv4 echo requests
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -Enabled False -ErrorAction SilentlyContinue
