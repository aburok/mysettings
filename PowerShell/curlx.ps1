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
