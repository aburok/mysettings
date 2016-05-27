Function Copy-IfMissing ($source, $destination){
    if ( -not (Test-Path $destination)){
        Copy-Item $source $destination -Force
    }
}

Function FormatJson($file){
	Get-Content $file | ConvertFrom-Json | ConvertTo-Json | Set-Content $file
}

Function FormatJsonPy($file) {
	Get-Content $file | python -m json.tool | Set-Content $file
}

Set-Alias Format-Json FormatJsonPy

$props = @{}
$props.WriteHostColor = [ConsoleColor]::Green
$props.WriteCommandForeColor = [ConsoleColor]::Green
$props.WriteErrorForeColor= [ConsoleColor]::Red

$global:PoShConfig = New-Object PSObject -Property $props

Function Write-Info ([string] $msg){
    $text = "Info:    ${msg}"
    Write-Host $text `
        -ForeGround $global:PoShConfig.WriteHostColor
}

Function Write-Command ([string] $command){
    $text = "command: $command"
    Write-Host $text `
        -ForeGround $global:PoShConfig.WriteCommandForeColor
}

Function Write-Err ([string] $errorMsg){
    $text = "Error: $errorMsg"
    Write-Host $text `
        -ForeGround $global:PoShConfig.WriteErrorForeColor
}
