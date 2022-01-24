; IMPORTANT INFO ABOUT GETTING STARTE{
;     recentItems := new RecentItemsViewer()
;     recentItems.ParseClipboardItem()
; }

; AUTOHOTKEY DOCUMENTATION
; https://lexikos.github.io/v2/docs/KeyList.htm#function

; ! - ALT
; + - SHIFT
; ^ - CTRL
; < - LEFT KEY e.g  <! - LEFT ALT
; > - RIGHT KEY e.g  >! - RIGHT ALT

; Author: fwompner gmail com
; https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows#AutoHotkey 
; #InstallKeybdHook

; Match window names by part of the title
SetTitleMatchMode "RegEx"
SetTitleMatchMode "Slow"

; Set Lock keys permanently
SetNumlockState "AlwaysOn"
SetCapsLockState "AlwaysOff"
SetScrollLockState "AlwaysOff"

DropBoxDir := "C:\Dropbox"
ToolsDir := DropBoxDir . "\Tools"

Capslock:: {
    Send "{CtrlDown}"
    KeyWait "CapsLock"
    Send "{CtrlUp}"
    if ( A_PriorKey = "CapsLock" )
    {
        Send "{Esc}"
    }
}

; Prevent accidentaly turning CAPSLOCK on if pressed with Shift
!CapsLock::Esc
+CapsLock::Esc
^CapsLock::Esc

#+q:: { 
    SendEvent "{LWin down}{LCtrl down}{Left down}"
    Sleep 100
    SendEvent "{Left up}{LCtrl up}{Lwin up} "
    ; switch to next virtual desktop
    Sleep 1000
}

#+w:: { 
    SendEvent "{LWin down}{LCtrl down}{Right down}"
    Sleep 100
    SendEvent "{Right up}{LCtrl up}{Lwin up}"
    Sleep 1000
}

#+h:: Send "{LWinDown}{ShiftDown}{Left}{ShiftUp}{LWinUp}"
#+l:: Send "{LWinDown}{ShiftDown}{Right}{ShiftUp}{LWinUp}"
#+j:: Send "{LWinDown}{Right}{LWinUp}"
#+k:: Send "{LWinDown}{Right}{LWinUp}"
#+u:: Send "{LWinDown}{Up}{LWinUp}"

; -----------------------------------------------------
<!PgUp::Home
<!+PgUp:: Send "{ShiftDown}{Home}{ShiftUp}"
<!^PgUp:: Send "{CtrlDown}{Home}{CtrlUp}"
<!+^PgUp:: Send "{CtrlDown}{ShiftDown}{Home}{ShiftUp}{CtrlUp}"
<!PgDn::End
<!+PgDn:: Send "{ShiftDown}{End}{ShiftUp}"
<!^PgDn:: Send "{CtrlDown}{End}{CtrlUp}"
<!+^PgDn:: Send "{CtrlDown}{ShiftDown}{End}{ShiftUp}{CtrlUp}"

; ===============
aHelp := ""

; ===============
; DOWN ARROW
; ===============
aHelp := aHelp . "`n`n Down (J) "
<!j::Down 
aHelp := aHelp . "`n LALT + J `t`t`t -> Down Arrow "

#j::Down
aHelp := aHelp . "`n WIN + J `t -> Down"

<!+j::Send "{ShiftDown}{Down}{ShiftUp}" 
aHelp := aHelp . "`n LALT + SHIFT + J `t`t -> Shift + Down"

<!+^j:: Send "{CtrlDown}{ShiftDown}{Down}{ShiftUp}{CtrlUp}"
aHelp := aHelp . "`n LALT + CTRL + SHIFT + J `t -> Shift + Ctrl + Down"
; ===============

; ===============
; UP ARROW using J
; ===============
aHelp := aHelp . "`n`n Up (K)"
<!k::Up ; LEFT ALT + k -> Send Up Arrow key
aHelp := aHelp . "`n LALT + K `t`t -> Up Arrow "

