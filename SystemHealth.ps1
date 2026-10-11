Clear-Host

Write-Host "=== SYSTEM HEALTH CHECK ===" -ForegroundColor Cyan
Write-Host ""

# Windows information
Get-ComputerInfo |
Select-Object WindowsProductName, WindowsVersion, OsBuildNumber

Write-Host ""
Write-Host "=== CPU ===" -ForegroundColor Yellow
Get-CimInstance Win32_Processor |
Select-Object Name, NumberOfCores, NumberOfLogicalProcessors

Write-Host ""
Write-Host "=== MEMORY ===" -ForegroundColor Yellow

$OS = Get-CimInstance Win32_OperatingSystem

[PSCustomObject]@{
    TotalRAM_GB = [math\]::Round($OS.TotalVisibleMemorySize / 1MB, 2)
    FreeRAM_GB  = [math\]::Round($OS.FreePhysicalMemory / 1MB, 2)
}

Write-Host ""
Write-Host "=== DISKS ===" -ForegroundColor Yellow

Get-Volume |
Where-Object DriveLetter |
Select-Object DriveLetter,
@{Name="Free(GB)";Expression={[math\]::Round($_.SizeRemaining / 1GB,2)}},
@{Name="Total(GB)";Expression={[math\]::Round($_.Size / 1GB,2)}}

Write-Host ""
Write-Host "=== GPU ===" -ForegroundColor Yellow

Get-CimInstance Win32_VideoController |
Select-Object Name, DriverVersion

Write-Host ""
Read-Host "Press Enter to close"