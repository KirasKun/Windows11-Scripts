Clear-Host

Write-Host "=== NETWORK RESET ===" -ForegroundColor Cyan
Write-Host ""

ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset

Write-Host ""
Write-Host "Network reset complete." -ForegroundColor Green
Write-Host "A restart may be required." -ForegroundColor Yellow
Write-Host ""

Read-Host "Press Enter to close"