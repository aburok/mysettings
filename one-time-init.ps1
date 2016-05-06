. C:\Dropbox\mysettings\PowerShell\variables.ps1

$quickHelperLinkName ="QuickHelper.lnk"

IF(-not (Test-Path "${env:StartUpDirectory}\${quickHelperLinkName}")){
    New-Item -ItemType SymbolicLink `
        -Path "${env:StartUpDirectory}" `
        -Name "${quickHelperLinkName}"`
        -Value "${env:DropboxTools}\QuickHelper\QuickHelper.exe"
}

Copy-Item "${env:DropboxSettingsPS}\profile_host.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\profile.ps1" `
    -Force

