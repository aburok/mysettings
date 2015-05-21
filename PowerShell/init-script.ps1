$psdir = "C:\Dropbox\mysettings\PowerShell\"

$poshGit = Get-Item "${psdir}\scripts\posh-git\profile.example.ps1"
$gitAlias = Get-Item "${psdir}\git-alias.ps1"

$scripts = $poshGit, $gitAlias

# below line executred all scripts
#$scripts = Get-ChildItem $psdir -Recurse -Include *.ps1 -Exclude install.ps1

$scripts | %{ Write-Host $_.Name }
$scripts | %{ . $_ }

#Write-Host "Custom scripts loaded"


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
