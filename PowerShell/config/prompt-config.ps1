function global:prompt {
  $cdelim = [ConsoleColor]::DarkCyan
  $chost = [ConsoleColor]::Green
  $cloc = [ConsoleColor]::Cyan

  write-host (split-path (pwd) -Qualifier ) -n -f $cloc
  Write-Host "\..\" -n -f $cloc
  write-host (split-path (pwd) -Leaf) -n -f $cloc

  Write-VcsStatus

  $global:LASTEXITCODE = $realLASTEXITCODE
  return "> "
}
