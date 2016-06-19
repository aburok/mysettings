. C:\Dropbox\mysettings\PowerShell\modules.ps1
. C:\Dropbox\mysettings\PowerShell\variables.ps1

$quickHelperLinkName ="QuickHelper.lnk"

IF(-not (Test-Path "${env:StartUpDirectory}\${quickHelperLinkName}")){
    New-Item -ItemType SymbolicLink `
        -Path "${env:StartUpDirectory}" `
        -Name "${quickHelperLinkName}"`
        -Value "${env:DropboxTools}\QuickHelper\QuickHelper.exe"
}

IF(-not (Test-Path "${env:USERPROFILE}\Documents\WindowsPowerShell\")){
	New-Item -ItemType directory -Path "${env:USERPROFILE}\Documents\WindowsPowerShell\"
}


Copy-Item "${env:DropboxSettingsPSHost}\profile.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\profile.ps1" `
    -Force

Copy-Item "${env:DropboxSettingsPSHost}\profile.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_vimrc"`
    -Destination "${env:USERPROFILE}\_vimrc" `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_vsvimrc" `
    -Destination "${env:USERPROFILE}\_vsvimrc" `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_gvimrc" `
    -Destination "${env:USERPROFILE}\_gvimrc" `
    -Force

Copy-Item "${env:DropboxSettings}\git\.gitignore" `
    "${env:USERPROFILE}\.gitignore"
Copy-Item "${env:DropboxSettings}\git\.gitconfig" `
    "${env:USERPROFILE}\.gitconfig"

. "${env:DropboxSettingsPS}\initialization\edit-with-vim-context-menu.ps1"

## Set Explorer settings
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
Stop-Process -processname explorer
