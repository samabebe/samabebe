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
    $data = Import-Csv $csvPath

    # Generate next AssetID
    $lastID = $data | Sort-Object AssetID -Descending | Select-Object -First 1 | Select-Object -ExpandProperty AssetID
    if ($lastID) {
        $num = [int]($lastID -replace 'AST-','')
        $nextID = "AST-{0:D4}" -f ($num + 1)
    } else {
        $nextID = "AST-0001"
    }

    $assetType = Read-Host "Asset Type (Laptop, Monitor, etc.)"
    $brand = Read-Host "Brand"
    $model = Read-Host "Model"
    $serial = Read-Host "Serial Number"
    $assignedTo = Read-Host "Assigned To"
    $status = Read-Host "Status (In Use, In Stock, Repair, Retired)"
    $location = Read-Host "Location"
    $purchaseDate = Read-Host "Purchase Date (YYYY-MM-DD)"
    $notes = Read-Host "Notes"

    $newAsset = [PSCustomObject]@{
        AssetID = $nextID
        AssetType = $assetType
        Brand = $brand
        Model = $model
        SerialNumber = $serial
        AssignedTo = $assignedTo
        Status = $status
        Location = $location
        PurchaseDate = $purchaseDate
        Notes = $notes
    }

    $data += $newAsset
    $data | Export-Csv $csvPath -NoTypeInformation

    Write-Host "Asset $nextID added successfully." -ForegroundColor Green
    Pause
}

function Update-Asset {
    $id = Read-Host "Enter Asset ID to update (e.g., AST-0001)"
    $data = Import-Csv $csvPath
    $asset = $data | Where-Object { $_.AssetID -eq $id }

    if ($asset) {
        Write-Host "Leave field blank to keep current value."
        foreach ($column in $asset.PSObject.Properties.Name) {
            if ($column -ne 'AssetID') {
                $currentValue = $asset.$column
                $newValue = Read-Host "$column [$currentValue]"
                if ($newValue) {
                    $asset.$column = $newValue
                }
            }
        }
        $data = $data | Where-Object { $_.AssetID -ne $id }
        $data += $asset
        $data | Export-Csv $csvPath -NoTypeInformation
        Write-Host "Asset $id updated successfully." -ForegroundColor Yellow
    } else {
        Write-Host "Asset not found." -ForegroundColor Red
    }
    Pause
}

function Search-Asset {
    $id = Read-Host "Enter Asset ID to search"
    $data = Import-Csv $csvPath | Where-Object { $_.AssetID -eq $id }
    if ($data) {
        $data | Format-Table -AutoSize
    } else {
        Write-Host "No asset found with ID $id" -ForegroundColor Red
    }
    Pause
}

function Generate-Report {
    $data = Import-Csv $csvPath
    $summary = $data | Group-Object -Property AssetType | Select-Object Name,Count
    $summary | Format-Table -AutoSize
    $data | Where-Object { $_.Status -eq 'In Use' } | Export-Csv -Path "./report.csv" -NoTypeInformation
    Write-Host "Report generated: report.csv" -ForegroundColor Cyan
    Pause
}

# Main loop
while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice (1-6)"
    switch ($choice) {
        '1' { View-AllAssets }
        '2' { Add-NewAsset }
        '3' { Update-Asset }
        '4' { Search-Asset }
        '5' { Generate-Report }
        '6' { break } # Exit loop and end script
        default { Write-Host "Invalid option. Please try again." -ForegroundColor Red; Pause }
    }
}