#k::Up
aHelp := aHelp . "`n WIN + K `t`t -> Up Arrow "

<!+k::Send "{ShiftDown}{Up}{ShiftUp}" ; LEFT ALT + SHIFT + J -> Send Page Down
aHelp := aHelp . "`n LALT + SHIFT + K `t`t -> Shift + UP"

<!+^k:: Send "{CtrlDown}{ShiftDown}{Up}{ShiftUp}{CtrlUp}"
aHelp := aHelp . "`n LALT + CTRL + SHIFT + K `t -> Shift + Ctrl + Up"
; ===============

; ===============
; LEFT ARROW using H
; ===============
aHelp := aHelp . "`n`n Left (H) "

<!h::Left 
aHelp := aHelp . "`n LALT + H `t`t -> Left Arrow "

<!+h::Send "{ShiftDown}{Left}{ShiftUp}" 
aHelp := aHelp . "`n LALT + SHIFT + H `t`t -> Shift + LEFT"

<!+^h:: Send "{CtrlDown}{ShiftDown}{Left}{ShiftUp}{CtrlUp}"
aHelp := aHelp . "`n LALT + CTRL + SHIFT + H `t -> Shift + Ctrl + Left"
; ===============

; ===============
; RIGHT ARROW using L
; ===============
aHelp := aHelp . "`n`n Right (L)"

<!l::Right 
aHelp := aHelp . "`n LALT + L `t`t`t -> Right Arrow "

<!+l:: Send "{ShiftDown}{Right}{ShiftUp}" 
aHelp := aHelp . "`n LALT + SHIFT + L `t`t -> Shift + RIGHT"

<!+^l:: Send "{CtrlDown}{ShiftDown}{Right}{ShiftUp}{CtrlUp}"
aHelp := aHelp . "`n LALT + CTRL + SHIFT + L `t -> Shift + Ctrl + Right"
; ===============

; ===============
; HOME using ; (SEMICOLON)
; ===============
aHelp := aHelp . "`n`n Home (`; - SEMICOLON)"

<!;::Home
aHelp := aHelp . "`n LALT + `; `t`t`t -> Home"

<!+;:: Send "{ShiftDown}{Home}{ShiftUp}"
aHelp := aHelp . "`n LALT + SHIFT + `; `t`t -> Shift + Home"

<!+^;:: Send "{CtrlDown}{ShiftDown}{Home}{ShiftUp}{CtrlUp}"
aHelp := aHelp . "`n LALT + SHIFT + CTRL + `; `t -> Shift + Ctrl + Home"
; ===============

; ===============
; END using ' (SINGLE QUOTE)
; ===============
aHelp := aHelp . "`n`n End (' - SINGLE QUOTE)"

<!'::End
aHelp := aHelp . "`n LALT + ' `t`t`t -> End"

<!+':: Send "{ShiftDown}{End}{ShiftUp}"
aHelp := aHelp . "`n LALT + SHIFT + ' `t`t -> Shift + End"

<!+^':: Send "{CtrlDown}{ShiftDown}{End}{ShiftUp}{CtrlUp}"
aHelp := aHelp . "`n LALT + SHIFT + CTRL + ' `t -> Shift + Ctrl + End"
; ===============

; ===============
; PAGE UP using U
; ===============
aHelp := aHelp . "`n`n Page Up"

<!u::PgUp
aHelp := aHelp . "`n LALT + U `t`t -> PAGE UP"

<!+u:: Send "{ShiftDown}{PgUp}{ShiftUp}"
aHelp := aHelp . "`n LALT + SHIFT + U `t`t -> SHIFT + PAGE UP"
; ===============

; ===============
; PAGE DOWN using D
; ===============
aHelp := aHelp . "`n`n Page Down"

<!d::PgDn
aHelp := aHelp . "`n LALT + D `t`t -> PAGE DOWN"

