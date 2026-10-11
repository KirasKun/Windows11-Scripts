Start-Process "F:\Tools\RAMMap\RAMMap.exe" `
-ArgumentList "-E" `
-Wait

Write-Host ""
Write-Host "Standby memory cache cleared." -ForegroundColor Green
Write-Host ""

Read-Host "Press Enter