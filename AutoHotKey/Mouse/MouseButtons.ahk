; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; # - Win ke:
; ^ - Ctrl key
; ! - Alt key
; + - Shift key

; https://www.autohotkey.com/docs/KeyList.htm

#SingleInstance Force

InstallMouseHook
InstallKeybdHook

generalShortcuts := "General shortcuts`n"
gitShortcuts := "Git extensions shortcuts`n"
explorerShortcuts := "Windows Explorer shortcuts`n"

; https://www.autohotkey.com/docs/commands/SetKeyDelay.htm
; SetKeyDelay, 0, 100

; ---------------------
; WINDOWS KEY BINDINGS
; ---------------------

; IMPORTANT
; NOTE :
; Triggering action based on Win + NumPad keys cause some problems.
; Mainly that Win key was stuck on DOWN status (Win key constantly pressed).
; Instead of using combination of keys, just using Numpad

; Mouse Side : 1 ->  Numpad1
; Mouse Side : 2 ->  Numpad2
; Mouse Side : 3 ->  Numpad3
; Mouse Side : 4 ->  Numpad4
; Mouse Side : 5 ->  Numpad5
; Mouse Side : 6 ->  Numpad6
; Mouse Side : 7 ->  Numpad7
; Mouse Side : 8 ->  Numpad8
; Mouse Side : 9 ->  Numpad9
; Mouse Side : 10 ->  Numpad0
; Mouse Side : 11 ->  Numpad-
; Mouse Side : 12 ->  Numpad+

; Mouse Top : 4 (left to left click) -> Numpad*

; ASCII art
; http://patorjk.com/software/taag/#p=display&f=Cybermedium&t=MS%20Teams

GetCurrentDesktop() {
    try {
        currentDesktop := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops", "CurrentVirtualDesktop")
    } catch {
        currentDesktop := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops", "CurrentVirtualDesktop")
    }
    allDesktops := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops", "VirtualDesktopIDs")
    ix := floor(InStr(allDesktops, currentDesktop) / strlen(currentDesktop))
    return ix
}

NumpadMult:: {
    ix := GetCurrentDesktop()
    if (ix = 0) {
        ; SendInput "#^{Right}"
        ; msgbox("current desktop index " . ix )
        SendInput "{LWinDown}{CtrlDown}{Right}{CtrlUp}{LWinUp}"
    }
    if (ix = 1) {
        ; msgbox("current desktop index " . ix )
        SendInput "{LWinDown}{CtrlDown}{Left}{CtrlUp}{LWinUp}"
    }
}

numpad9:: SendInput "{CtrlDown}{F5}{CtrlUp}"

numpad1:: SendInput "{Browser_Back}"
numpad4:: SendInput "{Browser_Forward}"

GroupAdd "IDE_GROUP", "ahk_exe rider64.exe"
GroupAdd "IDE_GROUP", "ahk_exe Code.exe"
GroupAdd "IDE_GROUP", "ahk_exe devenv.exe"

#HotIf WinActive("ahk_exe explorer.exe")
numpad3:: SendInput "{CtrlDown}w{CtrlUp}"
#HotIf

; ____ _  _ ____ ____ _  _ ____       ____ _  _ ____ ___ ____ _  _ _  _ ___
; |    |__| |__/ |  | |\/| |___       [__  |_/  |___  |  |    |__| |  | |__]
; |___ |  | |  \ |__| |  | |___       ___] | \_ |___  |  |___ |  | |__| |

#HotIf WinActive("ahk_exe chrome.exe") and WinActive("SketchUp")
_cs := "Sketchup Chrome shortcuts `n`n"

!*:: SendInput "^{F5}"
_cs := _cs . " Top 4 - Refresh `n"

_cs := _cs . " Side `n"

numpad3:: SendInput "p"
numpad6:: SendInput "m"
_cs := _cs . " 3 - Push/Pull `t`t`t 6 - Move `n"

numpad2:: SendInput "o"
numpad5:: SendInput "l"
_cs := _cs . " 2 - Orbit `t`t 5 - Line `n"

numpad1:: SendInput "{CtrlDown}z{CtrlUp}"
numpad4:: SendInput "{CtrlDown}y{CtrlUp}"
_cs := _cs . " 1 - Undo `t`t`t 4 - Redo `n"

numpad7:: SendInput "H" ; New Tab
numpad8:: SendInput "c"
_cs := _cs . " 7 - Hide rest `t`t`t 8 - Circle `n"

