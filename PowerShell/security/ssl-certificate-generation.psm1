function Generate-SslCertificate(
    [string] $domainName,
    [string] $password,
    [string] $certExportPath) {

    if(!$domainName){
        Write-Error "Domain name not specified"
        return
    }

    $certificate = New-SelfSignedCertificate `
        -certstorelocation cert:\localmachine\my `
        -dnsname $domainName `
        -FriendlyName $domainName 

    Write-Host "Certificate thumbprint : $($certificate.Thumbprint)"

    $defaultPassword = "pass"
    if(!$password){
        Write-Host "Password was not provided. " `
         " Using default password: $defaultPassword"
        $password = $defaultPassword
    }

    $pwd = ConvertTo-SecureString `
        -String "$password" `
        -Force -AsPlainText 

    $defaultPath = "$env:temp"
    if(!$certExportPath){
        Write-Host "Export path was not provided" `
         "Exporting certificate to default path: $defaultPath."
        $certExportPath = $defaultPath
    }

    $certFileName = "$domainName.pfx"
    $certPath = Join-Path $certExportPath $certFileName
    Write-Host "Exporting certificate to following location"

    Export-PfxCertificate `
        -cert cert:"\localMachine\my\$($certificate.Thumbprint)" `
        -FilePath $certPath `
        -Password $pwd

    #Open windows explorer where the certificate was created
    # Invoke-Item $certExportPath
    Invoke-Expression "explorer '/select,$certPath'"
}