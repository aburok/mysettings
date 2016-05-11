function gs { git status }

function git-commit ($message){
    git commit -m $message
}
Set-Alias -Name gic -Value git-commit

function git-reset { git reset HEAD --hard }
Set-Alias -Name gir -Value git-reset

function git-push([string] $branch) { git push -u origin $branch }
Set-alias -name gpo -Value git-push



function git-add { git add -A :/ }
Set-alias -name gia -Value git-add

function git-grep ([string] $pattern) { git grep $pattern }
Set-Alias -Name gg -Value git-grep

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


$global:GitAllSettings = New-Object PSObject -Property @{
	FolderForegroundColor       = [ConsoleColor]::Cyan
}

function git-all()
{
	$s = $global:GitAllSettings
	dir -r -i .git -fo | % {
		pushd $_.fullname
		cd ..
		write-host -fore $s.FolderForegroundColor (get-location).Path
		git-fetchall
		popd
	}
}

function git-fetchall()
{
	$remotes = git remote
	if($remotes){
		$remotes | foreach {
			Write-Host 'Fetching from' $_
			git fetch $_ --all
		}
	}else{
		Write-Host 'No remotes for this repository'
	}
	git status
}

