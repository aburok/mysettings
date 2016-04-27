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
