Function FormatJson($file){
	Get-Content $file | ConvertFrom-Json | ConvertTo-Json | Set-Content $file
}

Function FormatJsonPy($file) {
	Get-Content $file | python -m json.tool | Set-Content $file	
}

Set-Alias Format-Json FormatJsonPy