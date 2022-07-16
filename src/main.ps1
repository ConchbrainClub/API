Import-Module Pode
Import-Module ./router.psm1

Start-PodeServer {
    # attach to port 8080 for http
    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

    # Config middleware pipeline
    Add-PodeMiddleware -Name Example -ScriptBlock {
        Add-PodeHeader -Name Name1 -Value Value1
        Add-PodeHeader -Name Name1 -Value Value2
        Add-PodeHeader -Name Name1 -Value Value2
    }

    MapEndpoint
}