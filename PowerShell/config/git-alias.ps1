function gts { git status }

function gtd { git diff }

function git-commit ($message){
    git commit -m $message
}
Set-Alias -Name gtc -Value git-commit

function git-reset { git reset HEAD --hard }
Set-Alias -Name gtr -Value git-reset

function git-undoLastCommit { git reset HEAD^ }
Set-alias -Name gulc -Value git-undoLastCommit

function git-push ([string] $branch) { git push -u origin $branch }
Set-alias -name gpo -Value git-push



function git-add { git add -A :/ }
Set-alias -name gta -Value git-add

function git-grep ([string] $pattern) { git grep $pattern }
Set-Alias -Name gg -Value git-grep

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

