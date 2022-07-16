if ($false -eq $(Test-Path Conchbrain.db)) {
    sqlite Conchbrain.db ".read ./database.sql"
}

if ($null -eq $(Get-Module -ListAvailable Pode)) {
    Install-Module -Name Pode -Scope CurrentUser -Force
}

if ($null -eq $(Get-Module -ListAvailable PSSQLite)) {
    Install-Module -Name PSSQLite -Scope CurrentUser -Force
}