<#
.SYNOPSIS
    Requires password on resume from sleep while plugged in.

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-27-05
    Last Modified   : 2025-27-05
    Version         : 1.0
    STIG-ID         : WN10-CC-000150

.TESTED ON
    Date(s) Tested  : 2025-22-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    PS C:\> .\WN10-CC-000150.ps1
#>

powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_NONE CONSOLELOCK 1
powercfg /SETACTIVE SCHEME_CURRENT
