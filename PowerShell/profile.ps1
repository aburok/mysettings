# First thing in this file

# exit

param([switch] $Force)


oh-my-posh init pwsh --config 'C:/mysettings/PowerShell/.oh-my-posh.theme.omp.json' | Invoke-Expression


if ($global:DropboxProfileLoaded -eq 1 -and !$Force) {
    Write-Verbose "Profile Already loaded."
    return
}

. C:\mysettings\PowerShell\variables.ps1


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

Set-Alias find "C:\Users\dawkor\AppData\Local\Programs\Git\usr\bin\find.exe"