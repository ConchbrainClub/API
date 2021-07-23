Import-Module Polaris

New-PolarisGetRoute -Path "/" -Scriptblock {
    $Response.Send($(Get-Recommend));
}

New-PolarisGetRoute -Path "/Search" -Scriptblock {
    $Response.Send($(Search-Recommend));
}

New-PolarisPutRoute -Path "/Add" -Scriptblock {
    $Response.Send($(Add-Recommend));
}

New-PolarisDeleteRoute -Path "/Remove" -Scriptblock {
    $Response.Send($(Remove-Recommend));
}

New-PolarisPostRoute -Path "/Edit" -Scriptblock {
    $Response.Send($(Edit-Recommend));
}

Write-Output "Router is recognized"