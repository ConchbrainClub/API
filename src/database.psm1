Import-Module PSSQLite

$Database = "../Conchbrain.db"

function Add-Recommend {
    param (
        $Recommend
    )

    $Query = 'INSERT INTO Recommends VALUES(NULL, @title, @cover, @desc, @link, @language);'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        title = $Recommend.Title
        cover = $Recommend.Cover
        desc = $Recommend.Desc
        link = $Recommend.Link
        language = $Recommend.Language
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
    
    $Query = 'UPDATE Recommends SET "title" = @title, "cover" = @cover, "desc" = @desc, "link" = @link, "language" = @language WHERE "id" = @id;'

    $Result = Invoke-SqliteQuery -DataSource $Database -Query $Query -SqlParameters @{
        id = $Id
        title = $Recommend.Title
        cover = $Recommend.Cover
        desc = $Recommend.Desc
        link = $Recommend.Link
        language = $Recommend.Language
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