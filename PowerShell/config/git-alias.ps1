function gts { git status }

function gtd {
    Write-Host "git diff"
    git diff
    git diff --staged
}

function git-branchName { git rev-parse --abbrev-ref HEAD }

function git-commit ($message){
    Write-Host "Adding all unstaged files to stage (git add .)"
    git add .
    Write-Host "Commiting staged files..."
    git commit -m $message
}

function git-clean {
    Write-Host "Reseting all staged changes (git reset HEAD --hard)"
    git reset HEAD --hard
    Write-Host "Unding unstaged changes (git checkout *)"
    git checkout *
}

function git-undoLastCommit {
    Write-Host "Undoing last commit, moving HEAD one step behind (git reset HEAD^)"
    git reset HEAD^
}

function git-push () {
    $branchName = git-branchName
    Write-Host "Pushing changes from '${branchName}' to origin."
    git push -u origin $branchName
}

function git-add { git add -A :/ }

function git-grep ([string] $pattern) { git grep $pattern }


Set-alias -name gta -Value git-add
Set-Alias -Name gtc -Value git-commit
Set-Alias -Name gtcln -Value git-clean
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

