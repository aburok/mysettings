+!?::
ShowHelp()
Sleep 2000
SplashTextOff
return

ShowHelp(){
helpText:= GetHelpText()
SplashTextOn, 500, 600 , Updated script, %helpText%
}

GetCommands(){
Commands := []

Commands.Push({ Letter: "a", Pattern: "^.*(Microsoft Teams).*$", Desc: "MS Teams" })
Commands.Push({ Letter: "b", Pattern: "ahk_exe chrome.exe", Desc: "Chrome" })
Commands.Push({ Letter: "c", Pattern: "ahk_exe ConEmu64.exe", Desc: "Console / Powershell " })
Commands.Push({ Letter: "d", Pattern: "^DevTools - .*$", Desc: "Dev Tools" })
Commands.Push({ Letter: "e", Pattern: "ahk_exe ONENOTE.EXE", Desc: "One Note" })
Commands.Push({ Letter: "f", Pattern: "ahk_exe TOTALCMD64.EXE", Desc: "Total Commander" })
Commands.Push({ Letter: "g", Pattern: "ahk_exe mintty.exe", Desc: "Git \ Tig" })
Commands.Push({ Letter: "h", Pattern: "^.*(Google Hangouts).*$", Desc: "Hangouts" })
Commands.Push({ Letter: "k", Pattern: "^.*(Google Hangouts).*$",Desc: "Hangouts" })
Commands.Push({ Letter: "l", Pattern: "ahk_exe lync.exe", Desc: "Skype" })
Commands.Push({ Letter: "m", Pattern: "i)^.*(mysettings).*(Visual Studio Code)$", Desc: "mySettings / VS Code" })
Commands.Push({ Letter: "n", Pattern: "i)^.*(Notepad\+\+).*$",Desc: "Notepad ++" })
Commands.Push({ Letter: "r", Pattern: "ahk_exe Fiddler.exe" ,Desc: "Fiddler"})
Commands.Push({ Letter: "v", Pattern: "^.*( - Microsoft Visual Studio).*$", Desc: "MS Visual Studio" })
Commands.Push({ Letter: "w", Pattern: "ahk_exe gvim.exe", Desc: "VIM / GVIM" })

return Commands
}

GetHelpText(){
    helpText := "Shortcuts`n"
    helpText .= "Applications - > SHIFT + ALT + D`n`n"

    for index, command in GetCommands()
    {
        helpText.= Format(" {1} -> {2}`n" , command.Letter, command.Desc)
    }

    return helpText
}


#+d::
!+d::

 ShowHelp()
; INPUT, command, T10 L1, {Esc}{LShift}
INPUT, command, T10 L1 I

for index, cmd in GetCommands()
{
    letter:= cmd.Letter
    ; MsgBox, %letter%  %command%
    if(letter == command)   {
        SplashTextOff
        pattern := cmd.Pattern
        MsgBox, %pattern%
        if WinExist(pattern)
            WinActivate
        break
    }
}
SplashTextOff

return
