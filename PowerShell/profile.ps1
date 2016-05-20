$PScriptConfig = "${PScript}\config"

. C:\Dropbox\mysettings\PowerShell\variables.ps1

. ($PScript + "\common.functions.ps1")
. ($PScriptConfig + "\events.ps1")

. ($PScriptConfig + ".\git-alias.ps1")
. ($PScriptConfig + "\vim-editor.ps1")
. ($PScriptConfig + "\iis-config.ps1")
. ($PScriptConfig + "\ps-read-line-config.ps1")

. ($PScript + "\prompt-config.ps1")
if($global:poshSettings.lastDirectory){
    Set-Location $global:poshSettings.lastDirectory
}


. ($PScript + "\posh-git-config.ps1")



Write-Host "Dropbox profile loaded..."