numpad0:: MsgBox(_cs, "Sketchup in Chrome Help", "iconi T30")
#HotIf

; ____ _  _ ____ ____ _  _ ____
; |    |__| |__/ |  | |\/| |___
; |___ |  | |  \ |__| |  | |___

#HotIf WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe firefox.exe") or WinActive("ahk_exe msedge.exe")
_c := "Chrome shortcuts `n`n"

!*:: SendInput "^{F5}"
^p:: SendInput "+^A"
^+p:: SendInput "+^O"
_c := _c . " Top 4 - Refresh `n"

_c := _c . " Side `n"

numpad3:: SendInput "{CtrlDown}w{CtrlUp}{CtrlUp}{AltUp}"
numpad6:: SendInput "{CtrlDown}{ShiftDown}t{ShiftUp}{CtrlUp}{AltUp}"
_c := _c . " 3 - Close tab `t`t`t 6 - Reopen closed tab `n"

numpad2:: SendInput "{CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}"
numpad5:: SendInput "{CtrlDown}{Tab}{CtrlUp}"
_c := _c . " 2 - Go previous tab `t`t 5 - Go next tab `n"

numpad1:: SendInput "{Browser_Back}"
numpad4:: SendInput "{Browser_Forward}"
_c := _c . " 1 - Go back `t`t`t 4 - Go forward `n"

numpad7:: SendInput "^t" ; New Tab
numpad8:: SendInput "{Browser_Forward}"
_c := _c . " 7 - New Tab `t`t`t 4 - Go forward `n"

numpad0:: MsgBox(_c, "Chrome Help", "iconi T30")
#HotIf

; _  _ ____    ___ ____ ____ _  _ ____
; |\/| [__      |  |___ |__| |\/| [__
; |  | ___]     |  |___ |  | |  | ___]

#HotIf WinActive("ahk_exe teams.exe")
numpad3:: SendInput "(yes){Enter}"
numpad6:: SendInput "Our best engineers are working on that very hard (hammerandwrench)"

numpad2::
{
    SendInput " (poop) on "
    Sleep 500
    SendInput " (fire) yo"
}

numpad5::
{
    SendInput "(poop) is about to hit the"
    Sleep 300
    SendInput " (windturbine) yo"
}

numpad1:: SendInput "{Browser_Back}"
numpad4:: SendInput "{Browser_Forward}"

^o:: SendInput "{Browser_Back}"
^i:: SendInput "{Browser_Forward}"
#HotIf

_ide := "Common `n"
; Common shortcuts for rider and VS Code
#HotIf WinActive("ahk_group IDE_GROUP")

numpad2:: SendInput "gd" ; Go to declaration
numpad5:: SendInput "gi" ; Go to implementation
_ide := _ide . " 2 - Go Declaration `t` 5 - Go Implementation `n"

numpad1:: SendInput "{CtrlDown}o{CtrlUp}" ; Go back in code
numpad4:: SendInput "{CtrlDown}i{CtrlUp}" ; Go Forward in code
_ide := _ide . " 1 - Go Back `t`t 4 - Go Forward `n"
#HotIf

; ____ _ ___  ____ ____    _ ___  ____
; |__/ | |  \ |___ |__/    | |  \ |___
; |  \ | |__/ |___ |  \    | |__/ |___

#HotIf WinActive("ahk_exe rider64.exe") AND NOT (InStr(WinGetTitle("A"), "Debugger"))

_r := "Rider IDE shortcuts`n"

numpad3:: SendInput "!{F7}" ; find results
_r := _r . " 3 - Find Usages `n"

+numpad3:: SendInput "^+{Down}" ; Go to Next occurance (find results)
+numpad6:: SendInput "^+{Up}" ; Go to Next occurance (find results)
_r := _r . "SHIFT `n 3 - Next Occurence `t 6 - Prev Occurence `n"

numpad7:: SendInput "^+l" ; Locate in Solution Explorer
_r := _r . "`n 7 - Locate in Solution `t 6 - Prev Occurence `n"

