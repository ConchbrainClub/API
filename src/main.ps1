Import-Module Polaris
New-PolarisGetRoute -Path "/" -Scriptblock {
    $Response.Send('Hello ConchBrain API!');
}

Start-Polaris
