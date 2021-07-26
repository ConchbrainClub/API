Import-Module PSSQLite
Import-Module ./models/recommend.psm1

$Database = "../Conchbrain.db"

function Add-Recommend {
    param (
        [Recommend]$Recommend
    )

    $Query = 'INSERT INTO Recommends VALUES(NULL, @title, @cover, @desc, @link, @lang);'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        title = $Recommend.Title
        cover = $Recommend.Cover
        desc = $Recommend.Desc
        link = $Recommend.Link
        lang = $Recommend.Lang
    }

    Write-Output $Result
}

function Remove-Recommend {
    param (
        $Id
    )

    $Query = 'DELETE FROM Recommends WHERE "id" = @id;'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        id = $Id
    }

    Write-Output $Result
}

function Edit-Recommend {
    param (
        $Id,
        $Recommend
    )
    
    $Query = 'UPDATE Recommends SET "title" = @title, "cover" = @cover, "desc" = @desc, "link" = @link, "lang" = @lang WHERE "id" = @id;'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        id = $Id
        title = $Recommend.Title
        cover = $Recommend.Cover
        desc = $Recommend.Desc
        link = $Recommend.Link
        lang = $Recommend.Lang
    }

    Write-Output $Result
}

function Get-Recommend {
    param (
        $Offset,
        $Size
    )

    $Query = 'SELECT * FROM Recommends ORDER BY "id" DESC LIMIT @offset,@size;'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        offset = $Offset
        size = $Size
    }

    Write-Output $Result
}

function Search-Recommend {
    param (
        $Keyword,
        $Offset,
        $Size
    )

    $Query = 'SELECT * FROM Recommends WHERE "title" LIKE @keyword OR "desc" LIKE @keyword ORDER BY "id" DESC LIMIT @offset,@size;'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        keyword = "%$Keyword%"
        offset = $Offset
        size = $Size
    }

    Write-Output $Result
}