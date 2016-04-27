$env:Dropbox="C:\Dropbox"
$env:DropboxTools= $env:Dropbox + "\Tools"
$env:Path += ";" + $env:DropboxTools + "\curl\bin"

$env:DropboxSettings = $env:Dropbox + "\mysettings"
$env:DropboxSettingsPS = $env:DropboxSettings + "\PowerShell"
$env:DropboxSettingsVim = $env:DropboxSettings + "\vim"

$env:Path += ";" + $env:WinDir + "\Microsoft.NET\Framework64\v4.0.30319"
$env:path += ";" + $env:ProgramFiles + "\Git\bin"
$env:path += ";" + $env:ProgramFiles + "\Git\usr\bin"

$env:Vim= $env:DropboxTools + "\vim73-zlib-win32\vim.exe"

$PScript = $env:DropboxSettingsPS

. ($PScript + "\common.functions.ps1")

. ($PScript + "\scripts\posh-git\install.ps1")
. ($PScript + "\scripts\posh-git\profile.example.ps1")
. ($PScript + ".\git-alias.ps1")

. ($PScript + "\vim-editor.ps1")




