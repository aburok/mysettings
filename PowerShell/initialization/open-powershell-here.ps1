################
# This scripts adds "open PowerShell here" command in windows context menu shell for directories
#
# http://powershelleverydayfaq.blogspot.com/2012/08/how-to-work-with-registry-default-values.html
# https://blogs.technet.microsoft.com/heyscriptingguy/2015/04/02/update-or-add-registry-key-value-with-powershell/
# http://stackoverflow.com/questions/31506196/passing-an-registry-key-with-an-asterisk-to-test-path?answertab=active#tab-top
#
# http://vim.wikia.com/wiki/Launch_files_in_new_tabs_under_Windows
#################


$shellPath = "HKLM:\SOFTWARE\Classes\Directory\shell\OpenPowershellHere"
$shellPathCommand = $shellPath + "\command"
$powershellCommand = "C:\\Windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -NoExit -Command Set-Location -LiteralPath '%L'"
$powershellText = "Open powershell here"

. "${env:DropboxSettingsPS}\initialization\add-item-to-context-menu.ps1" $shellPath $shellPathCommand $powershellCommand $powershellText
