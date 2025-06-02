<#
# 🛡️ **DISA STIG COMPLIANCE FIX - WN10-AU-000500**
## 📂 Windows 10 Security Baseline: Audit Policy - Application Log Maximum Size

This PowerShell script ensures that the **maximum size of the Windows Application Event Log** is configured to **at least 32 MB (32768 KB)** as required by the DISA STIG.

## ✅ STIG ID: WN10-AU-000500
- **Category**: Audit Policy
- **Requirement**: Application log must be large enough to capture audit data
- **Fix**: Set `MaxSize` registry value to at least 32768 KB

## 📊 IMPACT
- Prevents **audit log overwrites**
- Supports **forensic investigations** and **incident response**
- Helps maintain **compliance** with federal cybersecurity standards

## 🧠 Author: Samuel Abebe
- 📅 Date: May 22, 2025
- 🌐 GitHub: [github.com/samabebe](https://github.com/samabebe)

#>
