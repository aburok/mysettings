################
# This scripts adds "edit in Vim" command in windows context menu shell
#
# http://powershelleverydayfaq.blogspot.com/2012/08/how-to-work-with-registry-default-values.html
# https://blogs.technet.microsoft.com/heyscriptingguy/2015/04/02/update-or-add-registry-key-value-with-powershell/
# http://stackoverflow.com/questions/31506196/passing-an-registry-key-with-an-asterisk-to-test-path?answertab=active#tab-top
#
# http://vim.wikia.com/wiki/Launch_files_in_new_tabs_under_Windows
#################

$shellPath = "HKLM:\SOFTWARE\Classes\*\shell\EditWithVim"
$shellPathCommand = $shellPath + "\command"
$editWithVimCmd = "C:\Dropbox\Tools\vim73-zlib-win32\gvim.exe -p --remote-tab-silent %1 "
$editWithVimText = "Edit in Vim"

. "./add-item-to-context-menu.ps1" $shellPath $shellPathCommand $editWithVimCmd $editWithVimText

