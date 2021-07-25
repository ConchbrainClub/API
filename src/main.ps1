Write-Output "Starting server..."

Import-Module Polaris
. ./database.ps1
. ./router.ps1

New-PolarisRouteMiddleware -Name JsonBodyParser -Scriptblock {

    $IsPutOrPost = $("PUT" -eq $Request.Method -or "POST" -eq $Request.Method)

    if ($Request.BodyString -ne $null -and $IsPutOrPost) {
        $Request.Body = ConvertFrom-Json -InputObject $Request.BodyString
    }
}

Start-Polaris

Write-Output "Server start successful!"