<!+d:: Send "{ShiftDown}{PgDn}{ShiftUp}"
aHelp := aHelp . "`n LALT + SHIFT + D `t`t -> SHIFT + PAGE DOWN"
; ===============

; ===============
; DELETE / BACKSPACE using X
; ===============
aHelp := aHelp . "`n`n BackSpace"

<!x::Del
aHelp := aHelp . "`n LALT + X `t`t -> DELETE"

<!^x:: Send "{CtrlDown}{Del}{CtrlUp}"
aHelp := aHelp . "`n LALT + CTRL + X `t`t -> CTRL + DELETE"

<!+x::BackSpace
aHelp := aHelp . "`n LALT + SHIFT + X `t`t -> BACKSPACE"

<!+^x:: Send "{CtrlDown}{BackSpace}{CtrlUp}"
aHelp := aHelp . "`n LALT + CTRL + SHIFT + X `t -> CTRL + BACKSPACE"
; ===============

<!/:: {
    MsgBox(aHelp, "Help","iconi T30")
}

; asdf 

<!m:: Send "{ShiftDown}{F10}{ShiftUp}"
<!i:: Send "-"

; <!m::RButton
#m::AppsKey
aHelp := aHelp . "`n WIN + M `t -> APP MENU"

<!m::AppsKey
aHelp := aHelp . "`n LALT + M `t -> APP MENU"


; Media 
<!\::Media_Play_Pause
aHelp := aHelp . "`n LALT + \ `t`t`t -> MEDIA PLAY/PAUSE"

<![::Media_Prev
aHelp := aHelp . "`n LALT + [ `t`t`t -> MEDIA PREVIOUS"

<!]::Media_Next
aHelp := aHelp . "`n LALT + ] `t`t`t -> MEDIA NEXT"

<!F1::Volume_Mute
aHelp := aHelp . "`n LALT + F1 `t`t -> VOLUME MUTE"
<!0::Volume_Mute
aHelp := aHelp . "`n LALT + 0 `t`t -> VOLUME MUTE"

<!F2::Volume_Down
aHelp := aHelp . "`n LALT + F2 `t`t -> VOLUME DOWN"
<!{::Volume_Down
aHelp := aHelp . "`n LALT + { `t`t`t -> VOLUME DOWN"

<!F3::Volume_Up
aHelp := aHelp . "`n LALT + F3 `t`t -> VOLUME UP"
<!}::Volume_Up
aHelp := aHelp . "`n LALT + } `t`t -> VOLUME UP"

WinActivateOrOpen(winExe) {
    window := "ahk_exe " . winExe
    MsgBox( window)
    if WinExist(window){
        WinActivate ; Use the window found by WinExist.
    }
    else{
        WinActivate "Calculator"
    }
}

<!g:: WinActivateOrOpen("gitextensions.exe")

; #Include <Hotkeys>

; #Include <Jxon>
; #Include <JSON>

; #Include %A_ScriptDir%\Windows\Sound.ahk
; #Include %A_ScriptDir%\Common\Common.ahk
; #Include %A_ScriptDir%\slugify.ahk
; #Include %A_ScriptDir%\ParseUrl.ahk

; #Include %A_ScriptDir%\FastNavigation\Navigation.ahk
; #Include %A_ScriptDir%\Time\Time.ahk

; #Include %A_ScriptDir%\KeyBindings\Applications.ahk
; #Include %A_ScriptDir%\KeyBindings\SinglePress.ahk
; #Include %A_ScriptDir%\KeyBindings\Yank.ahk

; #Include %A_ScriptDir%\Spotify.ahk
;#Include %A_ScriptDir%\Lib\CapsLockCtrlEscape.ahk

; -----------------------
; FUNCTIONS
; -----------------------

; https://lexikos.github.io/v2/docs/KeyList.htm#SpecialKeys
; <!a::Send "{vkFFsc163}"   ; 163 is a mute microphone button
; ABOVE DO NOT WORK RIGHT NOW 2022-01-11