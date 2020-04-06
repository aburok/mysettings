function ImportOrInstallModule([string] $moduleName){
    $module = Get-Module -ListAvailable -Name $moduleName
    if($module){
        Import-Module -Name $moduleName
    }
    else{
        Install-Module -Name $moduleName -Force
    }
}

# ImportOrInstallModule "Pscx"

ImportOrInstallModule "PsReadLine"

# ImportOrInstallModule "posh-git"

