############################################
############# Creating Array of all commands

$myCommands = New-Object System.Collections.ArrayList

function AddGitAlias([string] $alias,
    [string] $commandText,
    [string] $command,
    [string] $description){
    $myCommands.Add([pscustomobject] @{
        alias="$alias";
        commandText="$commandText";
        command=$command;
        description=$description}) `
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
$gitCommitCmd = 'git commit -m "{0}"'
function git-commit ([string] $message){
    Write-Info "Adding all unstaged files to stage "
    Write-Command $gitAddCmd
    iex $gitAddCmd

    Write-Info "Commiting staged files... "
    Write-Command ($gitCommitCmd -f $message)

    iex ($gitCommitCmd -f $message)
}
AddGitAlias "gtc"  "$gitCommitCmd"  "git-commit"


$gitResetCmd = 'git reset HEAD --hard'
$gitResetDesc =  "Unstaging all staged changes "
Function git-reset {
    Write-Info $gitResetDesc
    Write-Command $gitResetCmd
    iex $gitResetCmd
}
AddGitAlias "gtrst" $gitResetCmd "git-reset" $gitResetDesc


$gitCheckoutStarCmd = 'git checkout *'
$gitCheckoutStarDesc = "Undoing unstaged changes to tracked files / directories"
function git-checkout {
    Write-Info $gitCheckoutStarDesc
    Write-Command $gitCheckoutStarCmd
    iex $gitCheckoutStarCmd
}
AddGitAlias "gtcs"  $gitCheckoutStarCmd  "git-clean" $gitCheckoutStarDesc


$gitCleanCmd = 'git clean -fd'
$gitCleanDescription =  "Cleaning all untracked changes in files / directories / ignored."
function git-clean {
    Write-Info $gitCleanDescription
    Write-Command $gitCleanCmd
    iex $gitCleanCmd
}
AddGitAlias "gtcln" $gitCleanCmd "git-clean" $gitCleanDescription


$gitRevertAllDesc = "Reverting all changes in current working directory (staged, unstaged, tracked, untracked, ignored)"
function git-revertAll {
    Write-Info $gitRevertAllDesc
    git-reset
    git-checkout
    git-clean
}
AddGitAlias "gtrvrt" "$gitResetCmd ; $gitCheckoutStarCmd ; $gitCleanCmd " "git-revertAll" $gitRevertAllDesc


$gitUndoLastCommitCmd = 'git reset HEAD^'
function git-undoLastCommit {
    Write-Info "Undoing last commit, moving HEAD one step behind"
    Write-Command $gitUndoLastCommitCmd

    iex $gitUndoLastCommitCmd
}
AddGitAlias "gtu"  "$gitUndoLastCommitCmd"  "git-undoLastCommit"


$gitPushCmd = 'git push origin {0}'
$gitPushDesc =  "Pushing changes from current branch to origin."
function git-push () {
    $branchName = git-branchName
    Write-Info $gitPushDesc
    Write-Command ($gitPushCmd -f $branchName)
    iex ($gitPushCmd -f $branchName)
}
AddGitAlias "gtp"  "$gitPushCmd"  "git-push" $gitPushDesc


$gitHistoryCmd = 'git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
Function git-history([number] $lastNCommits = 20){
    Write-Info "Getting history "
    Write-Command $gitHistoryCmd
    iex $gitHistoryCmd | Select -First $lastNCommits
}
AddGitAlias "gtlog" $gitHistoryCmd "git-history"


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

# git log man : https://git-scm.com/docs/git-log
# Format options :
# %d: ref names, like the --decorate option of git-log[1] - branch names
# %ar: author date, relative
# %h: abbreviated commit hash
# %s: subject - commit message
# %an: author name - of a commit
$gitLogGraphCmd = "git log --graph " +
    "--abbrev-commit " +
    "--decorate "+
    "--format=format:'" +
        "%C(bold yellow)%d%C(reset) " +       # branch name
        "%C(bold green)(%ar)%C(reset) " +     # date of commit
        "%n      " +                          # new line
        "%C(bold blue)%h%C(reset) - " +       # short hash of commit
        "%C(white)%s%C(reset) " +             # commit message
        "%C(dim white)   [%an]%C(reset)" +    # author name
        "' --all"
function git-logGraph(){
    Write-Info "Getting branch tree "
    iex $gitLogGraphCmd
}

####### Import Cogworks specific commands  ####
. ($PScriptConfig + "\cogworks-git-alias.ps1")
################################################


# Help function
function MyGitHelp(){
    Write-Info "My git commands"
    $myCommands | ForEach { "   " + $_.alias + "   " + $_.commandText + ""}
}


# Setting Aliases
$myCommands | ForEach { Set-Alias -Name $_.alias -Value $_.command }


