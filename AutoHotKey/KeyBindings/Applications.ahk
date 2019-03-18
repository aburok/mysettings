;+!?::
;    ShowHelp()
;    Sleep 2000
;    SplashTextOff
;return

!+d::

    subItem := new AppMenuLevel( "a", "MS Teams" , "#+a",  "ahk_exe Teams.exe")
    rootLevel := new AppMenuLevel("d", "+!d")
        .AddItem(subItem)
        .AddItem(new AppMenuLevel( "b", "Chrome", "#+b", "ahk_exe chrome.exe"))
        .AddItem(new AppMenuLevel( "c", "Console / Powershell " , "#+c", "ahk_exe ConEmu64.exe"))
        .AddItem(new AppMenuLevel( "d", "Dev Tools" , "", "DevTools -"))
        .AddItem(new AppMenuLevel( "e", "One Note" , "#+e", "ahk_exe ONENOTE.EXE"))
        .AddItem(new AppMenuLevel( "f", "Total Commander" , "#+f", "ahk_exe TOTALCMD64.EXE"))
        .AddItem(new AppMenuLevel( "g", "Git \ Tig" , "#+g", "ahk_exe mintty.exe"))
        .AddItem(new AppMenuLevel( "h", "Hangouts" , "", "Google Hangouts"))
        .AddItem(new AppMenuLevel( "k", "Hangouts" , "", "Google Hangouts"))
        .AddItem(new AppMenuLevel( "l", "Skype" , "", "ahk_exe lync.exe"))
        .AddItem(new AppMenuLevel( "m", "mySettings / VS Code" , "", "ahk_exe Code.exe"))
        .AddItem(new AppMenuLevel( "n", "Notepad ++" , "#+n", "ahk_exe notepad++.exe"))
        .AddItem(new AppMenuLevel( "o", "MS Outlook" , "#+o", "ahk_exe OUTLOOK.exe"))
        .AddItem(new AppMenuLevel( "r",  "Fiddler", "", "ahk_exe Fiddler.exe" ))
        .AddItem(new AppMenuLevel( "v", "MS Visual Studio" , "#+v", "ahk_exe devenv.exe"))
        .AddItem(new AppMenuLevel( "w", "VIM / GVIM" , "#+m", "ahk_exe gvim.exe"))
        .AddItem(new CopyFilePathNavigationItem("y", "Yank Path"))

    rootLevel.ShowHelp()

return

