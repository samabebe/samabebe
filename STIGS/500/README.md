
# 🛡️ **DISA STIG COMPLIANCE FIX - WN10-AU-000500**
## 📂 Windows 10 Security Baseline: Audit Policy - Application Log Maximum Size

This PowerShell script ensures that the **maximum size of the Windows Application Event Log** is configured to **at least 32 MB (32768 KB)** as required by the DISA STIG.

<pre>
 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Samuel Abebe
    LinkedIn        : linkedin.com/in/samuel-abebe-518056281/
    GitHub          : github.com/samabebe
    Date Created    : 2025-22-05
    Last Modified   : 2025-22-05
    Version         : 1.0
    CVEs            : 
    Plugin IDs      : Windows Compliance 
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-22-05
    Tested By       : Samuel Abebe
    Systems Tested  : Windows10Pro
    PowerShell Ver. : 7.6.0

.USAGE
    Example syntax:
    PS C:\> .\WN10-AU-000500.ps1 
#>

# Define the registry path and property
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$propertyName = "MaxSize"
$propertyValue = 0x00008000  # This is 32768 in decimal (32 MB)

# Create the registry path if it doexsn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry value
New-ItemProperty -Path $regPath -Name $propertyName -Value $propertyValue -PropertyType DWord -Force

Write-Host "Registry value 'MaxSize' set to 0x00008000 under $regPath" 
</pre>

## ✅ STIG ID: WN10-AU-000500
- **Category**: Audit Policy
- **Requirement**: Application log must be large enough to capture audit data
- **Fix**: Set `MaxSize` registry value to at least 32768 KB

## 📊 IMPACT
- **Automates a critical security configuration**, eliminating the need for manual registry edits  
- **Saves hours of administrative time** across multiple endpoints if deployed organization-wide  
- Ensures consistent **compliance** with DISA STIG WN10-AU-000500 and **reduces audit preparation effort**


<img width="1716" alt="Screenshot 2025-06-01 at 10 57 14 PM" src="https://github.com/user-attachments/assets/083d71e4-3969-4a49-b750-4fd89febdb26" />

  
## 🧠 Author: Samuel Abebe
- 📅 Date: May 22, 2025
- 🌐 GitHub: [github.com/samabebe](https://github.com/samabebe)

