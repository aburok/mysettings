Register-EngineEvent PowerShell.Exiting -Action {
    if($global:poshSettings.lastDirectory){
        $global:poshSettings.lastDirectory = (Get-Item -Path ".\" -Verbose).FullName
        save-poshsettings
    }
} > $null
