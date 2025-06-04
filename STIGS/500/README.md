
# 🛡️ **DISA STIG COMPLIANCE FIX - WN10-AU-000500**
## 📂 Windows 10 Security Baseline: Audit Policy - Application Log Maximum Size

### Led an enterprise-wide STIG compliance remediation initiative in a live Azure environment, resolving a high-severity DISA STIG vulnerability (WN10-AU-000500) across 65 virtual machines. I identified the issue through Tenable scans, developed a custom PowerShell script to increase the application event log size per compliance standards, and deployed the fix across the fleet. The remediation was completed in under 48 hours, with full compliance validated via follow-up scans in a production setting.

<img width="1724" alt="Screenshot 2025-06-01 at 11 46 00 PM" src="https://github.com/user-attachments/assets/41cc47dd-c17d-4ea6-982c-a3f3732a8158" />

### While working as a Cybersecurity Support Engineer Intern At LOG(N) Pacific, I was running an advanced network scan across 65 virtual machines. After reviewing the scan results, I noticed a recurring high-severity failure on all systems — WN10-AU-000500. Left unaddressed, this could impact security visibility and compliance posture. I took full ownership of the issue and proposed a solution.

<img width="1657" alt="Screenshot 2025-06-01 at 11 47 38 PM" src="https://github.com/user-attachments/assets/0e57cdff-f97c-4697-82a6-bf34f6e368ff" />

### developed a PowerShell script and tested it on a dedicated virtual machine to ensure it functioned correctly before submitting it for review.
<img width="1728" alt="Screenshot 2025-06-02 at 12 32 57 AM" src="https://github.com/user-attachments/assets/fa8c1dbe-c645-49cc-9ba1-5f6aef65b4c3" />
<pre>
 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Samuel Abebe
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
- **Eliminated the risk of overwritten audit logs** during high-volume threat activity  
- **Saved hours of manual remediation** for LOG(N) Pecific deploying this to 65 VM's 
- **Positioned the environment for successful federal compliance audits**  
- **Delivered a production-ready fix** 

### The deployment was successful—(100% of targeted systems were remediated within 48 hours). A follow-up scan from Tenable confirmed the STIG vulnerability was cleared across the entire environment.*
<img width="1727" alt="Screenshot 2025-06-01 at 11 57 15 PM" src="https://github.com/user-attachments/assets/dd541866-a95e-4d56-9119-b4bf24e4960b" />
<img width="661" alt="Screenshot 2025-06-01 at 11 55 55 PM" src="https://github.com/user-attachments/assets/efcd52d0-243c-43b1-9a15-0e4b0989c0a5" />

### My overall impact to security posture was a 0.33 increase in Micrsoft Secuirty Score 
<img width="466" alt="Screenshot 2025-06-02 at 12 28 23 AM" src="https://github.com/user-attachments/assets/cce84a01-8489-4af9-9fb2-b586e826626b" />

  
## 🧠 Author: Samuel Abebe
- 📅 Date: May 22, 2025
- 🌐 GitHub: [github.com/samabebe](https://github.com/samabebe)

