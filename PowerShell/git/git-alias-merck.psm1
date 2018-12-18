function Make-Slug([string] $text){
    $slug = $text -replace '\W+', '-'
    return $slug
}

function git-CreateBranch([string] $name) {
    $branch = Make-Slug $name

    git-checkoutDevelop
    git-execCommand ('git checkout -b {0}' -f "$branch")
}
AddGitAlias "ggNewMerch" "git checkout" "git-CreateBranch" $gitCleanDescription

function git-checkoutDevelop {
    # git-checkout "work"
    git-checkout "develop-redesign"
}
AddGitAlias "ggdevelop" $gitCheckoutCmd "git-checkoutDevelop" $gitCheckoutDesc

$merckRoot = "c:\Projects\MER00005-MerckManuals\app\Merck.Manuals"
$merckWebSrcRoot = "$merckRoot\Merck.Manuals.Web"

$merckDestRoot = "$merckRoot\Merck.Manuals.DevSitecore"

$merckCssRel = "Content\Styles\Redesign"
$merckViewsRel = "Areas\Redesign\Views"
$merckScriptsRel = "Content\Scripts\Redesign"

function Merck-SyncItems {
    Copy-ToMerckDest -relPath $merckCssRel -pattern "*.css"

    Copy-ToMerckDest -relPath $merckScriptsRel -pattern "*.js"
    # Copy-ToMerckDest -relPath "$merckScriptsRel\Knockout" -pattern "*.js"
    # Copy-ToMerckDest -relPath "$merckScriptsRel\Widgets" -pattern "*.js"

    Copy-ToMerckDest -relPath $merckViewsRel -pattern "*.cshtml"
}

function Copy-ToMerckDest([string] $relPath, [string] $pattern){
    . "robocopy" "$merckWebSrcRoot\$relPath\" "$merckDestRoot\$relPath\" "$pattern" "/s" "/xo"

    # $lastChangedFiles = Get-ChildItem -Path "$merckWebSrcRoot\$relPath\$pattern" -Recurse `
    #     | ? { $_.LastWriteTime -ge (Get-Date).AddDays(-1) } `
    #     | % { 
    #         # TODO : Make it work with nested files 
    #         # $path = ($_.FullName).Replace("$merckWebSrcRoot\$relPath\", "");
    #         # Write-Host "$merckWebSrcRoot\$relPath\"
    #         # Write-Host $path
    #         #  Copy-Item -Path $_.FullName -Destination "$merckDestRoot\$relPath\$path" -Verbose 
    #          Copy-Item -Path $_.FullName -Destination "$merckDestRoot\$relPath\$path" -Verbose 
        #  }
}

function Compare-BranchToDevelop($branchName){
    if(-not ($branchName)){
$branchName = git-branchName
    }
    $lastDevelopCommit = iex "git log -n 1 develop-redesign --pretty=format:%H"
    $lastCurrentCommit = iex "git log -n 1 $branchName --pretty=format:%H"

    git-Compare -rev1 $lastDevelopCommit -rev2 $lastCurrentCommit
}

AddGitAlias "ggMerckCompare" "git checkout" "Compare-BranchToDevelop" ""

function Merck-MergeDevelop(){
    # save current branch

    # checkout develop

    # pull develop

    # checkout original branch

    # merge develop into
}