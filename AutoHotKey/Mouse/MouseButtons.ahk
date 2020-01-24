; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; # - Win ke:
; ^ - Ctrl key
; ! - Alt key
; + - Shift key

#SingleInstance, force

#InstallMouseHook
#InstallKeybdHook

; https://www.autohotkey.com/docs/commands/SetKeyDelay.htm
SetKeyDelay, 0, 100

; ---------------------
; WINDOWS KEY BINDINGS
; ---------------------

; Alt + Shift + Ctrl + 1 ->  
^+!1::
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return

#numpad1::
If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 400, 100, Go To Prevoius Cursos Position
	SendInput, {Ctrl down}-{Ctrl up}
	Sleep, 1000
	SplashTextOff
}
Return

#numpad4::
If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 400, 100, Go To Next Cursos Position
	SendInput, {Ctrl down}{ShiftDown}-{ShiftUp}{Ctrl up}
	Sleep, 1000
	SplashTextOff
}
Return

#numpad2::
If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Find Usages
	SendInput, {AltDown}{F7}{AltUp}
	Sleep, 1000
	SplashTextOff
}
If WinActive("ahk_exe gitextensions.exe")
{
	SplashTextOn, 400, 100, Commit
	SendInput, {Ctrl down}{Space}{Ctrl up}
	Sleep, 1000
	SplashTextOff
}
Return

#numpad5::
If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Show File in Solution Explorer
	SendInput, {AltDown}{ShiftDown}L{ShiftUp}{AltUp}
	Sleep, 1000
	SplashTextOff
}
If WinActive("ahk_exe gitextensions.exe")
{
	SplashTextOn, 400, 100, New Branch
	SendInput, {CtrlDown}b{CtrlUp}
	Sleep, 1000
	SplashTextOff
}
Return

#numpad6::
If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Go to implementaion
	SendInput, {AltDown}{CtrlDown}B{CtrlUp}{AltUp}
	Sleep, 1000
	SplashTextOff
}
Return

#numpad3::
If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Complete, Go To Declaration
	SendInput, {Ctrl down}b{Ctrl up}
	Sleep, 1000
	SplashTextOff
}
If WinActive("ahk_exe gitextensions.exe")
{
	SplashTextOn, 400, 100, Checkout Branch
	SendInput, {Ctrl down}.{Ctrl up}
	Sleep, 1000
	SplashTextOff
}
Return

; Operations to map
; - Visual Studio
;   - Go to implementaion
;   - Go to declaration
;   - Find usages
;   - Build
;   - Methods parameters
;   - Search word under cursor in file
;   - Search text everywhere
;   - Show in Solution Explorer


WheelRight::
If WinActive("ahk_exe devenv.exe")
{
;    Send {Ctrl}{NumpadSub}
;     Send !{F7}   ; Find Usages
    SendInput, ^!b
}
Else If WinActive("ahk_class Notepad") And (Msg <> "Notepad")
{
	Msg = Notepad
	MsgBox, Let's write something
}
Else If WinActive("ahk_class CalcFrame") And (Msg <> "CalcFrame")
{
	Msg = CalcFrame
	MsgBox, let's calculate!
}
Return
; #IfWinActive, ahk_exe  TOTALCMD64.EXE
; {
;     !d::
;     Send {Home}
;     Send {Shift Down}
;     Sleep 10
;     Send {F6 Down}
;     Sleep 10
;     Send {F6 Up}{Shift Up}
;     return
; }
; #IfWinActive

; #IfWinActive, ahk_exe  chrome.exe
; {
;     !+g::
;     oldClipboard:=Clipboard
;     url:= CopyBrowserUrl()
;     Clipboard := RegExReplace(url, "www\.youtube", "www.genyoutube")
;     Send ^t
;     sleep 10
;     Send ^v
;     Sleep 10
;     Send {Enter}
;     sleep 10
;     Clipboard:=oldClipboard
;     return
; }
; #IfWinActive

