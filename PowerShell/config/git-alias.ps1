function gts { git status }

function gtd {
    Write-Host "git diff"
    git diff
    git diff --staged
}

function git-branchName { git rev-parse --abbrev-ref HEAD }

function git-commit ($message){
    git commit -m $message
}

function git-reset { git reset HEAD --hard }

function git-undoLastCommit { git reset HEAD^ }

function git-push () {
    $branchName = git-branchName
    Write-Host "Pushing changes from '${branchName}' to origin."
    git push -u origin $branchName
}

function git-add { git add -A :/ }

function git-grep ([string] $pattern) { git grep $pattern }


Set-alias -name gta -Value git-add
Set-Alias -Name gtc -Value git-commit
Set-Alias -Name gtg -Value git-grep
Set-alias -name gtp -Value git-push
Set-Alias -Name gtr -Value git-reset
Set-alias -Name gtuc -Value git-undoLastCommit

#Set-alias -Name giat -Value git add -n :/

Copy-IfMissing ($env:DropboxSettings + "\git\.gitignore") ($env:USERPROFILE + "\.gitignore")
Copy-IfMissing  ($env:DropboxSettings + "\git\.gitconfig") ($env:USERPROFILE + "\.gitconfig")

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

