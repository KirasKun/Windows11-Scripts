Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.SendKeys]::SendWait("^+#{B}")

Write-Host ""
Write-Host "Graphics driver restart signal sent." -ForegroundColor Green
Write-Host ""

Read-Host "Press Enter to close"