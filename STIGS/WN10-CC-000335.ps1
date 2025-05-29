<#
.SYNOPSIS
     Prevents WinRM client from sending unencrypted traffic.

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-28-05
    Last Modified   : 2025-28-05
    Version         : 1.0
    STIG-ID         : WN10-CC-000335 

.TESTED ON
    Date(s) Tested  : 2025-28-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    PS C:\> .\WN10-CC-000335.ps1
#>
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowUnencryptedTraffic" -Value 0 -Type DWord
