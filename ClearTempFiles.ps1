# Requires Administrator

Write-Host ""
Write-Host "=== Windows Cleanup Script ===" -ForegroundColor Cyan
Write-Host ""

$Folders = @(
    $env:TEMP,
    "C:\Windows\Temp",
    "C:\Windows\Prefetch"
)

foreach ($Folder in $Folders)
{
    if (Test-Path $Folder)
    {
        Write-Host "Cleaning: $Folder" -ForegroundColor Yellow

        try
        {
            Get-ChildItem -Path $Folder -Force -ErrorAction SilentlyContinue |
                Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

            Write-Host "  Done" -ForegroundColor Green
        }
        catch
        {
            Write-Host "  Some files could not be removed (likely in use)." -ForegroundColor DarkYellow
        }
    }
}

Write-Host ""
Write-Host "Emptying Recycle Bin..." -ForegroundColor Yellow

try
{
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "  Done" -ForegroundColor Green
}
catch
{
    Write-Host "  Unable to empty Recycle Bin." -ForegroundColor DarkYellow
}

Write-Host ""
Write-Host "=================================" -ForegroundColor Cyan
Write-Host " Cleanup Complete!" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to close"