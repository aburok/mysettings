function AddToPath([string] $path){
    if( -not ($env:Path -Like "*${path}*")){
        $env:Path += $path
    }
}

AddToPath(";${env:WinDir}\Microsoft.NET\Framework64\v4.0.30319")
AddToPath(";${env:ProgramFiles}\Git\bin")
AddToPath(";${env:ProgramFiles}\Git\usr\bin")


$env:Dropbox="C:\Dropbox"
$env:DropboxTools="${env:Dropbox}\Tools"
$env:DropboxSettings="${env:Dropbox}\mysettings"
$env:DropboxSettingsPS="${env:DropboxSettings}\PowerShell"
$PScript = "${env:DropboxSettingsPS}"
$env:DropboxSettingsVim="${env:DropboxSettings}\vim"
AddToPath(";${env:DropboxTools}\curl\bin")

$env:Vim="${env:DropboxTools}\vim73-zlib-win32\vim.exe"

$env:UserDocumentsPath = "${env:USERPROFILE}\Documents"
$env:StartUpDirectory = "${env:USERPROFILE}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


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