_r := _r . _ide
_r := _r . "`n ------------------------- "
_r := _r . "`n zC - Collapse `t zO - Expand "
_r := _r . "`n <l>ws - Split Horiz `t <l>wv - Split Vert"
_r := _r . "`n <l>wu - UnSplit `t <l>wc - Change Split Orientation"
_r := _r . "`n <l>ww - Move to Opposite Tabs "
_r := _r . "`n -------------------------- "
_r := _r . "`n mm - Toggle Bookmark `t '' - Show Bookmarks"
_r := _r . "`n 'j - Next Bookmark `t 'k - Prev Bookmarks"
_r := _r . "`n -------------------------- "
_r := _r . "`n S-j - Next Method `t S-k - Prev Method"
_r := _r . "`n C-A-j - Next Occurence `t C-A-k - Prev Occurence"
numpad0:: MsgBox(_r, "Rider Help", "iconi T30")
#/:: MsgBox(_r, "Rider Help", "iconi T30")

; ^p:: SendInput "^+n" ; Go to File

#HotIf

; ____ _ ___  ____ ____    _ ___  ____    ___  ____ ___  _  _ ____ ____ _ _  _ ____
; |__/ | |  \ |___ |__/    | |  \ |___    |  \ |___ |__] |  | | __ | __ | |\ | | __
; |  \ | |__/ |___ |  \    | |__/ |___    |__/ |___ |__] |__| |__] |__] | | \| |__]

#HotIf WinActive("ahk_exe rider64.exe") and InStr(WinGetTitle("A"), "Debugger")

_r_d := "Rider IDE shortcuts (Debugging) `n"

numpad2:: SendInput "{F10}"
numpad5:: SendInput "{F5}" ; Locate in Solution Explorer
_r_d := _r_d . " 2 - Step Over `t 5 - Continue `n"

numpad3:: SendInput "{F11}"
numpad6:: SendInput "+{F11}"
_r_d := _r_d . " 3 - Step in `t 6 - Step Out `n"

numpad0:: MsgBox(_r_d, "Rider [Debugger] Help", "iconi T30")
#HotIf

; _  _ _ ____ _  _ ____ _       ____ ___ _  _ ___  _ ____    ____ ____ ___  ____
; |  | | [__  |  | |__| |       [__   |  |  | |  \ | |  |    |    |  | |  \ |___
;  \/  | ___] |__| |  | |___    ___]  |  |__| |__/ | |__|    |___ |__| |__/ |___

#HotIf WinActive("ahk_exe Code.exe")
numpad2:: SendInput "^+{Down}" ; Go to Next occurance (find results)
numpad5:: SendInput "^+{Up}" ; Go to Next occurance (find results)
#HotIf

; _  _ _ ____ _  _ ____ _       ____ ___ _  _ ___  _ ____
; |  | | [__  |  | |__| |       [__   |  |  | |  \ | |  |
;  \/  | ___] |__| |  | |___    ___]  |  |__| |__/ | |__|

#HotIf WinActive("ahk_exe devenv.exe")
_vs := "Visual Studio shortcuts`n"

numpad2:: SendInput "{AltDown}{F7}{AltUp}" ; Find usages
_vs := _vs . " 4 - Go to next cursor position `n"

numpad0:: MsgBox(_vs, "VS Help", "iconi T30")
#HotIf

; ____ ___  ____ ___ _ ____ _   _
; [__  |__] |  |  |  | |___  \_/
; ___] |    |__|  |  | |      |

#HotIf WinActive("ahk_exe spotify.exe")
_spotify := "Spotify shortcuts`n"

numpad1:: SendInput "{AltDown}{Left}{AltUp}"
_spotify := _spotify . " 1 - Go back`n"

numpad4:: SendInput "{AltDown}{Right}{AltUp}"
_spotify := _spotify . " 4 - Go forward`n"

numpad2:: SendInput "{CtrlDown}{Right}{CtrlUp}"
_spotify := _spotify . " 2 - Go to next track `n"

numpad5:: SendInput "{CtrlDown}{Left}{CtrlUp}" ; Find usages
_spotify := _spotify . " 5 - Go to previous track `n"

numpad3:: SendInput "{CtrlDown}{L}{CtrlUp}" ; Find usages
_spotify := _spotify . " 3 - Go to search `n"

numpad0:: MsgBox(_spotify, "VS Help", "iconi T30")
#HotIf

; _  _ _ ____ _  _ ____ _       ____ ___ _  _ ___  _ ____    ___  ____ ___  _  _ ____
; |  | | [__  |  | |__| |       [__   |  |  | |  \ | |  |    |  \ |___ |__] |  | | __
;  \/  | ___] |__| |  | |___    ___]  |  |__| |__/ | |__|    |__/ |___ |__] |__| |__]

