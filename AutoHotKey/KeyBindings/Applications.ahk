;+!?::
;    ShowHelp()
;    Sleep 2000
;    SplashTextOff
;return

!+d::

    subItem := new AppMenuLevel( "a", "#+a",  "ahk_exe Teams.exe", "MS Teams" )
    rootLevel := new AppMenuLevel("d", "+!d")
        .AddItem(subItem)
        .AddItem(new AppMenuLevel( "b", "#+b", "ahk_exe chrome.exe", "Chrome" ))
        .AddItem(new AppMenuLevel( "c", "#+c", "ahk_exe ConEmu64.exe", "Console / Powershell " ))
        .AddItem(new AppMenuLevel( "d", "", "DevTools -", "Dev Tools" ))
        .AddItem(new AppMenuLevel( "e", "#+e", "ahk_exe ONENOTE.EXE", "One Note" ))
        .AddItem(new AppMenuLevel( "f", "#+f", "ahk_exe TOTALCMD64.EXE", "Total Commander" ))
        .AddItem(new AppMenuLevel( "g", "#+g", "ahk_exe mintty.exe", "Git \ Tig" ))
        .AddItem(new AppMenuLevel( "h", "", "Google Hangouts", "Hangouts" ))
        .AddItem(new AppMenuLevel( "k", "", "Google Hangouts", "Hangouts" ))
        .AddItem(new AppMenuLevel( "l", "", "ahk_exe lync.exe", "Skype" ))
        .AddItem(new AppMenuLevel( "m", "", "ahk_exe Code.exe", "mySettings / VS Code" ))
        .AddItem(new AppMenuLevel( "n", "#+n", "ahk_exe notepad++.exe", "Notepad ++" ))
        .AddItem(new AppMenuLevel( "o", "#+o", "ahk_exe OUTLOOK.exe", "MS Outlook" ))
        .AddItem(new AppMenuLevel( "r", "", "ahk_exe Fiddler.exe" ,  "Fiddler"))
        .AddItem(new AppMenuLevel( "v", "#+v", "ahk_exe devenv.exe", "MS Visual Studio" ))
        .AddItem(new AppMenuLevel( "w", "#+m", "ahk_exe gvim.exe", "VIM / GVIM" ))

    rootLevel.ShowHelp()

return

