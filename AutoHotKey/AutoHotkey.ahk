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

Capslock::
    {
        Send "{CtrlDown}"
        KeyWait "CapsLock"
        Send "{CtrlUp}"
        if ( A_PriorKey = "CapsLock" )
        {
            Send "{Esc}"
        }
    }

    ; Prevent accidentaly turning CAPSLOCK on if pressed with Shift
!CapsLock::
+CapsLock::
^CapsLock::
    {
        Send "{Esc}"
    }

#LButton::
#+q::
    { 
        SendEvent "{LWin down}{LCtrl down}{Left down}"
        Sleep 100
        SendEvent "{Left up}{LCtrl up}{Lwin up} "
        ; switch to next virtual desktop
        Sleep 1000
    }

#+w::
#RButton::
    { 
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

<!h::Left       ; LEFT ALT (<!) + h  -> Send Left Arrow key
<!+h::Home      ; LEFT ALT (<!) + SHIFT + h  -> Send Home key
    
<!j::Down       ; LEFT ALT + j -> Send Down Arrow ke
<!+j::PgDn       ; LEFT ALT + SHIFT + J -> Send Page Down
    
<!k::Up         ; LEFT ALT + k -> Send Up Arrow key
<!+k::PgUp      ; LEFT ALT + SHIFT + k -> Send Page Up key
            
<!l::Right      ; ALT + l -> Send Right Arrow key
<!+l::End      ; ALT + SHIFT + l -> Send End key

<!;:: Send "{CtrlDown}{Home}{CtrlUp}"
<!/:: Send "{CtrlDown}{End}{CtrlUp}"

<!x::Del
<!d::BackSpace

<!m::AppsKey
<!m::RButton
#m::AppsKey

; Media 
<!o::Media_Play_Pause
<!p::Media_Prev
<!n::Media_Next

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

