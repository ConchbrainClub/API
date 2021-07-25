class Recommend {
    [int]$Id
    [ValidateNotNullOrEmpty()][string]$Title
    [ValidateNotNullOrEmpty()][string]$Cover
    [ValidateNotNullOrEmpty()][string]$Desc
    [ValidateNotNullOrEmpty()][string]$Link
    [ValidateNotNullOrEmpty()][string]$Lang
}