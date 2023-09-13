$env:Dropbox="C:\Dropbox"
$env:DropboxTools="${env:Dropbox}\Tools"
$env:DropboxSettings="C:\mysettings"
$env:DropboxSettingsPS="${env:DropboxSettings}\PowerShell"
$env:DropboxSettingsPSHost="${env:DropboxSettingsPS}\host_files"
$PScript = "${env:DropboxSettingsPS}"
$env:DropboxSettingsVim="${env:DropboxSettings}\vim"

$vimExePath="${env:DropboxTools}\vim73-zlib-win32"
$env:Vim="$vimExePath\vim.exe"
$env:GVim="$vimExePath\gvim.exe"

$env:UserDocumentsPath = "${env:USERPROFILE}\Documents"
$env:StartUpDirectory = "${env:USERPROFILE}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"



function AddToPath([string] $path){
    if( -not ($env:Path -Like "*${path}*")){
        $env:Path += $path
    }
}


$initFile = "${env:USERPROFILE}\Documents\_poshSettings.xml"

function save-poshsettings(){
    $global:poshSettings | ConvertTo-Json | Set-Content $initFile
}

if(Test-Path $initFile){
     $global:poshSettings = Get-Content $initFile | ConvertFrom-Json
}
else{
    echo "Creating posh settings file in ${initFile}"
    $props = @{}
    $props.lastDirectory = ""
    $global:poshSettings = New-Object PSObject -Property $props
    save-poshsettings
}
