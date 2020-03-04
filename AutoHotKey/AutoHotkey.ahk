; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; # - Win ke:
; ^ - Ctrl key
; ! - Alt key
; + - Shift key

#SingleInstance, force

; ---------------------
; WINDOWS KEY BINDINGS
; ---------------------

#Persistent
OnClipboardChange("ClipChanged")
return

ClipChanged(Type) {
    recentItems := new RecentItemsViewer()
    recentItems.ParseClipboardItem()
}

; +^m::
;     configPathFile := USERPROFILE . "\sitecore.navigation.ini"
;     MsgBox, %configPathFile%
;     Log("Ctrl Shigt M pressed", [])
;     recentItems := new RecentItemsViewer()
;     recentItems.ShowDialog()
; return

+^!s::
    ; https://autohotkey.com/docs/commands/SoundPlay.htm
    SoundPlay, C:\Users\dawid.koruba\Downloads\thisissparta.swf.mp3
return

CAPSLOCK::Escape

; Match window names by part of the title
SetTitleMatchMode, RegEx
SetTitleMatchMode, Slow

; Set Lock keys permanently
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

DetectHiddenText, On
DetectHiddenWindows, On
return

DropBoxDir := "C:\Dropbox"
ToolsDir := DropBoxDir . "\Tools"

#LButton::
#+q::
#WheelDown::
sendevent {LWin down}{LCtrl down}{Left down}
Sleep 100
SendEvent {Left up}{LCtrl up}{Lwin up}      ; switch to next virtual desktop
Sleep 1000
return

#+w::
#RButton::
#WheelUp::
sendevent {LWin down}{LCtrl down}{Right down}
Sleep 100
SendEvent {Right up}{LCtrl up}{Lwin up}      ; switch to next virtual desktop
Sleep 1000
return


#+h::Send #+{Left}
#+l::Send #+{Right}
#+j::Send #{Left}
#+k::Send #{Right}
#+u::Send #{Up}


; -----------------------------------------------------
; Emulate Home and End
; HOME
; Movement
!PgUp:: Send {Home}
!^PgUp:: Send {CtrlDown}{Home}{CtrlUp}

; Selecting
!+PgUp:: Send {ShiftDown}{Home}{ShiftUp}
!^+PgUp:: Send {CtrlDown}{ShiftDown}{Home}{ShiftUp}{CtrlUp}

; END
; Movement
!PgDn:: Send {End}
!^PgDn:: Send {CtrlDown}{End}{CtrlUp}

; Selecting
!+PgDn:: Send {ShiftDown}{Home}{ShiftUp}
!^+PgDn:: Send {CtrlDown}{ShiftDown}{End}{ShiftUp}{CtrlUp}

; -----------------------------------------------------


+!c::

INPUT, command, T2 L2

if ("f" = command){
    FlushAll()
} else if ("a" = command){

}
return

+!f::
INPUT, command, T2 L2

if ("ia" = command)
    gvim("C:\Windows\System32\inetsrv\Config\applicationHost.config")
else if ("hh" = command)
    gvim("C:\Windows\System32\drivers\etc\hosts")
else if ("co" = command){
    gvim(Clipboard)
}
return

+!v::

INPUT, command, T2 L1

if ("e" = command){
    INPUT, command, T2 L1
    LastNLetters := SubStr(Clipboard, -1 * command)
    Send, %LastNLetters%
}
else if ("s" = command){
    INPUT, command, T2 L1
    FirstNLetters := SubStr(Clipboard, 1, command)
    Send, %FirstNLetters%
}

return

+!g::
INPUT, command, T2 L1

if ("g" = command){
    Clipboard := CreateGUID()
}
else if ("u" = command){
    Clipboard := CreateUUID()
}
else if ("l" = command){
    GenerateLoremIpsum()
}

return


#Include <Hotkeys>

#Include <Jxon>
#Include <JSON>

#Include %A_ScriptDir%\Windows\Sound.ahk
#Include %A_ScriptDir%\Common\Common.ahk
#Include %A_ScriptDir%\slugify.ahk
#Include %A_ScriptDir%\ParseUrl.ahk


#Include %A_ScriptDir%\FastNavigation\Navigation.ahk
#Include %A_ScriptDir%\Time\Time.ahk

#Include %A_ScriptDir%\KeyBindings\Applications.ahk
#Include %A_ScriptDir%\KeyBindings\SinglePress.ahk
#Include %A_ScriptDir%\KeyBindings\Yank.ahk



; -----------------------
; FUNCTIONS
; -----------------------

GetDirFromWindowTitle(){
    ID := WinExist("A")
    WinGetTitle, Title, ahk_ID %ID%
    if(FileExist(Title))
        return  Title
    return
}

!+q::
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return


