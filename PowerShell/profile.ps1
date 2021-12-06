# First thing in this file

param([switch] $Force)

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

. ($PScript + "\modules.ps1")
. ($PScript + "\config\ps-read-line-config.ps1")
# . ($PScript + "\common.functions.ps1")
# . ($PScript + "\events.ps1")
# . ($PScript + "\clean-files.ps1")

### Varia 
# Initialize-Config "${PScript}\config"

### GIT
# Initialize-Config "$PScript\git"

### Include all scripts from function Directory
# Initialize-Config "${PScript}\functions"

# Initialize-Config "${PScript}\security"


if($global:poshSettings.lastDirectory `
    -and (Test-Path -Path $global:poshSettings.lastDirectory )){
    Set-Location $global:poshSettings.lastDirectory
}

# Start-SshAgent -Quiet

Write-Host "Dropbox profile loaded..."
$global:DropboxProfileLoaded=1
