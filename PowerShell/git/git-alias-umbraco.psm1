
$gitCleanUSyncCmd = 'git clean -fd .\Source\Application.Web\uSync\ '
$gitCheckoutUSyncCmd = 'git checkout .\Source\Application.Web\uSync\* '
$gitCleanDescription = "Cleaning all untracked changes in files / directories / ignored."
function git-cleanUSync {
    git-execCommand $gitCleanUSyncCmd
    git-execCommand $gitCheckoutUSyncCmd
}
AddGitAlias "ggcleanusync" ($gitCleanUSyncCmd + $gitCheckoutUSyncCmd) "git-cleanUSync" $gitCleanDescription
