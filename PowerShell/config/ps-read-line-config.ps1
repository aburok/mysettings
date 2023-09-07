# PSReadline
#
#
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadlineOption -EditMode Vi

# Not Needed any more
#Set-PSReadlineOption -PredictionSource History


# ViModeIndicator was not working well with oh-my-posh (it was blinking and taking some time to reload)
# Set-PSReadlineOption -ViModeIndicator Prompt

Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function PossibleCompletions
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward