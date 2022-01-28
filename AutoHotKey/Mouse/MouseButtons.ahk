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

; Mouse Side : 1 -> Win + Numpad1
; Mouse Side : 2 -> Win + Numpad2
; Mouse Side : 3 -> Win + Numpad3
; Mouse Side : 4 -> Win + Numpad4
; Mouse Side : 5 -> Win + Numpad5
; Mouse Side : 6 -> Win + Numpad6
; Mouse Side : 7 -> Win + Numpad7
; Mouse Side : 8 -> Win + Numpad8
; Mouse Side : 9 -> Win + Numpad9
; Mouse Side : 10 -> Win + Numpad0
; Mouse Side : 11 -> Win + Numpad-
; Mouse Side : 12 -> Win + Numpad+

; Mouse Top : 4 (left to left click) -> Win + Numpad /
; Mouse Top : 5 ( DPI- ' V ' ) -> Win + Numpad *
; Mouse Top : 6 ( DPI+ ' ^ ' ) -> Win + PageUp

; ASCII art
; http://patorjk.com/software/taag/#p=display&f=Cybermedium&t=MS%20Teams

_ide := "Common `n"
; Common shortcuts for rider and VS Code
#HotIf WinActive("ahk_exe rider64.exe") or WinActive("ahk_exe Code.exe") or WinActive("ahk_exe devenv.exe")

!numpad2:: SendInput "gd" ; Go to declaration
!numpad5:: SendInput "gi" ; Go to implementation
_ide := _ide . " 2 - Go Declaration `t` 5 - Go Implementation `n"

!numpad1:: SendInput "^o" ; Go back in code
!numpad4:: SendInput "^i" ; Go Forward in code
_ide := _ide . " 1 - Go Back `t`t 4 - Go Forward `n"
#HotIf


; ____ _ ___  ____ ____    _ ___  ____ 
; |__/ | |  \ |___ |__/    | |  \ |___ 
; |  \ | |__/ |___ |  \    | |__/ |___ 

#HotIf WinActive("ahk_exe rider64.exe")
_r := "Rider IDE shortcuts`n"

!numpad3:: SendInput "!{F7}" ; find results
_r := _r . " 3 - Find Usages `n"

!+numpad3:: SendInput "^+{Down}" ; Go to Next occurance (find results)
!+numpad6:: SendInput "^+{Up}" ; Go to Next occurance (find results)
_r := _r . "SHIFT `n  3 - Next Occurence `t 6 - Prev Occurence `n"

_r := _r . _ide
!numpad0:: MsgBox(_r, "Rider Help", "iconi T30")
#HotIf 


; _  _ _ ____ _  _ ____ _       ____ ___ _  _ ___  _ ____    ____ ____ ___  ____ 
; |  | | [__  |  | |__| |       [__   |  |  | |  \ | |  |    |    |  | |  \ |___ 
;  \/  | ___] |__| |  | |___    ___]  |  |__| |__/ | |__|    |___ |__| |__/ |___ 
                                                                               
#HotIf WinActive("ahk_exe Code.exe") 
!numpad2:: SendInput "^+{Down}" ; Go to Next occurance (find results)
!numpad5:: SendInput "^+{Up}" ; Go to Next occurance (find results)
#HotIf


; _  _ _ ____ _  _ ____ _       ____ ___ _  _ ___  _ ____ 
; |  | | [__  |  | |__| |       [__   |  |  | |  \ | |  | 
;  \/  | ___] |__| |  | |___    ___]  |  |__| |__/ | |__| 

#HotIf WinActive("ahk_exe devenv.exe")
_vs := "Visual Studio shortcuts`n"

!numpad2:: SendInput "{AltDown}{F7}{AltUp}" ; Find usages
_vs := _vs . " 4 - Go to next cursor position `n"

!numpad0:: MsgBox(_vs, "VS Help", "iconi T30")
#HotIf


; _  _ _ ____ _  _ ____ _       ____ ___ _  _ ___  _ ____    ___  ____ ___  _  _ ____ 
; |  | | [__  |  | |__| |       [__   |  |  | |  \ | |  |    |  \ |___ |__] |  | | __ 
;  \/  | ___] |__| |  | |___    ___]  |  |__| |__/ | |__|    |__/ |___ |__] |__| |__] 

