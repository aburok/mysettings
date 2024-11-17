;+!?::
;    ShowHelp()
;    Sleep 2000
;    SplashTextOff
;return
#Include %A_ScriptDir%\Common\Common.ahk
#Include %A_ScriptDir%\FastNavigation\Navigation.ahk

; subItem :=
rootLevel := NavigationItem("d", "Test")
    .AddItem(AppMenuLevel("b", "Chrome", "#b", "ahk_exe chrome.exe"))
    .AddItem(AppMenuLevel("e", "Edge", "#b", "ahk_exe msedge.exe"))
    .AddItem(AppMenuLevel("q", "Terminal", "<!+t", "ahk_exe WindowsTerminal.exe"))
    ; .AddItem(AppMenuLevel("t", "Terminal", "<!+t", "^Administrator: PowerShell$"))
    .AddItem(AppMenuLevel("r", "Rider", "<!+r", "ahk_exe rider64.exe"))
    ; .AddItem(AppMenuLevel( "x", "Double Commander" , "#f", "ahk_exe doublecmd.exe"))
    ;        .AddItem(AppMenuLevel( "f", "Firefox" , "#f", "ahk_exe firefox.exe"))
    .AddItem(AppMenuLevel("g", "Git \ Tig", "#+g", "ahk_exe GitExtensions.exe"))
    ; .AddItem(AppMenuLevel( "m", "mySettings / VS Code" , "", "ahk_exe Code.exe"))
    .AddItem(AppMenuLevel("d", "Notepad ++", "", "^.*(Notepad\+\+).*$"))
    .AddItem(AppMenuLevel("a", "One Note", "<!^a", "ahk_exe ONENOTE.EXE"))
    .AddItem(AppMenuLevel("z", "Outlook", "#+o", "ahk_exe OUTLOOK.EXE"))
    ; .AddItem(AppMenuLevel( "v", "Visual Studio" , "#v", "ahk_exe devenv.exe"))
    .AddItem(AppMenuLevel("s", "Slack", "<!^s", "ahk_exe slack.exe"))
    .AddItem(AppMenuLevel("w", "Double Commander", "<!^w", "^Double Commander"))
    ; .AddItem(AppMenuLevel("w", "VIM / GVIM", "#+m", "ahk_exe gvim.exe"))
    .AddItem(CopyFilePathNavigationItem("y", "Yank Path"))
    .AddItem(NavigationItem("t", "Varia (Translate)")
        .AddItem(GetGuidFormat("d"))
        .AddItem(TranslateItem("1", "Translate"))
        .AddItem(FlushDnsItem("2", ""))
        ; .AddItem(CmdNavigationItem("3", "Aws Login", "pwsh.exe -NoExit -Command { aws-login } "))
        .AddItem(CopyJiraTicketAsBranchNameItem("4", "Copy Branch Name"))
        .AddItem(GetExchangeRatesMenuItem("e"))
        .AddItem(HeaderFormatNavigationItem("h", "Header Format")))
    .AddItem(NavigationItem("1", "Sounds")
        .AddItem(PlaySoundItem("1", "Wololo", "/Sounds/Wololo-9.mp3"))
        .AddItem(PlaySoundItem("d", "Drum", "/Sounds/joke_drum_effect.mp3"))
        .AddItem(PlaySoundItem("w", "Wow", "/Sounds/anime-wow.mp3"))
        .AddItem(PlaySoundItem("2", "Downer", "/Sounds/downer_noise.mp3"))
        .AddItem(PlaySoundItem("3", "Dun", "/Sounds/dun-dun-dun.mp3"))
        .AddItem(PlaySoundItem("f", "Fart", "/Sounds/dry-fart.mp3"))
        .AddItem(PlaySoundItem("s", "Scratch", "/Sounds/record-scratch-2.mp3"))
        .AddItem(PlaySoundItem("t", "Trolo", "/Sounds/trollolol.swf.mp3")))

<!q:: {

    rootLevel.ShowCommandsAndLaunchSelected()

}