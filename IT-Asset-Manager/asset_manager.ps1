# IT Asset Manager PowerShell Script

$csvPath = "./assets.csv"

# Ensure CSV exists with headers
if (!(Test-Path $csvPath)) {
    "AssetID,AssetType,Brand,Model,SerialNumber,AssignedTo,Status,Location,PurchaseDate,Notes" | Out-File -Encoding utf8 $csvPath
}

function Show-Menu {
    Clear-Host
    Write-Host "=== IT Asset Management System ===" -ForegroundColor Cyan
    Write-Host "1. View All Assets"
    Write-Host "2. Add New Asset"
    Write-Host "3. Update Asset"
    Write-Host "4. Search Asset by ID"
    Write-Host "5. Generate Report"
    Write-Host "6. Exit"
}

function View-AllAssets {
    Import-Csv $csvPath | Format-Table -AutoSize
    Pause
}

function Add-NewAsset {
    $assetType = Read-Host "Asset Type (Laptop, Monitor, etc.)"
    $brand = Read-Host "Brand"
    $model = Read-Host "Model"
    $serial = Read-Host "Serial Number"
    $assignedTo = Read-Host "Assigned To"
    $status = Read-Host "Status (In Use, In Stock, Repair, Retired)"
    $location = Read-Host "Location"
    $purchaseDate = Read-Host "Purchase Date (YYYY-MM-DD)"
    $notes = Read-Host "
