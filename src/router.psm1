Import-Module ./database.psm1

$Global:PageSize = 8

function MapEndpoint {

    Add-PodeRoute -Method Get -Path '/List' -ScriptBlock {
        
        $Offset = $($WebEvent.Query["index"] - 1) * $PageSize

        $Results = Get-Recommend -Offset $Offset -Size $PageSize

        if ($null -eq $Results) {
            $Results = @{ 'result' = 'not found' }
        }

        Write-PodeJsonResponse -Value $Results
    }

    Add-PodeRoute -Method Get -Path "/Search" -Scriptblock {

        $Offset = $($WebEvent.Query["index"] - 1) * $PageSize
        $Keyword = $WebEvent.Query["keyword"]

        $Results = Search-Recommend -Keyword $Keyword -Offset $Offset -Size $PageSize

        if ($null -eq $Results) {
            $Results = @{ 'result' = 'not found' }
        }

        Write-PodeJsonResponse -Value $Results
    }

    Add-PodeRoute -Method Put -Path "/Add" -Scriptblock {
        # {
        #     "title": "",
        #     "cover": "",
        #     "desc": "",
        #     "link": "",
        #     "language": ""
        # }
        $Result = $(Add-Recommend -Recommend $WebEvent.Data)
        Write-PodeJsonResponse -Value $Results
    }

    Add-PodeRoute -Method Delete -Path "/Remove" -Scriptblock {
        $Id = $WebEvent.Query["id"]

        $Results = Remove-Recommend -Id $Id

        if ($null -eq $Results) {
            $Results = @{ 'result' = 'not found' }
        }

        Write-PodeJsonResponse -Value $Results
    }

    Add-PodeRoute -Method Post -Path "/Edit" -Scriptblock {
        # {
        #     "id": 0,
        #     "recommend": {
        #         "title": "",
        #         "cover": "",
        #         "desc": "",
        #         "link": "",
        #         "language": ""
        #     }
        # }
        $Result = $(Edit-Recommend -Id $WebEvent.Data.Id -Recommend $WebEvent.Data.Recommend)
        $Response.Send($Result);
    }
}