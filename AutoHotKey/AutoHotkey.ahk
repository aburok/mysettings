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

SetTimer( Modifier_Up, 5*60*1000)
Modifier_Up()
{
For Each, Modifier in ["Shift","Control","LWin","RWin","Alt"]
	If GetKeyState(Modifier) And !GetKeyState(Modifier,"P")
		Send "{" . Modifier . " Up}"
}

#Include %A_ScriptDir%\Alt_hjkl.ahk

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

#Include %A_ScriptDir%\KeyBindings\Applications.ahk
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

; asdf 

<!m:: Send "{ShiftDown}{F10}{ShiftUp}"
<!i:: Send "-"

; <!m::RButton
; #m::AppsKey
#m:: Send "{ShiftDown}{F10}{ShiftUp}"
__help := __help . "`n WIN + M `t -> APP MENU"

; <!m::AppsKey
__help := __help . "`n LALT + M `t -> APP MENU"


#HotIf WinActive("ahk_exe gitextensions.exe") 
<!1:: Send "^1"
<!2:: Send "^2"
<!3:: Send "^3"
<!4:: Send "^4"
#HotIf