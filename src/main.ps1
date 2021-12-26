Import-Module Polaris
Import-Module ./router.psm1

Write-Output "Starting server..."

# Config middleware pipeline
New-PolarisRouteMiddleware -Name JsonBodyParser -Scriptblock {

    $IsPutOrPost = $("PUT" -eq $Request.Method -or "POST" -eq $Request.Method)

    if ($Request.BodyString -ne $null -and $IsPutOrPost) {
        $Request.Body = ConvertFrom-Json -InputObject $Request.BodyString
    }
}

# Route Static file
MapStaticFile

# Route
MapEndpoint

# Start http server
Start-Polaris -Port 5000

Write-Host "Press 'q' to exit" -NoNewline

while($true)
{
    $key = [Console]::ReadKey('?')

    if ($key.Key -eq "Q") {
        Stop-Polaris
        exit
    }
}