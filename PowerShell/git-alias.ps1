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
