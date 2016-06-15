
$gitPushDevCmd = 'git push origin {0}:env-dev --force'
$gitPushDevDesc =  "Pushing changes from current branch ({0}) to env-dev."
function git-pushDev {
    $branchName = git-branchName
    git-execCommand ($gitPushDevCmd -f $branchName) $gitPushDevDesc
}
AddGitAlias "ggpdev"  $gitPushDevCmd  "git-pushDev" $gitPushDevDesc


$gitPushStagingCmd = 'git push origin work:env-staging --force'
$gitPushStagingDesc =  "Pushing changes from work branch to env-staging ."
function git-pushStaging {
    git-execCommand $gitPushStagingCmd $gitPushStagingDesc
}
AddGitAlias "ggpstag"  $gitPushStagingCmd  "git-pushStaging" $gitPushStagingDesc

$gitCheckoutWorkCmd = 'git checkout work'
$gitPullWorkCmd = 'git pull origin work'
$gitNewBranchCmd = 'git checkout -b {0}'
$gitNewBranchDesc = "Create new branch from updated work branch"
function git-newBranch([string] $branch, [string] $branchType){
    if(!$branch){
        Write-Err "Please provide name for new branch !!!"
        return
    }
    git-execCommand $gitCheckoutWorkCmd $gitNewBranchDesc
    git-execCommand $gitPullWorkCmd
    git-execCommand ($gitNewBranchCmd -f "$branchType/$branch")
}
AddGitAlias "ggnb" "$gitCheckoutWorkCmd; $gitPullWorkCmd; $gitNewBranchCmd" "git-newBranch" $gitNewBranchDesc


function git-newFeatureBranch([string] $branch){
    git-newBranch $branch "feature"
}
AddGitAlias "ggnbf" $gitNewBranchCmd "git-newFeatureBranch" "create new feature branch"

function git-newBugFixBranch([string] $branch){
    git-newBranch $branch "bugfix"
}
AddGitAlias "ggnbbf" $gitNewBranchCmd "git-newBugFixBranch" "create new bug fix branch"


function git-mergeWorkToMaster(){
    git-checkout "master"
    git-merge "work"
}
AddGitAlias "ggmwm" $gitMergeCmd "git-mergeWorkToMaster" "Merge work branch into master branch"
