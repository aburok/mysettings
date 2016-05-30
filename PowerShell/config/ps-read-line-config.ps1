# PSReadline
#
#
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadlineOption -EditMode Vi
Set-PSReadlineOption -ViModeIndicator Cursor

Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function PossibleCompletions
Set-PSReadlineKeyHandler -Key Tab -Function Complete

