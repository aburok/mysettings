
$gitTortoiseResolveCmd = "TortoiseGitProc.exe /command:resolve"
Function git-resolve {
    Invoke-Expression "$gitTortoiseResolveCmd"
}
AddGitAlias "ggresolve" $gitTortoiseResolveCmd "git-resolve"


$gitTortoiseStatusCmd = "TortoiseGitProc.exe /command:repostatus"
Function git-tgStatus {
    Invoke-Expression "$gitTortoiseStatusCmd"
}
AddGitAlias "ggvst" $gitTortoiseStatusCmd "git-tgStatus"

$gitTortoiseShowLogCmd = "TortoiseGitProc /command:log /path:{0}"
function git-tgShowLog([string] $file) {
    if (!$file) {
        $file = "."
    }

    if (!(Test-Path -Path $file)) {
        Write-Host "$file doesn't exists or is not accessible."
        $file = "."
    }

    Invoke-Expression ($gitTortoiseShowLogCmd -f "$file" )
}
AddGitAlias "ggShowLog" $gitTortoiseShowLogCmd "git-tgShowLog"