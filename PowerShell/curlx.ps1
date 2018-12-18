Function curlx([string] $url, [string]$user, [string]$pass){
    $pair=("{0}:{1}" -f $user, $pass)
    $pairBytes=[Text.Encoding]::ASCII.GetBytes($pair)
    $base64AuthInfo = [Convert]::ToBase64String($pairBytes)

    $headers = @{};
    $headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo));
    $headers.Add("Accept",  "application/json");

    $response = Invoke-WebRequest $url `
        -Headers $headers `
        -ContentType "application/json" | ConvertFrom-Json

    return $response
}


# Below code allows to make curl requests to site without valid SSL/TSL certificate
# https://stackoverflow.com/questions/11696944/powershell-v3-invoke-webrequest-https-error
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
