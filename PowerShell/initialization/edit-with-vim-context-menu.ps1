################
# This scripts adds "edit in Vim" command in windows context menu shell
#################


$shellPath = "HKLM:\SOFTWARE\Classes\*\shell\EditWithVim"
$shellPathCommand = $shellPath + "\command"
$editWithVimCmd = "C:\Dropbox\Tools\vim73-zlib-win32\gvim.exe -p --remote-tab-silent %1 %*"
$editWithVimText = "Edit in Vim"

$editWithVimExists = Test-Path -LiteralPath $shellPath
if(!$editWithVimExists){
    Write-Host "Creating $shellPath entry in registry"
    New-Item -Path $shellPath
    New-ItemProperty -LiteralPath $shellPath -Name "(Default)" -Value $editWithVimText
}
else{
    Set-ItemProperty -LiteralPath $shellPath -Name "(Default)" -Value $editWithVimText
}

$editWithVimCommandExists = Test-Path -LiteralPath $shellPathCommand
if(!$editWithVimCommandExists){
    Write-Host "Creating $shellPathCommand entry in registry"
    New-Item -Path $shellPathCommand
    New-ItemProperty -LiteralPath $shellPathCommand -Name "(Default)" -Value $editWithVimCmd
}
else{
    Set-ItemProperty -LiteralPath $shellPathCommand -Name "(Default)" -Value $editWithVimCmd
}

