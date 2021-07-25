Import-Module Polaris

$PageSize = 8

New-PolarisGetRoute -Path "/*" -Scriptblock {
    
    $Offset = $($Request.Query["index"] - 1) * $PageSize

    $Results = Get-Recommend -Offset $Offset -Size $PageSize
    $RespBody = ""

    if ($null -ne $Results) {
        $RespBody = $(ConvertTo-Json -InputObject $Results -Compress)
    } else {
        $Response.SetStatusCode(404)
    }

    $Response.Json($RespBody)
}

New-PolarisGetRoute -Path "/Search" -Scriptblock {

    $Offset = $($Request.Query["index"] - 1) * $PageSize
    $Keyword = $Request.Query["keyword"]

    $Results = Search-Recommend -Keyword $Keyword -Offset $Offset -Size $PageSize
    $RespBody = ""

    if ($null -ne $Results) {
        $RespBody = $(ConvertTo-Json -InputObject $Results -Compress)
    } else {
        $Response.SetStatusCode(404)
    }

    $Response.Json($RespBody)
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