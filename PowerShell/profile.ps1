# First thing in this file

# exit

param([switch] $Force)


oh-my-posh init pwsh --config 'C:/mysettings/PowerShell/.oh-my-posh.theme.omp.json' | Invoke-Expression

# LazyGit configuration file
$env:LG_CONFIG_FILE="C:/mysettings/git/lazygit.yml"

if ($global:DropboxProfileLoaded -eq 1 -and !$Force) {
    Write-Verbose "Profile Already loaded."
    return
}

. C:\mysettings\PowerShell\variables.ps1
. C:\mysettings\PowerShell\common.functions.ps1


Function Import-Functions ($Path) {
    Import-Module $Path -WarningAction @{}
}

Function Initialize-Config() {
    param(
        [string] $path,
        [string] $excludePattern,
        [string] $preInitFile,
        [string] $postInitFile)

    if(!$preInitFile){
        $preInitFile = "pre_init.psm1"
    }
    $preInitFilePath = [io.path]::combine($path ,$preInitFile)

    if(!$postInitFile){
        $postInitFile = "post_init.psm1"
    }
    $postInitFilePath = ([io.path]::combine($path ,$postInitFile))

    if(Test-Path $preInitFilePath){
        Write-Host "Executing pre init file $preinitFilePath"
        Import-Functions $preInitFilePath
    }

    if($excludePattern){
        $files = ls $path -Recurse -Exclude $excludePattern
    }
    else{
        $files = ls $path -Recurse 
    }
    
    $files `
        | ? {$_.Name -ne $preInitFile -and $_.Name -ne $postInitFile } `
        | Sort-Object `
        | % {
            $filePath = Join-Path $path $_.Name
            Write-Host "Executing file $filePath" 
            Import-Functions $filePath
        } `
        | Out-Null

    if(Test-Path $postInitFilePath){
        Write-Host "Executing post init file $postInitFilePath"
        Import-Functions $postInitFilePath
    }
}

# . ($PScript + "\modules.ps1")
. ($PScript + "\config\ps-read-line-config.ps1")

if($global:poshSettings.lastDirectory `
    -and (Test-Path -Path $global:poshSettings.lastDirectory )){
    Set-Location $global:poshSettings.lastDirectory
}

# Enable-PoshTooltips

Write-Host "Dropbox profile loaded..."
$global:DropboxProfileLoaded=1

# Alias
Set-Alias g git
Set-Alias k k9s
set-Alias d docker 
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias zl "z -ListFiles"
Set-Alias npp 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias edit 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias gitext "C:\Program Files\GitExtensions\GitExtensions.exe"
Set-Alias whereis Get-Command

Function get-access () {
    Get-Acl | Format-Table -Wrap
}

Function Open-Gvim([string]$file) {
    . "C:\Program Files\Vim\vim90\gvim.exe" --remote-tab-silent $file 
}
Set-Alias gvim Open-Gvim

Function List_EnvVars { gci env:* | sort-object name }
Set-Alias envs List_EnvVars 

Function Write_Header($text){
    Write-Host "--------------------------------------------------"
    Write-Host $text
    Write-Host "--------------------------------------------------"
}

Set-Alias find "~\AppData\Local\Programs\Git\usr\bin\find.exe"

function Start-ProcessIfStopped([string] $name, [string] $command){
if(-not $(Get-Process -Name $name -ea SilentlyContinue)){
#    $command = $command -replace ' ','` '
    Invoke-Expression "$command"
}
}

Start-ProcessIfStopped -name "AutoHotkey64" -command "C:/mysettings/AutoHotKey/AutoHotKey.ahk"
Start-ProcessIfStopped -name "chrome" -command 'C:\Program` Files\Google\Chrome\Application\chrome.exe'
Start-ProcessIfStopped -name "doublecmd" -command 'C:\Program` Files\Double` Commander\doublecmd.exe'
Start-ProcessIfStopped -name "onenote" -command 'C:\Program` Files\Microsoft` Office\root\Office16\onenote.exe'

function Refresh-Podman {
    Write-Host "Stopping all containers in Podman"
    podman stop --all | Out-Null
    Write-Host "Removing all images from podman"
    podman system prune --all --force && podman rmi --all | Out-Null
}
