
$gitPushTagsCmd = "git push origin {0} --tags"
$gitPushTagsDesc = "Pushes all local tags to origin"
Function git-pushTags([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitPushTagsCmd -f $branchName)
}
AddGitAlias "ggphtags" $gitPushTagsCmd "git-pushTags" $gitPushTagsDesc


$gitPullTagsCmd = "git pull origin {0} --tags"
$gitPullTagsDesc = "Pulls all local tags from origin"
Function git-pullTags([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitPullTagsCmd -f $branchName)
}
AddGitAlias "ggpltags" $gitPullTagsCmd "git-pullTags" $gitPullTagsDesc


$gitCreateTagCmd = "git tag -a '{0}' -m '{1}'"
$gitCreateTagDesc = "Create tag on current branch"
Function git-createTag {
    param([string] $tagName, [string] $message)
    git-execCommand ($gitCreateTagCmd -f "$tagName", "$message" )
}
AddGitAlias "ggctag" $gitCreateTagCmd "git-createTag" $gitCreateTagDesc


$gitDeleteTagCmd = "git tag --delete '{0}'; git push --delete origin '{0}'"
$gitDeleteTagDesc = "Delete tag from current branch"
Function git-deleteTag {
    param([string] $tagName)
    git-execCommand ($gitDeleteTagCmd -f "$tagName")
}
AddGitAlias "ggtagdelete" $gitDeleteTagCmd "git-deleteTag" $gitDeleteTagDesc


function git-TagSetToCurrentCommit([string] $tagName, [string] $message) {
    if (! $tagName) {
        Write-Err "Please provide tag name. e.g 1.0.0."
        return
    }
    if (! $message) {
        Write-Err "Please provide source branch for merge"
        return
    }
    git-pullTags 
    git-deleteTag -tagName $tagName
    git-createTag -tagName $tagName -message $message
    git-pushTags 
}
AddGitAlias "ggtagreasign" "Reasign given tag to current commit" "git-TagSetToCurrentCommit"
