function iisstop {
    Write-Host "Stopping IIS Server ... "
    Stop-Service `
        -Force `
        -InputObject $(Get-Service -Name W3SVC)

    $service = Get-WmiObject Win32_Service `
        -Filter "Name='W3SVC'"
    Write-Host "IIS server state : $($service.State)"

}

function iisstart {
    Write-Host "Starting IIS Server ... "
    Start-Service
        -InputObject $(Get-Service -Name W3SVC)

    $service = Get-WmiObject Win32_Service `
        -Filter "Name='W3SVC'"
    Write-Host "IIS server state : $($service.State)"
}