Function Copy-IfMissing ($source, $destination) {
    if ( -not (Test-Path $destination)) {
        Copy-Item $source $destination -Force
    }
}

Function FormatJson($file) {
    Get-Content $file | ConvertFrom-Json | ConvertTo-Json | Set-Content $file
}

Function FormatJsonPy($file) {
    Get-Content $file | python -m json.tool | Set-Content $file
}

Set-Alias Format-Json FormatJsonPy

$props = @{}
$props.WriteHostColor = [ConsoleColor]::Green
$props.WriteCommandForeColor = [ConsoleColor]::Magenta
$props.WriteErrorForeColor = [ConsoleColor]::Red

$global:PoShConfig = New-Object PSObject -Property $props

Function Write-Info ([string] $msg) {
    $text = "Info:    ${msg}"
    Write-Host $text `
        -ForeGround $global:PoShConfig.WriteHostColor
}

Function Write-Command ([string] $command) {
    $text = "command: $command"
    Write-Host $text `
        -ForeGround $global:PoShConfig.WriteCommandForeColor
}

Function Write-Err ([string] $errorMsg) {
    $text = "Error: $errorMsg"
    Write-Host $text `
        -ForeGround $global:PoShConfig.WriteErrorForeColor
}

Function Show-EnvVariables([string] $text) {
    $variables = Get-ChildItem $Env | grep $text
    Write-Host $variables
}

Function Copy-ToFtp([string] $url, [string] $file, [string] $path, [string] $filter) {
    #we specify the directory where all files that we want to upload

    #ftp server
    $user = "user"
    $pass = "Pass"

    $webclient = New-Object System.Net.WebClient

    # $webclient.Credentials = New-Object System.Net.NetworkCredential($user,$pass)

    #list every sql server trace file
    foreach ($item in (dir $path $filter)) {
        "Uploading $item..."
        $uri = New-Object System.Uri($url + $item.Name)
        $webclient.UploadFile($uri, $item.FullName)
    }
    # # create the FtpWebRequest and configure it
    # $ftp = [System.Net.FtpWebRequest]::Create($url)
    # $ftp = [System.Net.FtpWebRequest]$ftp
    # $ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
    # $ftp.Credentials = new-object System.Net.NetworkCredential("anonymous","anonymous@localhost")
    # $ftp.UseBinary = $true
    # $ftp.UsePassive = $true
    # # read in the file to upload as a byte array
    # $content = [System.IO.File]::ReadAllBytes($file)
    # $ftp.ContentLength = $content.Length
    # # get the request stream, and write the bytes into it
    # $rs = $ftp.GetRequestStream()
    # $rs.Write($content, 0, $content.Length)
    # # be sure to clean up after ourselves
    # $rs.Close()
    # $rs.Dispose()
}


function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Repeat-Command([scriptblock] $command, [int] $intervalInSec = 3, [System.TimeSpan] $timer) {
    if (!$timer) {
        $timer = new-timespan -Minutes 30
    }
    $clock = [diagnostics.stopwatch]::StartNew()
    while ($clock.elapsed -lt $timer) {
        Clear-Host
        Write-Host "Last Refresh $(Get-Date)"
        . $command
        start-sleep -seconds $intervalInSec
    }
    write-host "Timer end"
}