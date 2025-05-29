<#
.SYNOPSIS
    Allows Microsoft accounts to be optional for modern apps.
.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-28-05
    Last Modified   : 2025-28-05
    Version         : 1.0
    STIG-ID         : WN10-CC-000170

.TESTED ON
    Date(s) Tested  : 2025-28-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    PS C:\> .\WN10-CC-000170.ps1
#>

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "MSAOptional" -Value 1 -Type DWord
