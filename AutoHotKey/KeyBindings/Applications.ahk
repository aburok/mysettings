+!?::
    ShowHelp()
    Sleep 2000
    SplashTextOff
return

#+d::
!+d::

    ShowHelp()
    ; INPUT, command, T10 L1, {Esc}{LShift}
    INPUT, command, T10 L1 I

    LaunchCommand(command)

    SplashTextOff

return

ShowHelp(){
    helpText:= GetHelpText()
    SplashTextOn, 500, 600 , Updated script, %helpText%
}

SetGlobals(){
    global

}

AddCommand(letter, winLetter, titlePattern, description){
    global

    Commands.Push({ Letter: letter, WinLetter: winLetter, Pattern: titlePattern, Desc: description })
}

GetCommands(){
    global

    if(Commands && Commands.Length() > 0){
        return Commands
    }

    Commands := []

    AddCommand( "a", "#+a",  "ahk_exe Teams.exe", "MS Teams" )
    AddCommand( "b", "#+b", "ahk_exe chrome.exe", "Chrome" )
    AddCommand( "c", "#+c", "ahk_exe ConEmu64.exe", "Console / Powershell " )
    AddCommand( "d", "", "DevTools -", "Dev Tools" )
    AddCommand( "e", "#+e", "ahk_exe ONENOTE.EXE", "One Note" )
    AddCommand( "f", "#+f", "ahk_exe TOTALCMD64.EXE", "Total Commander" )
    AddCommand( "g", "#+g", "ahk_exe mintty.exe", "Git \ Tig" )
    AddCommand( "h", "", "Google Hangouts", "Hangouts" )
    AddCommand( "k", "", "Google Hangouts", "Hangouts" )
    AddCommand( "l", "", "ahk_exe lync.exe", "Skype" )
    AddCommand( "m", "", "ahk_exe Code.exe", "mySettings / VS Code" )
    AddCommand( "n", "#+n", "ahk_exe notepad++.exe", "Notepad ++" )
    AddCommand( "o", "#+o", "ahk_exe OUTLOOK.exe", "MS Outlook" )
    AddCommand( "r", "", "ahk_exe Fiddler.exe" ,  "Fiddler")
    AddCommand( "v", "#+v", "ahk_exe devenv.exe", "MS Visual Studio" )
    AddCommand( "w", "#+m", "ahk_exe gvim.exe", "VIM / GVIM" )

    for index, element in Commands
    {
        winLetter:= element.WinLetter
        name := element.Pattern
        hasWinLetter := winLetter && StrLen(winLetter) > 0
        ; MsgBox, Try Bind %winLetter% %name% %hasWinLetter%
        if(hasWinLetter){
            ; Custom hotkey register function
            Hotkey(winLetter, "ActivateWindow", name)
        }
    }
    return Commands
}

ActivateWindow(name){
    exists := WinExist("" . name)
    ;MsgBox, %name% %exists%
    if exists
        WinActivate
    return
}

GetHelpText(){
    global
    if(helpText && helpText.Length() > 0){
        return helpText
    }

    helpText := "Shortcuts`n"
    helpText .= "Applications - > SHIFT + ALT + D`n`n"

    for index, command in GetCommands()
    {
        helpText.= Format(" {1} -> {2}`n" , command.Letter, command.Desc)
    }

    return helpText
}


SetTitleMatchMode, 2
SetTitleMatchMode, Slow

LaunchCommand(command){
    global

    for index, cmd in Commands
    {
        letter:= cmd.Letter
        ; MsgBox, %letter%  %command%
        if(letter == command)   {
            ActivateWindow(cmd.Pattern)
        }
    }
}


GetCommands()
