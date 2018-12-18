$startup = [Environment]::GetFolderPath("Startup");

$autohotkey = "${env:DropboxSettings}\Autohotkey\AutoHotKey.ahk"
$autohotkeyLink = "$startup\Autohotkey.lnk"

if (!(Test-Path $autohotkeyLink)) {
    Write-Info "Adding Auto Hot Key to Startup folder"
    New-Item -Path $autohotkeyLink `
        -ItemType SymbolicLink `
        -Value $autohotkey > $null
} else {
    Write-Warning " Auto Hot Key already exists in Startup folder"
}