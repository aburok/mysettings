
################
#
# http://powershelleverydayfaq.blogspot.com/2012/08/how-to-work-with-registry-default-values.html
# https://blogs.technet.microsoft.com/heyscriptingguy/2015/04/02/update-or-add-registry-key-value-with-powershell/
# http://stackoverflow.com/questions/31506196/passing-an-registry-key-with-an-asterisk-to-test-path?answertab=active#tab-top
#
# http://vim.wikia.com/wiki/Launch_files_in_new_tabs_under_Windows
#################

param(
    [string] $shellPath,
    [string] $shellPathCommand,
    [string] $commandValue,
    [string] $commandText
)

$shellPathExists = Test-Path -LiteralPath $shellPath
if(!$shellPathExists){
    Write-Host "Creating $shellPath entry in registry"
    New-Item -Path $shellPath
    New-ItemProperty -LiteralPath $shellPath -Name "(Default)" -Value $commandText
}
else{
    Set-ItemProperty -LiteralPath $shellPath -Name "(Default)" -Value $commandText
}

$shellPathCommandExists = Test-Path -LiteralPath $shellPathCommand
if(!$shellPathCommandExists){
    Write-Host "Creating $shellPathCommand entry in registry"
    New-Item -Path $shellPathCommand
    New-ItemProperty -LiteralPath $shellPathCommand -Name "(Default)" -Value $commandValue
}
else{
    Set-ItemProperty -LiteralPath $shellPathCommand -Name "(Default)" -Value $commandValue
}

