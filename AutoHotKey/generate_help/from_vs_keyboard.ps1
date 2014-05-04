Get-Content ../../VisualStudio/vskeyboard.vssettings |
    ? { $_ -match "\<Shortcut Command=""(\S+)"".*\>(.*)</Shortcut>" } |
    % { "[sc] {0} `n[def] {1}" -f ($matches[2], $matches[1]) } |
    Get-Unique |
    Out-File "../shortcuts/vs.help" -Append -Encoding "default"
