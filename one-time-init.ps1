. C:\mysettings\PowerShell\modules.ps1
. C:\mysettings\PowerShell\variables.ps1

$quickHelperLinkName ="QuickHelper.lnk"

# IF(-not (Test-Path "${env:StartUpDirectory}\${quickHelperLinkName}")){
#     New-Item -ItemType SymbolicLink `
#         -Path "${env:StartUpDirectory}" `
#         -Name "${quickHelperLinkName}"`
#         -Value "${env:DropboxTools}\QuickHelper\QuickHelper.exe"
# }

IF(-not (Test-Path "${env:USERPROFILE}\Documents\WindowsPowerShell\")){
	New-Item -ItemType directory -Path "${env:USERPROFILE}\Documents\WindowsPowerShell\" -Verbose
}


Copy-Item "${env:DropboxSettingsPSHost}\profile.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\profile.ps1" `
    -Verbose `
    -Force

Copy-Item "${env:DropboxSettingsPSHost}\profile.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" `
    -Verbose `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_files_User_Dir\_vimrc" `
    -Destination "${env:USERPROFILE}\_vimrc" `
    -Verbose `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_files_User_Dir\_vsvimrc" `
    -Destination "${env:USERPROFILE}\_vsvimrc" `
    -Verbose `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_files_User_Dir\_gvimrc" `
    -Destination "${env:USERPROFILE}\_gvimrc" `
    -Verbose `
    -Force

Copy-Item "${env:DropboxSettings}\git\.gitignore" `
    "${env:USERPROFILE}\.gitignore" `
    -Verbose 

Copy-Item "${env:DropboxSettings}\git\.gitconfig" `
    "${env:USERPROFILE}\.gitconfig" `
    -Verbose 

# . "${env:DropboxSettingsPS}\initialization\edit-with-vim-context-menu.ps1"

## Set Explorer settings
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1
Stop-Process -processname explorer



[Environment]::SetEnvironmentVariable("TIGRC_USER", "c:\mysettings\git\.tigrc", "Machine")


Copy-Item "${env:DropboxSettings}\VisualStudioCode\settings.json" `
    -Destination "${env:APPDATA}\Code\User\settings.json" `
    -Verbose

Copy-Item "${env:DropboxSettings}\VisualStudioCode\keybindings.json" `
    -Destination "${env:APPDATA}\Code\User\keybindings.json" `
    -Verbose