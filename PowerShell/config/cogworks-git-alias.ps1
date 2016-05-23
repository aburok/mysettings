$gitPushDevCmd = 'git push origin {0}:env-dev'
$gitPushDevDesc =  "Pushing changes from current branch ({0}) to env-dev."
function git-pushDev {
    $branchName = git-branchName
    Write-Info ($gitPushDevDesc -f $branchName)
    Write-Command ($gitPushDevCmd -f $branchName)
    iex ($gitPushDevCmd -f $branchName)
}
AddGitAlias "ggpdev"  $gitPushDevCmd  "git-pushDev" $gitPushDevDesc


$gitPushStagingCmd = 'git push origin work:env-staging --force'
$gitPushStagingDesc =  "Pushing changes from work branch to env-staging ."
function git-pushStaging {
    Write-Info $gitPushStagingDesc
    Write-Command $gitPushStagingCmd
    iex $gitPushStagingCmd
}
AddGitAlias "ggpstag"  $gitPushStagingCmd  "git-pushStaging" $gitPushStagingDesc

$gitCheckoutWorkCmd = 'git checkout work'
$gitPullWorkCmd = 'git pull origin work'
$gitNewBranchCmd = 'git checkout -b {0}'
$gitNewBranchDesc = "Create new branch from updated work branch"
function git-newBranch([string] $branch){
    if(!$branch){
        Write-Err "Please provide name for new branch !!!"
        return
    }
    Write-Info $gitNewBranchDesc
    Write-Command $gitCheckoutWorkCmd
    iex $gitCheckoutWorkCmd

    Write-Command $gitPullWorkCmd
    iex $gitPullWorkCmd

    Write-Command ($gitNewBranchCmd -f $branch)
    iex ($gitNewBranchCmd -f $branch)
}
AddGitAlias "ggnb" "$gitCheckoutWorkCmd; $gitPullWorkCmd; $gitNewBranchCmd" "git-newBranch" $gitNewBranchDesc
