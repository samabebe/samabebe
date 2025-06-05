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
