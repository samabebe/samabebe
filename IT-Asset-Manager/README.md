# 💻 IT Asset Manager – PowerShell Script

A lightweight PowerShell-based tool to manage and track IT equipment (laptops, monitors, peripherals, etc.) using a simple CSV file. Ideal for small IT departments or individual IT coordinators who need a quick and effective way to track assets without expensive software.

---

I developed a PowerShell script with a menu-driven interface that:
	•	Automatically generates a CSV file (assets.csv) to store asset data
	•	Handles operations like adding, viewing, updating, and searching for assets
	•	Assigns unique Asset IDs (AST-0001, AST-0002, etc.)
	•	Generates reports (report.csv) listing “In Use” assets and usage summaries


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

![image](https://github.com/user-attachments/assets/362a5315-66ba-41f7-84e1-72f9175c4ce9)

---

## 🛠 Prerequisites

- PowerShell (Windows PowerShell 5.1 or PowerShell Core 7+)
- No external modules or tools required

---

https://drive.google.com/file/d/1gdniJkyaIowUVFmSAx9tqzZt4nvo-6EW/view?usp=share_link

## 🧠 Why I Built This

> As an aspiring IT Support and Asset Coordinator, I created this tool to solve a real-world need: tracking IT equipment in environments without full-scale ITAM software. This project demonstrates my scripting skills, automation mindset, and ability to create practical solutions that save time and reduce asset loss.

	•	Improved Efficiency: Significantly reduced the time it takes to track, update, and audit IT assets by replacing manual spreadsheets with an interactive script.
	•	Lower Risk of Asset Loss: By assigning unique Asset IDs and tracking status/location, the tool minimizes asset misplacement or oversight.
	•	Scalable for Small Teams: Enables small IT teams or solo IT coordinators to implement structured asset management without costly software.

---

## 📂 Output Files

- `assets.csv` — primary data file storing all assets
- `report.csv` — generated report of all "In Use" assets and summary

---

## 🧪 Example Usage

```powershell
PS> .\asset_manager.ps1
