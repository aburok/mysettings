# First thing in this file
. C:\Dropbox\mysettings\PowerShell\variables.ps1

$PScriptConfig = "${PScript}\config"

. ($PScript + "\common.functions.ps1")
. ($PScript + "\events.ps1")

. ($PScriptConfig + "\posh-git-config.ps1")
. ($PScriptConfig + "\vim-editor-config.ps1")
. ($PScriptConfig + "\iis-config.ps1")
. ($PScriptConfig + "\ps-read-line-config.ps1")
. ($PScriptConfig + "\prompt-config.ps1")

. ($PScriptConfig + "\git-alias.ps1")

if($global:poshSettings.lastDirectory){
    Set-Location $global:poshSettings.lastDirectory
}


Write-Host "Dropbox profile loaded..."
