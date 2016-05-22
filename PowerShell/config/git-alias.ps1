############################################
############# Creating Array of all commands

$myCommands = New-Object System.Collections.ArrayList

function AddGitAlias([string] $alias, [string] $commandText, [string] $command ){
    $myCommands.Add([pscustomobject] @{
        alias="$alias";
        commandText="$commandText";
        command=$command}) `
    > $null
}

############################################
########### Defining commands ############

$gitStatusCmd =  ' git status '
function git-status {
    Write-Command $gitStatusCmd
    Invoke-Expression $gitStatusCmd
}
AddGitAlias "gts" "$gitStatusCmd" "git-status"


$gitDiffCmd = 'git diff'
function gtd {
    Write-Info "git diff"
    iex $gitDiffCmd
    git diff --staged
}


$gitBranchNameCmd = ' git rev-parse --abbrev-ref HEAD '
function git-branchName { iex $gitBranchNameCmd }


$gitAddCmd = 'git add .'
$gitCommitCmd = 'git commit -m '
function git-commit ([string] $message){
    Write-Info "Adding all unstaged files to stage "
    Write-Command $gitAddCmd

    iex $gitAddCmd

    Write-Info "Commiting staged files... "
    Write-Command $gitCommitCmd

    iex $gitCommitCmd $message
}
AddGitAlias "gtc"  "$gitCommitCmd"  "git-commit"


$gitResetCmd = 'git reset HEAD --hard'
$gitCheckoutStarCmd = 'git checkout *'
function git-clean {
    Write-Info "Reseting all staged changes "
    Write-Command $gitResetComd
    iex $gitResetCmd

    Write-Info "Undoing unstaged changes "
    Write-Command $gitCheckoutStarCmd
    iex $gitCheckoutStarCmd
}
AddGitAlias "gtcln"  "$gitResetCmd ; $gitCheckoutStarCmd"  "git-clean"


$gitUndoLastCommitCmd = 'git reset HEAD^'
function git-undoLastCommit {
    Write-Info "Undoing last commit, moving HEAD one step behind"
    Write-Command $gitUndoLastCommitCmd

    iex $gitUndoLastCommitCmd
}
AddGitAlias "gtu"  "$gitUndoLastCommitCmd"  "git-undoLastCommit"


$gitPushCmd = 'git push -u origin $branchName'
function git-push () {
    $branchName = git-branchName
    Write-Info "Pushing changes from '$branchName' to origin."
    Write-Command $gitPushCmd
    iex $gitPushCmd
}
AddGitAlias "gtp"  "$gitPushCmd"  "git-push"

function git-grep ([string] $pattern) { git grep $pattern }

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



####### Import Cogworks specific commands  ####
. ($PScriptConfig + "\cogworks-git-alias.ps1")
################################################


# Help function
function MyGitHelp(){
    Write-Info "My git commands"
    $myCommands | ForEach { "\t '" + $_.alias + "' - '" + $_.commandText + "'"}
}


# Setting Aliases
$myCommands | ForEach { Set-Alias -Name $_.alias -Value $_.command }


