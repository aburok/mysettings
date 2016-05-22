$gitPushDevCmd = 'git push origin "$branchName":env-dev'
function git-pushDev {
    $branchName = git-branchName
    Write-Info "Pushing changes from '$branchName' to env-dev."
    Write-Command $gitPushDevCmd
    #iex $gitPushDevCmd
}
AddGitAlias "gtped"  $gitPushDevCmd  "git-pushDev"


$gitPushStagingCmd = 'git push origin "$branchName":env-staging --force'
function git-pushStaging {
    $branchName = git-branchName
    Write-Info "Pushing changes from '$branchName' to env-staging ."
    Write-Command $gitPushStagingCmd
    #iex = $gitPushStagingCmd
}
AddGitAlias "gtpes"  $gitPushStagingCmd  "git-pushStaging"

