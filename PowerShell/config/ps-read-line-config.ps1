# PSReadline
#

Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function PossibleCompletions
Set-PSReadlineKeyHandler -Key Tab -Function Complete
