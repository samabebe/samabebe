# 💻 IT Asset Manager – PowerShell Script

A lightweight PowerShell-based tool to manage and track IT equipment (laptops, monitors, peripherals, etc.) using a simple CSV file. Ideal for small IT departments or individual IT coordinators who need a quick and effective way to track assets without expensive software.

---

## 🚀 Features

- ✅ View all tracked IT assets
- ➕ Add new assets with automatic ID generation
- 🛠️ Update asset details interactively
- 🔍 Search assets by Asset ID
- 📊 Generate a usage report (CSV export)
- 💾 Persistent data storage using `assets.csv`

---

## 📁 How It Works

- On first run, it creates `assets.csv` with proper headers
- Uses a menu-driven interface to guide user actions
- Generates new Asset IDs like `AST-0001`, `AST-0002`, etc.
- Creates a report called `report.csv` listing all "In Use" assets and a summary by asset type

---

## 📦 Asset Fields

Each asset includes:

- `AssetID` (auto-generated)
- `AssetType` (e.g., Laptop, Monitor)
- `Brand`
- `Model`
- `SerialNumber`
- `AssignedTo`
- `Status` (In Use, In Stock, Repair, Retired)
- `Location`
- `PurchaseDate`
- `Notes`

---

## 📌 Sample Menu UI
<img width="337" alt="Screenshot 2025-06-05 at 7 48 33 PM" src="https://github.com/user-attachments/assets/28532574-1eea-46aa-8f1e-38ac400bf676" />
---

## 🛠 Prerequisites

- PowerShell (Windows PowerShell 5.1 or PowerShell Core 7+)
- No external modules or tools required

---

https://drive.google.com/file/d/1gdniJkyaIowUVFmSAx9tqzZt4nvo-6EW/view?usp=share_link

## 🧠 Why I Built This

> As an aspiring IT Support and Asset Coordinator, I created this tool to solve a real-world need: tracking IT equipment in environments without full-scale ITAM software. This project demonstrates my scripting skills, automation mindset, and ability to create practical solutions that save time and reduce asset loss.

Amazon Leadership Principles applied:
- **Invent and Simplify**
- **Bias for Action**
- **Ownership**
- **Deliver Results**

---

## 📂 Output Files

- `assets.csv` — primary data file storing all assets
- `report.csv` — generated report of all "In Use" assets and summary

---

## 🧪 Example Usage

```powershell
PS> .\asset_manager.ps1
