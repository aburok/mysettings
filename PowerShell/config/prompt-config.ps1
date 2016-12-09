function global:prompt {
    $cdelim = [ConsoleColor]::DarkCyan
    $chost = [ConsoleColor]::Green
    $cloc = [ConsoleColor]::White
    $ctime = [ConsoleColor]::Green

    $currentTime = $(Get-Date).ToString("MM.dd HH:mm:ss")

    Write-Host "==========================================" # Line to destinguish commands
    Write-Host "[$currentTime] " -n -f $ctime               # Write current time without a date
    write-host (split-path (pwd) -Qualifier ) -n -f $cloc   # Disk letter (C:\)
    Write-Host "\..\" -n -f $cloc                           # ...
    write-host (split-path (pwd) -Leaf) -n -f $cloc         # Write current flder name

    Write-VcsStatus                                         # Git information
    Write-Host ""                                           # New line

    $global:LASTEXITCODE = $realLASTEXITCODE
    return ">>> "
}
