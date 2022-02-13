;+!?::
;    ShowHelp()
;    Sleep 2000
;    SplashTextOff
;return
#Include %A_ScriptDir%\Common\Common.ahk
#Include %A_ScriptDir%\FastNavigation\Navigation.ahk

!^+d:: {

    subItem := 
    rootLevel := AppMenuLevel("d", "+!d")
    .AddItem(AppMenuLevel( "b", "Chrome", "#b", "ahk_exe chrome.exe"))
    .AddItem(AppMenuLevel( "c", "Console / Powershell " , "#c", "ahk_exe ConEmu64.exe"))
    .AddItem(AppMenuLevel( "d", "Dev Tools" , "", "DevTools -"))
    .AddItem(AppMenuLevel( "x", "Double Commander" , "#f", "ahk_exe doublecmd.exe"))
    ;        .AddItem(AppMenuLevel( "f", "Firefox" , "#f", "ahk_exe firefox.exe"))
    .AddItem(AppMenuLevel( "g", "Git \ Tig" , "#+g", "ahk_exe GitExtensions.exe"))
    ; .AddItem(AppMenuLevel( "u", "Hangouts" , "", "Google Hangouts"))
    ; .AddItem(AppMenuLevel( "h", "Host Files" , "", "ahk_exe HostsFileEditor.exe"))
    ; .AddItem(AppMenuLevel( "k", "Hangouts" , "", "Google Hangouts"))
    .AddItem(AppMenuLevel( "m", "mySettings / VS Code" , "", "ahk_exe Code.exe"))
    .AddItem(AppMenuLevel( "r", "mRemote - Remote desktop", "", "ahk_exe mRemoteNG.exe" ))
    .AddItem(AppMenuLevel( "n", "Notepad ++" , "#+n", "ahk_exe notepad++.exe"))
    .AddItem(AppMenuLevel( "z", "Notepad ++" , "", "ahk_exe notepad++.exe"))
    .AddItem(AppMenuLevel( "e", "One Note" , "#+e", "ahk_exe ONENOTE.EXE"))
    .AddItem(AppMenuLevel( "o", "Outlook" , "#+o", "ahk_exe OUTLOOK.exe"))
    .AddItem(AppMenuLevel( "t", "Outlook" , "#+t", "ahk_exe OUTLOOK.exe"))
    .AddItem(AppMenuLevel( "a", "Teams" , "#+a", "ahk_exe Teams.exe"))
    .AddItem(AppMenuLevel( "v", "Visual Studio" , "#v", "ahk_exe devenv.exe"))
    .AddItem( AppMenuLevel( "s", "Slack" , "", "ahk_exe slack.exe"))
    .AddItem(GetGuidFormat("q"))
    .AddItem(AppMenuLevel( "w", "VIM / GVIM" , "#+m", "ahk_exe gvim.exe"))
    .AddItem(CopyFilePathNavigationItem("y", "Yank Path"))

    rootLevel.ShowCommandsAndLaunchSelected()

}

