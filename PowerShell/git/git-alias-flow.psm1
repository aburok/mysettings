
function git-newFeatureBranch([string] $branch){
    git-newBranch $branch "feature"
}
AddGitAlias "ggNewFeature" $gitNewBranchCmd "git-newFeatureBranch" "create new feature branch"


function git-newReleasBranch([string] $branch){
    git-newBranch $branch "release"
}
AddGitAlias "ggNewRelease" $gitNewBranchCmd "git-newFeatureBranch" "create new feature branch"


function git-newBugFixBranch([string] $branch){
    git-newBranch $branch "bugfix"
}
AddGitAlias "ggNewBugFix" $gitNewBranchCmd "git-newBugFixBranch" "create new bug fix branch"
