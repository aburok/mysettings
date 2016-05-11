Register-EngineEvent PowerShell.Exiting -Action {
    $global:poshSettings.lastDirectory = (Get-Item -Path ".\" -Verbose).FullName
    save-poshsettings
} > $null
