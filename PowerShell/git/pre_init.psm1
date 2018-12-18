############################################
############# Creating Array of all commands

$global:myCommands = New-Object System.Collections.ArrayList

function AddGitAlias(
    [string] $alias,
    [string] $commandText,
    [string] $command,
    [string] $description) {

    # Write-Host "Adding alias $alias, $commandText"
    $global:myCommands.Add([pscustomobject] @{
            alias       = "$alias";
            commandText = "$commandText";
            command     = $command;
            description = $description
        }) `
        > $null
}

function git-execCommand([string] $command, [string] $description) {
    Write-Info "===================================================="
    if ($description) {
        Write-Info $description
    }
    Write-Command $command
    iex $command
}

############################################
########### Defining commands ############

$gitBranchNameCmd = ' git rev-parse --abbrev-ref HEAD '
function git-branchName { iex $gitBranchNameCmd }

$gitBranchAllCmd = ' git branch -a'
function git-branchAll { iex $gitBranchAllCmd }

$gitAddCmd = 'git add -A'
$gitCommitCmd = 'git commit -m "{0}"'
$gitAddAndCommitDesc = "Adding all unstaged files to stage,  Commiting staged files... "
function git-commit ([string] $message) {
    if (!$message) {
        Write-Err "Please provide a message for the commit !!!"
        return
    }
    git-execCommand $gitAddCmd $gitAddAndCommitDesc
    git-execCommand ($gitCommitCmd -f $message)
}
AddGitAlias "ggcommit" $gitCommitCmd  "git-commit" $gitAddAndCommitDesc


$gitResetCmd = 'git reset HEAD --hard'
$gitResetDesc = "Unstaging all staged changes "
Function git-reset {
    git-execCommand $gitResetCmd $gitResetDesc
}
AddGitAlias "ggreset" $gitResetCmd "git-reset" $gitResetDesc

#######################################
#####  CHECKOUT

$gitCheckoutCmd = 'git checkout {0}'
$gitCheckoutDesc = "Switching to branch {0}"
function git-checkout([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitCheckoutCmd -f $branchName) ($gitCheckoutDesc -f $branchName)
    git-pull
}
AddGitAlias "ggch"  $gitCheckoutCmd  "git-checkout" $gitCheckoutDesc


function git-checkoutStar {
    git-checkout "*"
}
AddGitAlias "ggcs"  $gitCheckoutCmd  "git-checkoutStar" $gitCheckoutDesc


function git-checkoutWork {
    # git-checkout "work"
    git-checkout "develop-redesign"
}
AddGitAlias "ggwork" $gitCheckoutCmd "git-checkoutWork" $gitCheckoutDesc


function git-checkoutMaster {
    git-checkout "master"
}
AddGitAlias "ggmaster" $gitCheckoutCmd "git-checkoutMaster" $gitCheckoutDesc

################################################

$gitCleanCmd = 'git clean --force -d --exclude=''packages/'' --exclude=''media/'' '
$gitCleanDescription = "Cleaning all untracked changes in files / directories / ignored."
function git-clean {
    git-execCommand $gitCleanCmd $gitCleanDescription
}
AddGitAlias "ggcln" $gitCleanCmd "git-clean" $gitCleanDescription


$gitRemoveUnstageFilesCmd = 'git ls-files --others --exclude-standard | % { rm $_ }'
function git-RemoveUnstaged {
    git-execCommand $gitRemoveUnstageFilesCmd
}
AddGitAlias "ggRemoveUnstaged" $gitRemoveUnstageFilesCmd "git-RemoveUnstaged" ""

$gitRevertAllDesc = "Reverting all changes in current working directory (staged, unstaged, tracked, untracked, ignored)"
function git-revertAll {
    param ([switch] $clean)

    Write-Info $gitRevertAllDesc
    git-reset
    git-checkout
    if (!$clean) {
        git-clean
    }
}
AddGitAlias "ggrevert" "$gitResetCmd ; $gitCheckoutStarCmd ; $gitCleanCmd " "git-revertAll" $gitRevertAllDesc


$gitUndoLastCommitCmd = "git reset HEAD^"
$gitUndoLastCommitDesc = "Undoing last commit, moving HEAD to previous commit."
function git-undoLastCommit {
    git-execCommand $gitUndoLastCommitCmd $gitUndoLastCommitDesc
}
AddGitAlias "ggundoLastCommit" $gitUndoLastCommitCmd  "git-undoLastCommit" $gitUndoLastCommitDesc


# $gitAssignBranchToCommitCmd = "git branch -f {0} {1} "
# $gitAssignBranchToCommitDesc = "Assign branch to commit after doing git reset"
# function git-assignBranchToCommit([string] $) {
#     git-execCommand $gitUndoLastCommitCmd $gitUndoLastCommitDesc
# }
# AddGitAlias "ggundoLastCommit" $gitUndoLastCommitCmd  "git-undoLastCommit" $gitUndoLastCommitDesc


#
# http://stackoverflow.com/questions/6934752/combining-multiple-commits-before-pushing-in-git
$gitSquashCmd = "git rebase -i origin/{0}"
function git-squash {
    $currentBranch = git-branchName
    git-execCommand ($gitSquashCmd -f $currentBranch )
}


# http://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore
$gitForgetIgnoredCmd = "git rm --cached {0} -r"
function git-forget([string] $fileName) {
    if (!$fileName) {
        Write-Err "Please provide a file to forget about!!"
        return
    }
    git-execCommand ($gitForgetIgnoredCmd -f $fileName )
}
AddGitAlias "ggforget" $gitForgetIgnoredCmd  "git-forget" $gitForgetIgnoredCmd


$gitPushCmd = "git push origin {0}"
$gitPushDesc = "Pushing changes from current branch to origin."
function git-push ([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitPushCmd -f $branchName) $gitPushDesc
    # git-pushTags $branchName
}
AddGitAlias "ggph" $gitPushCmd  "git-push" $gitPushDesc


$gitPullCmd = "git pull origin {0}"
$gitPullDesc = "Pulling changes from origin to current branch. This will update code from origin. Eqivalent to SVN update."
function git-pull ([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitPullCmd -f $branchName) $gitPullDesc
    git-execCommand "git submodule update --recursive --remote"
    git-pullTags $branchName
}
AddGitAlias "ggpl" $gitPullCmd  "git-pull" $gitPullDesc


$gitSaveDesc = "Save current work with generic message"
Function git-save {
    $time = Get-Date -format u
    git-commit "Save at $time"
}
AddGitAlias "ggsave" $gitCommitCmd "git-save" $gitSaveDesc


$gitSavePushDesc = "Save current changes and push them into otigin"
Function git-savePush {
    git-save
    git-push
}
AddGitAlias "ggsave" $gitCommitCmd "git-savePush" $gitSavePushDesc


Function git-clone([string] $repoAddress) {
    git-execCommand "git clone $repoAddress"
}

$gitMergeDesc = "Merge branch '{0}' to current branch '{1}'"
$gitMergeCmd = "git merge {0}"
function git-merge([string] $mergeFromBranch) {
    if (! $mergeFromBranch) {
        Write-Err "Please provide source branch for merge"
        return
    }
    git-execCommand ($gitMergeCmd -f $mergeFromBranch)
    git-push
}
AddGitAlias "ggmerge" $gitMergeCmd "git-merge" $gitMergeDesc


$gitRefreshDesc = "Refresh master and work branches by pulling all changes from them"
Function git-refresh {
    $currentBranch = git-branchName
    git-checkoutMaster
    git-checkoutWork
    git-checkout $currentBranch
}
AddGitAlias "ggrefresh" $gitPushCmd "git-refresh" $gitResetDesc


$gitNewBranchCmd = 'git checkout -b {0}'
$gitNewBranchDesc = "Create new branch from updated work branch"
function git-newBranch([string] $branch, [string] $branchType){
    if(!$branch){
        Write-Err "Please provide name for new branch !!!"
        return
    }

    if(!$branchType){
        Write-Err "Please provide branch type for new branch !!!"
        return
    }
    # Stash any existing changes, to prevent errors while pull
    $wasStashed = git-execCommand "git stash"

    git-checkoutWork
    git-pull
    git-execCommand ($gitNewBranchCmd -f "$branchType/$branch")

    # Apply stashed changes if there are any 
    if($wasStashed.StartsWith("Saved working")){
        git-execCommand "git stash pop"
    }
}
AddGitAlias "ggnb" "$gitCheckoutWorkCmd; $gitPullWorkCmd; $gitNewBranchCmd" "git-newBranch" $gitNewBranchDesc



$gitRefreshAllDesc = "Refresh master and work branches by pulling all changes from them"
Function git-refreshAll {
    git-GetAllRemoteBranches | % { git-checkout $_ }
    git-checkoutMaster
}
AddGitAlias "ggrefreshAll" $gitPushCmd "git-refresh" $gitResetDesc



Function git-pushToMasterAndTag {
    git-pushOrigin "work" "master"
    git-createTag $tagName $tagDescription
    git-pushTags
}
AddGitAlias "ggpushwork2master" $gitPushWorkToMasterCmd "git-pushToMasterAndTag"

$gitPushOnOriginCmd = 'git push origin {0}:{1} --force'
$gitPushOnOriginDesc =  "Pushing changes from branch {0} to {1}."
function git-pushOrigin  {
    param($from, $to)

    git-execCommand ($gitPushOnOriginCmd -f $from, $to) ($gitPushOnOriginDesc -f $from, $to)
}


# Help function
function MyGitHelp([string] $filter) {
    Write-Info "My git commands"
    $filteredCommands = $global:myCommands

    if ($filter) {
        $likeFilter = "*$filter*"
        $filteredCommands = $filteredCommands | Where {
            ($_.alias -like $likeFilter) `
                -or ($_.commandText -like $likeFilter) `
                -or ($_.description -like $likeFilter)
        }
    }

    $filteredCommands `
        | Sort-Object Alias `
        | ForEach {
        "`t" + $_.alias + 
        "`t- " + $_.description + 
        "`n`t`t" + $_.commandText + 
        "`n"}
}
AddGitAlias "gghelp" "Displays this help text" "MyGitHelp"
