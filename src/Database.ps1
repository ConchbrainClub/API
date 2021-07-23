Import-Module PSSQLite

function Add-Recommend {
    param (
        $Article
    )
    Write-Output "Add-Recommend"
}

function Remove-Recommend {
    param (
        $Id
    )
    Write-Output "Remove-Recommend"
}

function Edit-Recommend {
    param (
        $Id,
        $Article
    )
    Write-Output "Edit-Recommend"
}

function Get-Recommend {
    param (
        $PageIndex,
        $PageSize
    )
    Write-Output "Get-Recommend"
}

function Search-Recommend {
    param (
        $Name
    )
    Write-Output "Search-Recommend"
}

Write-Output "Database is recognized"