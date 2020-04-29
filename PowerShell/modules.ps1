function ImportOrInstallModule([string] $moduleName){
    $module = Get-Module -ListAvailable -Name $moduleName
    if($module){
        Import-Module -Name $moduleName
    }
    else{
        Install-Module -Name $moduleName -Force -AllowClobber -Scope AllUsers
    }
}

ImportOrInstallModule "Pscx"

ImportOrInstallModule "PsReadLine"

# ImportOrInstallModule "posh-git"

