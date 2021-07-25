. ./models/*.ps1
. ./database.ps1
./router.ps1

Write-Output "Starting server..."
Start-Polaris

Write-Output "Server start successful!"