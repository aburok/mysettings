$psdir = "..\PowerShell\scripts\"

Get-ChildItem "${psdir}\*.ps1" -Recurse  | %{ . $_ }

Write-Host "Custom scripts loaded"

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    Write-Host("> ")
    return ""
}
