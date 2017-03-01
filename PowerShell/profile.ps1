# First thing in this file
#
if ($global:DropboxProfileLoaded -eq 1) {
    return
}

. C:\Dropbox\mysettings\PowerShell\variables.ps1


$PScriptConfig = "${PScript}\config"

. ($PScript + "\modules.ps1")
. ($PScript + "\common.functions.ps1")
. ($PScript + "\events.ps1")

. ($PScriptConfig + "\posh-git-config.ps1")
. ($PScriptConfig + "\vim-editor-config.ps1")
. ($PScriptConfig + "\iis-config.ps1")
. ($PScriptConfig + "\ps-read-line-config.ps1")
. ($PScriptConfig + "\prompt-config.ps1")

. ($PScriptConfig + "\git-alias.ps1")

$PSfunctions = "${PScript}\functions"

### Include all scripts from function Directory
ls $PSfunctions -Recurse | % {. (Join-Path $PSfunctions $_.Name)} | Out-Null


if($global:poshSettings.lastDirectory){
    Set-Location $global:poshSettings.lastDirectory
}

Start-SshAgent -Quiet

Write-Host "Dropbox profile loaded..."
$global:DropboxProfileLoaded=1
