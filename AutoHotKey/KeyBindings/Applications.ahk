;+!?::
;    ShowHelp()
;    Sleep 2000
;    SplashTextOff
;return
#Include %A_ScriptDir%\Common\Common.ahk
#Include %A_ScriptDir%\FastNavigation\Navigation.ahk

!^+d::

    subItem := 
    rootLevel := new AppMenuLevel("d", "+!d")
        .AddItem(new AppMenuLevel( "b", "Chrome", "#b", "ahk_exe chrome.exe"))
        .AddItem(new AppMenuLevel( "c", "Console / Powershell " , "#c", "ahk_exe ConEmu64.exe"))
        .AddItem(new AppMenuLevel( "d", "Dev Tools" , "", "DevTools -"))
        .AddItem(new AppMenuLevel( "x", "Double Commander" , "#f", "ahk_exe doublecmd.exe"))
;        .AddItem(new AppMenuLevel( "f", "Firefox" , "#f", "ahk_exe firefox.exe"))
        .AddItem(new AppMenuLevel( "g", "Git \ Tig" , "#+g", "ahk_exe GitExtensions.exe"))
        .AddItem(new AppMenuLevel( "u", "Hangouts" , "", "Google Hangouts"))
        .AddItem(new AppMenuLevel( "h", "Host Files" , "", "ahk_exe HostsFileEditor.exe"))
        .AddItem(new AppMenuLevel( "k", "Hangouts" , "", "Google Hangouts"))
        .AddItem(new AppMenuLevel( "m", "mySettings / VS Code" , "", "ahk_exe Code.exe"))
        .AddItem(new AppMenuLevel( "r", "mRemote - Remote desktop", "", "ahk_exe mRemoteNG.exe" ))
        .AddItem(new AppMenuLevel( "n", "Notepad ++" , "#+n", "ahk_exe notepad++.exe"))
        .AddItem(new AppMenuLevel( "z", "Notepad ++" , "", "ahk_exe notepad++.exe"))
        .AddItem(new AppMenuLevel( "e", "One Note" , "#+e", "ahk_exe ONENOTE.EXE"))
        .AddItem(new AppMenuLevel( "o", "Outlook" , "#+o", "ahk_exe OUTLOOK.exe"))
        .AddItem(new AppMenuLevel( "t", "Outlook" , "#+t", "ahk_exe OUTLOOK.exe"))
        .AddItem(new AppMenuLevel( "l", "Razl" , "", "ahk_exe Razl.exe"))
        .AddItem(new AppMenuLevel( "a", "Teams" , "#+a",  "ahk_exe Teams.exe"))
        .AddItem(new AppMenuLevel( "v", "Visual Studio" , "#v", "ahk_exe devenv.exe"))
        .AddItem(new AppMenuLevel( "s", "Slack" , "", "ahk_exe slack.exe"))
        .AddItem(GetGuidFormat("q"))
        .AddItem(new AppMenuLevel( "w", "VIM / GVIM" , "#+m", "ahk_exe gvim.exe"))
        .AddItem(new CopyFilePathNavigationItem("y", "Yank Path"))

    rootLevel.ShowCommandsAndLaunchSelected()

return

