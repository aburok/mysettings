. C:\Dropbox\mysettings\PowerShell\variables.ps1

. ($PScript + "\common.functions.ps1")

. ($PScript + "\scripts\posh-git\install.ps1")
. ($PScript + "\scripts\posh-git\profile.example.ps1")
. ($PScript + ".\git-alias.ps1")

. ($PScript + "\vim-editor.ps1")


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

Write-Host "Dropbox profile loaded..."