#HotIf WinActive("ahk_exe devenv.exe") and InStr(WinGetTitle("A"), "(Debugging)")
_vsd := "Visual Studio Debugging shortcuts `n`n"

numpad3:: SendInput "{F5}" ; Continue debugging
numpad6:: SendInput "{ShiftDown}{F9}{ShiftUp}" ; Quick Watch
_vsd := _vsd . " 3 - Continue Debug `t`t 6 - Quick Watch `n"

numpad2:: SendInput "{F11}" ; Step Into
numpad5:: SendInput "{ShiftDown}{F11}{ShiftUp}" ; Step Out
_vsd := _vsd . " 2 - Step Into `t`t 5 - Step Out `n"

numpad1:: SendInput "{F10}" ; Step Over
numpad4:: SendInput "^{F10}" ; Run to the Cursor
_vsd := _vsd . " 1 - Step Over `t`t 4 - Run to the Cursor `n"

numpad0:: MsgBox(_vsd, "VS Debug Help", "iconi T30")
#HotIf

; ___  ____ _  _ ___  _    ____    ____ ____ _  _ _  _ ____ _  _ ___  ____ ____
; |  \ |  | |  | |__] |    |___    |    |  | |\/| |\/| |__| |\ | |  \ |___ |__/
; |__/ |__| |__| |__] |___ |___    |___ |__| |  | |  | |  | | \| |__/ |___ |  \

#HotIf WinActive("ahk_exe doublecmd.exe")
numpad4:: SendInput "{AltDown}{Right}{AltUp}"
#HotIf

; ____ _ ___    ____ _  _ ___ ____ _  _ ____ _ ____ _  _ ____
; | __ |  |     |___  \/   |  |___ |\ | [__  | |  | |\ | [__
; |__] |  |     |___ _/\_  |  |___ | \| ___] | |__| | \| ___]

#HotIf WinActive("ahk_exe gitextensions.exe")
_ge := "Git Extensions `n"

numpad3:: SendInput "{Ctrl down}.{Ctrl up}" ; Checkout Branch
numpad6:: SendInput "^{Space}" ; Commit
_ge := _ge . "3 - Checkout branch `t`t 6 - Commit `n"

numpad2:: SendInput "^p"
numpad5:: SendInput "^n"
_ge := _ge . "2 - Go to parent `t`t 5 - Go to child `n"

numpad1:: SendInput "!{Left}" ; ??
numpad4:: SendInput "!{Right}" ; New Branch
_ge := _ge . "1 - Go back `t`t 4 - Go Forward `n"

numpad0:: MsgBox(_ge, "Git Extension Help", "iconi T30")
#HotIf

#HotIf WinActive("ahk_exe TortoiseGitMerge.exe")
_gd := "Git Extensions : Diff `n"

; !numpad3:: SendInput "{Ctrl down}.{Ctrl up}" ; Checkout Branch
; !numpad6:: SendInput "^{Space}" ; Commit
; _gd := _gd . "3 - Checkout branch `t`t 6 - Commit `n"

; !numpad2:: SendInput "^p"
; !numpad5:: SendInput "^n"
; _gd := _gd . "2 - Go to parent `t`t 5 - Go to child `n"

numpad1:: SendInput "{F8}" ; ??
numpad4:: SendInput "+{F8}" ; New Branch
_gd := _gd . "1 - Next conflict `t`t 4 - Prev Conflict `n"

numpad0:: MsgBox(_gd, "Git Extension Help", "iconi T30")
#HotIf



; ____ _    ____ ____ _  _ 
; [__  |    |__| |    |_/  
; ___] |___ |  | |___ | \_ 
                         
#HotIf WinActive("ahk_exe slack.exe")

^p:: SendInput "^g"
^o:: SendInput "!{Left}"
^i:: SendInput "!{Right}"
!1:: SendInput "^+1"
!2:: SendInput "^+2"
!3:: SendInput "^+3"
!4:: SendInput "^+4"

#HotIf


; ONE NOTE

#HotIf WinActive("ahk_exe ONENOTE.EXE")

^q:: {
    SendInput "^a"
    Sleep 100
    SendInput "^-"
    Sleep 100
    SendInput "{Esc}"
    Sleep 100
    SendInput "{Home}"
}

<!+j:: {
    SendInput "{Down}"
}

<!k:: {
    SendInput "{Up}"
}

<!l:: {
    SendInput "{Right}"
}

<!h:: {
    SendInput "{Left}"
}

#HotIf