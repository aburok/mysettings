
$gitPushTagsCmd = "git push origin {0} --tags"
$gitPushTagsDesc = "Pushes all local tags to origin"
Function git-pushTags([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitPushTagsCmd -f $branchName)
}
AddGitAlias "ggPushTags" $gitPushTagsCmd "git-pushTags" $gitPushTagsDesc


$gitPullTagsCmd = "git pull origin {0} --tags"
$gitPullTagsDesc = "Pulls all local tags from origin"
Function git-pullTags([string] $branchName) {
    IF (!$branchName) {
        $branchName = git-branchName
    }
    git-execCommand ($gitPullTagsCmd -f $branchName)
}
AddGitAlias "ggPullTags" $gitPullTagsCmd "git-pullTags" $gitPullTagsDesc


$gitShowAllTagsCmd = "git tag --sort=-version:refname | Select -First {0} "
$gitShowAllTagsDesc = "Shows last n tags"
Function git-showTags([int16] $number = 5) {
    git-execCommand ($gitShowAllTagsCmd -f $number)
}
AddGitAlias "ggTags" $gitShowAllTagsCmd "git-showTags" $gitShowAllTagsDesc


$gitCreateTagCmd = "git tag -a '{0}' -m '{1}'"
$gitCreateTagDesc = "Create tag on current branch"
Function git-createTag {
    param([string] $tagName, [string] $message)
    if(!$tagname){
        Write-Info "you need to provide tag name"
        Write-Command $gitcreatetagcmd
        git-showTags -number 10
        return
    }
    if(!$message){
        Write-Info "you need to provide message"
        Write-Command $gitcreatetagcmd
        return
    }
    git-execCommand ($gitCreateTagCmd -f "$tagName", "$message" )
}
AddGitAlias "ggCreateTag" $gitCreateTagCmd "git-createTag" $gitCreateTagDesc


$gitDeleteTagCmd = "git tag --delete '{0}'; git push --delete origin '{0}'"
$gitDeleteTagDesc = "Delete tag from current branch"
Function git-deleteTag {
    param([string] $tagName)
    git-execCommand ($gitDeleteTagCmd -f "$tagName")
}
AddGitAlias "ggDeleteTag" $gitDeleteTagCmd "git-deleteTag" $gitDeleteTagDesc


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
AddGitAlias "ggReasignTag" "Reasign given tag to current commit" "git-TagSetToCurrentCommit"
