
$gitTortoiseResolveCmd = "TortoiseGitProc.exe /command:resolve"
Function git-resolve {
    Invoke-Expression "$gitTortoiseResolveCmd"
}
AddGitAlias "ggresolve" $gitTortoiseResolveCmd "git-resolve"


$gitTortoiseStatusCmd = "TortoiseGitProc.exe /command:repostatus"
Function git-tgStatus {
    Invoke-Expression "$gitTortoiseStatusCmd"
}
AddGitAlias "ggShowChanges" $gitTortoiseStatusCmd "git-tgStatus"

$gitTortoiseShowLogCmd = "TortoiseGitProc /command:log /path:{0} "
function git-tgShowLog(
    [string] $file,
    [string] $filter
) {
    if (!$file) {
        $file = "."
    }
    if (!(Test-Path -Path $file)) {
        Write-Host "$file doesn't exists or is not accessible."
        $file = "."
    }

    $cmd = ($gitTortoiseShowLogCmd -f "$file" )
    if ($filter) {
        $cmd += " /findstring:'$filter'"
    }

    git-execCommand $cmd
}
AddGitAlias "ggShowLog" $gitTortoiseShowLogCmd "git-tgShowLog"

$gitTortoiseCompareCmd = "TortoiseGitProc.exe /command:showcompare /revision1:{0} /revision2:{1}"
function git-Compare([string] $rev1, [string] $rev2) {
    if (!$rev1) {
        $rev1 = "HEAD"
    }
    if (!$rev2) {
        $rev2 = "HEAD^"
    }
    git-execCommand ($gitTortoiseCompareCmd -f $rev1, $rev2)
}
AddGitAlias "ggCompareCommits" $gitTortoiseCompareCmd "git-Compare"


$gitTortoiseCommitCmd = "TortoiseGitProc.exe /command:commit /logmsg:'{0}' "
function git-CommitVisual([string] $commitMessage) {
    git-execCommand ($gitTortoiseCommitCmd -f $commitMessage)
}
AddGitAlias "ggCommitVisual" $gitTortoiseCommitCmd "git-CommitVisual"