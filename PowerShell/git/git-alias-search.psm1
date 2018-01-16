
$gitStatusCmd = ' git status --short'
function git-status {
    git-execCommand $gitStatusCmd
}
AddGitAlias "ggst" "$gitStatusCmd" "git-status"


$gitDiffCmd = 'git diff'
function git-diff {
    Write-Info "git diff"
    iex $gitDiffCmd
    git diff --staged
}
AddGitAlias "ggdf" $gitDiffCmd "git-diff" "show changes in files"



$gitGrepCmd = "git grep --ignore-case --line-number -B {0} -A {1} '{2}' -- './{3}' "
function git-grep () {
    param(
        [string] $pattern,
        [int] $before = 0,
        [int] $after = 0,
        [string] $include = "*",
        [string] $exclude = $null,
        [switch] $includeRB
    )
    $gitGrepCmdResult = $gitGrepCmd
    if (! $includeRB) {
        $exclude = "*.css,rbdotcom*.js,dist/**"
    }

    if ($exclude) {
        "$exclude".Split("{,}") | % { $gitGrepCmdResult += (" ':(exclude)*/{0}'" -f $_ ) }
    }

    git-execCommand ($gitGrepCmdResult -f $before, $after, $pattern, $include )
}
AddGitAlias "ggfind" $gitGrepCmd "git-grep"  "search for a string in repository"



# git log man : https://git-scm.com/docs/git-log
# Format options :
# %d: ref names, like the --decorate option of git-log[1] - branch names
# %ar: author date, relative
# %h: abbreviated commit hash
# %s: subject - commit message
# %an: author name - of a commit
$gitLogGraphCmd = "git log --graph " + 
"--abbrev-commit " + 
"--decorate " + 
"--format=format:'" + 
"%C(bold yellow)%d%C(reset) " + # branch name
"%n      " + # new line
"%C(bold green)(%ar)%C(reset) " + # date of commit
"%C(dim white) [%an]%C(reset) - " + # author name
"%C(white)%s%C(reset) " + # commit message
"%C(bold blue)[%h]%C(reset)" + # short hash of commit
"' --all" + 
" --since='{0}'"
$gitLogGraphDesc = "Getting branch tree "
function git-logGraph {
    param($fromLastDays = 14)

    $sinceDate = "{0:yyyy-MM-dd}" -f (Get-Date).AddDays(-1 * $fromLastDays)
    git-execCommand ($gitLogGraphCmd -f $sinceDate) $gitLogGraphDesc
}
AddGitAlias "ggbranchlog" $gitLogGraphCmd "git-logGraph" $gitLogGraphDesc


$gitHistoryCmd = "git log " + 
" --pretty=format:'" + 
"%C(bold blue)%h%C(reset)" + # short hash of commit
"%C(bold yellow)%d%C(reset) \\ " + 
"%C(dim white) [%an]%C(reset) - " + # author name
"%C(white)%s%C(reset) " + # commit message
"' --since='{0}'" + 
" --decorate "
$gitHistoryDesc = "Getting commit history of current branch."
Function git-history {
    param($sinceDays = 30)

    $sinceDate = "{0:yyyy-MM-dd}" -f (Get-Date).AddDays(-1 * $sinceDays)
    git-execCommand ($gitHistoryCmd -f $sinceDate) $gitHistoryDesc
}
AddGitAlias "gghist" $gitHistoryCmd "git-history" $gitHistoryDesc
