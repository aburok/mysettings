; IMPORTANT INFO ABOUT GETTING STARTE{
;     recentItems := new RecentItemsViewer()
;     recentItems.ParseClipboardItem()
; }

; AUTOHOTKEY DOCUMENTATION
; https://lexikos.github.io/v2/docs/KeyList.htm#function

; ! - ALT
; + - SHIFT
; ^ - CTRL
; # - WIN
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
#Include %A_ScriptDir%\Mouse\MouseButtons.ahk

; Match window names by part of the title
SetTitleMatchMode "RegEx"
SetTitleMatchMode "Slow"

; Set Lock keys permanently
SetNumlockState "AlwaysOn"
SetCapsLockState "AlwaysOff"
SetScrollLockState "AlwaysOff"

DropBoxDir := "C:\Dropbox"
ToolsDir := DropBoxDir . "\Tools"

; Control was not working fine on Azure Virtual Desktop
; Capslock:: {
;     Send "{CtrlDown}"
;     KeyWait "CapsLock"
;     Send "{CtrlUp}"
;     if ( A_PriorKey = "CapsLock" )
;     {
;         Send "{Esc}"
;     }
; }
CapsLock::Esc

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

#+h:: Send "{LWinDown}{ShiftDown}{Left}{ShiftUp}{LWinUp}"
#+l:: Send "{LWinDown}{ShiftDown}{Right}{ShiftUp}{LWinUp}"
#+j:: Send "{LWinDown}{Right}{LWinUp}"
#+k:: Send "{LWinDown}{Right}{LWinUp}"
#+u:: Send "{LWinDown}{Up}{LWinUp}"
#z:: Send "{LWinDown}{PrintScreen}{LWinUp}"

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
    ; MsgBox( window)
    if WinExist(window){
        WinActivate ; Use the window found by WinExist.
    }
    else{
        WinActivate "Calculator"
    }
}

<!g:: WinActivateOrOpen("gitextensions.exe")

; #Include <Hotkeys>

#Include <_Jxon>
; #Include <JSON>

; #Include %A_ScriptDir%\Windows\Sound.ahk

#Include %A_ScriptDir%\KeyBindings\Applications.ahk

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


; Shift + Wheel for horizontal scrolling

; +WheelDown:: WheelRight

; +WheelUp:: WheelLeft

KeyCombination(ExcludeKeys:="")
{ ;All pressed keys and buttons will be listed
	ExcludeKeys .= "{Shift}{Control}{Alt}{WheelUp}{WheelDown}"
    KeyCombination := "Pressed keys"
	Loop 0xFF
	{
		IF !GetKeyState(Key:=Format("VK{:02X}",0x100-A_Index))
			Continue
		If !InStr(ExcludeKeys,ey:="{" GetKeyName(Key) "}")
			KeyCombination .= RegexReplace(Key,"Numpad(\D+)","$1")
	}
	Return KeyCombination
}

F7::{
Loop 0xFF{
    Key:=Format("VK{:X}",A_Index)
	IF GetKeyState(Key){
		SendInput( "{" Key " up}")
    }
}
}


#^x::{
    SendInput("^c")
    Sleep 150
    NewStr := StrReplace(A_Clipboard, "<", "&lt;")
    NewStr := StrReplace(NewStr, ">", "&gt;")
    A_Clipboard := "<code><pre>" . NewStr . "</pre></code>"
    SendInput("^v")
}

#c::{
    ; MsgBox WinGetTitle("A")
    Found := RegExMatch(WinGetTitle("A"), "^\[([^\]]+)\]\s+(.+)\s+\- Jira", &Title)
    if (Found > 0){
        A_Clipboard := Title[1] "_" StrReplace(StrLower(Title[2]), A_Space, "_")
    }else {
        ; MsgBox Found WinGetTitle("A")
    }
}