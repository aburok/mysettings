# PSReadline
#
#
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadlineOption -EditMode Vi

# ViModeIndicator was not working well with oh-my-posh (it was blinking and taking some time to reload)
# Set-PSReadlineOption -ViModeIndicator Prompt

Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function PossibleCompletions
Set-PSReadlineKeyHandler -Key Tab -Function Complete