#HotIf WinActive("ahk_exe devenv.exe") and InStr(WinGetTitle("A"), "(Debugging)")
_vsd := "Visual Studio Debugging shortcuts `n`n"

!numpad3:: SendInput "{F5}" ; Continue debugging 
!numpad6:: SendInput "{ShiftDown}{F9}{ShiftUp}" ; Quick Watch
_vsd := _vsd . " 3 - Continue Debug `t`t 6 - Quick Watch `n"

!numpad2:: SendInput "{F11}" ; Step Into
!numpad5:: SendInput "{ShiftDown}{F11}{ShiftUp}" ; Step Out
_vsd := _vsd . " 2 - Step Into `t`t 5 - Step Out `n"

!numpad1:: SendInput "{F10}" ; Step Over
!numpad4:: SendInput "^{F10}" ; Run to the Cursor
_vsd := _vsd . " 1 - Step Over `t`t 4 - Run to the Cursor `n"

!numpad0:: MsgBox(_vsd, "VS Debug Help", "iconi T30")
#HotIf


; ____ _  _ ____ ____ _  _ ____ 
; |    |__| |__/ |  | |\/| |___ 
; |___ |  | |  \ |__| |  | |___ 

#HotIf WinActive("ahk_exe chrome.exe") 
_c := "Chrome shortcuts `n`n"

!*:: SendInput "^{F5}"
_c := _c . " Top 4 - Refresh `n"

_c := _c . " Side `n"

!numpad3:: SendInput "^w"
!numpad6:: SendInput "^+t"
_c := _c . " 3 - Close tab `t`t`t 6 - Reopen closed tab `n"

!numpad2:: SendInput "^+{Tab}"
!numpad5:: SendInput "^{Tab}"
_c := _c . " 2 - Go previous tab `t`t 5 - Go next tab `n"

!numpad1:: SendInput "{Browser_Back}" 
!numpad4:: SendInput "{Browser_Forward}"
_c := _c . " 1 - Go back `t`t`t  4 - Go forward `n"

!numpad0:: MsgBox(_c, "Chrome Help", "iconi T30")
#HotIf


; ___  ____ _  _ ___  _    ____    ____ ____ _  _ _  _ ____ _  _ ___  ____ ____ 
; |  \ |  | |  | |__] |    |___    |    |  | |\/| |\/| |__| |\ | |  \ |___ |__/ 
; |__/ |__| |__| |__] |___ |___    |___ |__| |  | |  | |  | | \| |__/ |___ |  \ 

#HotIf WinActive("ahk_exe doublecmd.exe") 
!numpad4:: SendInput "{AltDown}{Right}{AltUp}"
#HotIf


; ____ _ ___    ____ _  _ ___ ____ _  _ ____ _ ____ _  _ ____ 
; | __ |  |     |___  \/   |  |___ |\ | [__  | |  | |\ | [__  
; |__] |  |     |___ _/\_  |  |___ | \| ___] | |__| | \| ___] 

#HotIf WinActive("ahk_exe gitextensions.exe") 
_ge := "Git Extensions `n"

!numpad3:: SendInput "{Ctrl down}.{Ctrl up}" ; Checkout Branch
!numpad6:: SendInput "^{Space}" ; Commit
_ge := _ge . "3 - Checkout branch `t`t 6 - Commit `n"

!numpad2:: SendInput "^p" 
!numpad5:: SendInput "^n"
_ge := _ge . "2 - Go to parent `t`t 5 - Go to child `n"

!numpad1:: SendInput "!{Left}" ; ??
!numpad4:: SendInput "!{Right}" ; New Branch
_ge := _ge . "1 - Go back `t`t 4 - Go Forward `n"

!numpad0:: MsgBox(_ge, "Git Extension Help", "iconi T30")
#HotIf


; _  _ ____    ___ ____ ____ _  _ ____ 
; |\/| [__      |  |___ |__| |\/| [__  
; |  | ___]     |  |___ |  | |  | ___] 

#HotIf WinActive("ahk_exe teams.exe") 
!numpad3:: SendInput "(yes){Enter}"
!numpad6:: SendInput "nasi najlepsi inzynierowie nad tym pracuja (yes){Enter}"

!numpad1:: SendInput "^+H" ; Open History
#HotIf
