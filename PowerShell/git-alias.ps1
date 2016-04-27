function gs { git status }

function git-commit ($message){
    git commit -m $message
}

Set-Alias -Name gic -Value git-commit

function git-reset { git reset HEAD --hard }

Set-Alias -Name gir -Value git-reset

function git-push { git push -u origin master }
Set-alias -name gip -Value git-push

function git-add { git add -A :/ }
Set-alias -name gia -Value git-add

#Set-alias -Name giat -Value git add -n :/

Copy-IfMissing ($env:DropboxSettings + "\git\.gitignore") ($env:USERPROFILE + "\.gitignore")
Copy-IfMissing  ($env:DropboxSettings + "\git\.gitconfig") ($env:USERPROFILE + "\.gitconfig")


# Setting up posh-git colors
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
