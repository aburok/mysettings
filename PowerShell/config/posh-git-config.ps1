
Import-Module posh-git

$Global:GitPromptSettings.LocalWorkingStatusForegroundColor = [ConsoleColor]::Red
$Global:GitPromptSettings.IndexForegroundColor = [ConsoleColor]::Green
$Global:GitPromptSettings.WorkingForegroundColor = [ConsoleColor]::Red
$Global:GitPromptSettings.BeforeIndexForegroundColor = [ConsoleColor]::Green
$Global:GitPromptSettings.LocalDefaultStatusForegroundColor = [ConsoleColor]::Green
$Global:GitPromptSettings.DefaultForegroundColor = [ConsoleColor]::Yellow

$Global:GitPromptSettings.EnableStashStatus = $true
$Global:GitPromptSettings.EnableWindowTitle = 'PS::'
