
function git-pushDev {
    $branchName = git-branchName

    git-pushOrigin $branchName "env-dev"
}
AddGitAlias "ggpdev"  $gitPushDevCmd  "git-pushDev" $gitPushDevDesc


function git-pushStaging {
    git-checkoutWork
    git-pushOrigin "work" "env-staging"
}
AddGitAlias "ggpstag"  $gitPushStagingCmd  "git-pushStaging" $gitPushStagingDesc

function git-pushClientStaging {
    $branchName = git-branchName
    
    git-pushOrigin $branchName "client-staging"
}
AddGitAlias "ggPushClientStag"  $gitPushStagingCmd  "git-pushClientStaging" $gitPushStagingDesc


function git-mergeWorkToMaster(){
    Write-Err "Never merge work to master . Always use PUSH."

    # git-checkoutMaster
    #   git-merge "work"
}
AddGitAlias "ggmwm" $gitMergeCmd "git-mergeWorkToMaster" "Merge work branch into master branch"

Function Cogworks-CopyStyles(){
    Copy-Item .\dist\styles\* ..\Source\Application.Web\css\ -Verbose -Force

    Copy-Item .\dist\fonts\* ..\Source\Application.Web\fonts\ -Verbose -Force
    Copy-Item .\dist\scripts\* ..\Source\Application.Web\scripts\ -Verbose -Force
    Copy-Item .\dist\images\* ..\Source\Application.Web\images\ -Verbose -Force
}

