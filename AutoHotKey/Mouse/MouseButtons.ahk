; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; # - Win ke:
; ^ - Ctrl key
; ! - Alt key
; + - Shift key

; https://www.autohotkey.com/docs/KeyList.htm

#SingleInstance, force

#InstallMouseHook
#InstallKeybdHook

; https://www.autohotkey.com/docs/commands/SetKeyDelay.htm
SetKeyDelay, 0, 100

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
; http://patorjk.com/software/taag/#p=display&f=Big%20Money-nw&t=Wheel%0A


; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

; $$\      $$\ $$\   $$\ $$$$$$$$\ $$$$$$$$\ $$\       
; $$ | $\  $$ |$$ |  $$ |$$  _____|$$  _____|$$ |      
; $$ |$$$\ $$ |$$ |  $$ |$$ |      $$ |      $$ |      
; $$ $$ $$\$$ |$$$$$$$$ |$$$$$\    $$$$$\    $$ |      
; $$$$  _$$$$ |$$  __$$ |$$  __|   $$  __|   $$ |      
; $$$  / \$$$ |$$ |  $$ |$$ |      $$ |      $$ |      
; $$  /   \$$ |$$ |  $$ |$$$$$$$$\ $$$$$$$$\ $$$$$$$$\ 
; \__/     \__|\__|  \__|\________|\________|\________|
                                                     

^WheelDown::
If WinActive("ahk_exe devenv.exe")
{
	SendInput, {CtrlDown}{AltDown}{Down}{AltUp}{CtrlUp}
}
Return

^WheelUp::
If WinActive("ahk_exe devenv.exe")
{
	SendInput, {CtrlDown}{AltDown}{Up}{AltUp}{CtrlUp}
}
Return

!WheelDown::
If WinActive("ahk_exe devenv.exe")
{
	SendInput, {AltDown}{F12}{AltUp}
}
If WinActive("ahk_exe chrome.exe")
{
	SendInput, {CtrlDown}{Tab}{CtrlUp}
}
Return

!WheelUp::
If WinActive("ahk_exe devenv.exe")
{
	SendInput, {AltDown}{ShiftDown}{F12}{ShiftUp}{AltUp}
}
If WinActive("ahk_exe chrome.exe")
{
	SendInput, {CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}
}
Return

#WheelDown::
	SendInput, {AltDown}{F12}{AltUp}
Return

#WheelUp::
	SendInput, {CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}
Return

+WheelDown::
If WinActive("ahk_exe devenv.exe")
{
	SendInput, {CtrlDown}-{CtrlUp}
}
Return

+WheelUp::
If WinActive("ahk_exe devenv.exe")
{
	SendInput, {CtrlDown}{ShiftDown}-{ShiftUp}{CtrlUp}
}
Return

; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

; $$$$$$$$\  $$$$$$\  $$$$$$$\  
; \__$$  __|$$  __$$\ $$  __$$\ 
;    $$ |   $$ /  $$ |$$ |  $$ |
;    $$ |   $$ |  $$ |$$$$$$$  |
;    $$ |   $$ |  $$ |$$  ____/ 
;    $$ |   $$ |  $$ |$$ |      
;    $$ |    $$$$$$  |$$ |      
;    \__|    \______/ \__|      
                              

; $$\   $$\ 
; $$ |  $$ |
; $$ |  $$ |
; $$$$$$$$ |
; \_____$$ |
;       $$ |
;       $$ |
;       \__|
          
; Mouse Top : 4 (left to left click) -> Win + Numpad /

#NumpadDiv::

; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe chrome.exe") {
	SendInput, {CtrlDown}{F5}{CtrlUp}
} else if WinActive("ahk_exe notepad++.exe"){
	SendInput, {CtrlDown}r{CtrlUp}
} else if WinActive("ahk_exe doublecmd.exe"){
	SendInput, {CtrlDown}d{CtrlUp}
}
Return


; $$$$$$$\  $$$$$$$\ $$$$$$\                 
; $$  __$$\ $$  __$$\\_$$  _|         $$\    
; $$ |  $$ |$$ |  $$ | $$ |           $$ |   
; $$ |  $$ |$$$$$$$  | $$ |        $$$$$$$$\ 
; $$ |  $$ |$$  ____/  $$ |        \__$$  __|
; $$ |  $$ |$$ |       $$ |           $$ |   
; $$$$$$$  |$$ |     $$$$$$\          \__|   
; \_______/ \__|     \______|                

#PgUp::

; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe chrome.exe") {
	SendInput, {CtrlDown}w{CtrlUp}
}
Return


; $$$$$$$\  $$$$$$$\ $$$$$$\               
; $$  __$$\ $$  __$$\\_$$  _|              
; $$ |  $$ |$$ |  $$ | $$ |                
; $$ |  $$ |$$$$$$$  | $$ |        $$$$$$\ 
; $$ |  $$ |$$  ____/  $$ |        \______|
; $$ |  $$ |$$ |       $$ |                
; $$$$$$$  |$$ |     $$$$$$\               
; \_______/ \__|     \______|              
                                         
#PgDn::

; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe chrome.exe") {
	SendInput, {CtrlDown}{ShiftDown}t{ShiftUp}{CtrlUp}
}
Return

; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

;  $$$$$$\  $$$$$$\ $$$$$$$\  $$$$$$$$\ 
; $$  __$$\ \_$$  _|$$  __$$\ $$  _____|
; $$ /  \__|  $$ |  $$ |  $$ |$$ |      
; \$$$$$$\    $$ |  $$ |  $$ |$$$$$\    
;  \____$$\   $$ |  $$ |  $$ |$$  __|   
; $$\   $$ |  $$ |  $$ |  $$ |$$ |      
; \$$$$$$  |$$$$$$\ $$$$$$$  |$$$$$$$$\ 
;  \______/ \______|\_______/ \________|
                                      
                                      

;   $$\   
; $$$$ |  
; \_$$ |  
;   $$ |  
;   $$ |  
;   $$ |  
; $$$$$$\ 
; \______|

#numpad1::
; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 400, 100, Go To Prevoius Cursos Position
	SendInput, {Ctrl down}-{Ctrl up}
	Sleep, 1000
	SplashTextOff
} Else If WinActive("ahk_exe Code.exe") {
	SendInput, {AltDown}{Left}{AltUp}
} Else If WinActive("ahk_exe doublecmd.exe") {
	SendInput, {AltDown}{Left}{AltUp}
} Else {
	SendInput, {Browser_Back}
}
Return


; $$\   $$\ 
; $$ |  $$ |
; $$ |  $$ |
; $$$$$$$$ |
; \_____$$ |
;       $$ |
;       $$ |
;       \__|
          
#numpad4::
; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 400, 100, Go To Next Cursos Position
	SendInput, {Ctrl down}{ShiftDown}-{ShiftUp}{Ctrl up}
	Sleep, 1000
	SplashTextOff
} Else If WinActive("ahk_exe Code.exe") {
	SendInput, {AltDown}{Right}{AltUp}
} Else If WinActive("ahk_exe doublecmd.exe") {
	SendInput, {AltDown}{Right}{AltUp}
} Else {
	SendInput, {Browser_Forward}
}

Return


;  $$$$$$\  
; $$  __$$\ 
; \__/  $$ |
;  $$$$$$  |
; $$  ____/ 
; $$ |      
; $$$$$$$$\ 
; \________|
          
          
#numpad2::
; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Find Usages
	SendInput, {AltDown}{F7}{AltUp}
	Sleep, 1000
	SplashTextOff
} Else If WinActive("ahk_exe Explorer.exe") {
	SendInput, {AltDown}{Up}{AltUp}
} Else If WinActive("ahk_exe gitextensions.exe") {
	SplashTextOn, 400, 100, Commit
	SendInput, {Ctrl down}{Space}{Ctrl up}
	Sleep, 1000
	SplashTextOff
} else if WinActive("ahk_exe teams.exe"){
	SendInput, (yes){Enter}
}  Else {
	SendInput, {Ctrl down}{ShiftDown}{Tab}{ShiftUp}{Ctrl up}
}

Return


; $$$$$$$\  
; $$  ____| 
; $$ |      
; $$$$$$$\  
; \_____$$\ 
; $$\   $$ |
; \$$$$$$  |
;  \______/ 
          
          
#numpad5::
; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Show File in Solution Explorer
	SendInput, {AltDown}{ShiftDown}L{ShiftUp}{AltUp}
	Sleep, 1000
	SplashTextOff
} else If WinActive("ahk_exe gitextensions.exe") {
	SplashTextOn, 400, 100, New Branch
	SendInput, {CtrlDown}b{CtrlUp}
	Sleep, 1000
	SplashTextOff
}  Else {
	SendInput, {Ctrl down}{Tab}{Ctrl up}
}

Return


;  $$$$$$\  
; $$ ___$$\ 
; \_/   $$ |
;   $$$$$ / 
;   \___$$\ 
; $$\   $$ |
; \$$$$$$  |
;  \______/ 
          

#numpad3::
; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Complete, Go To Declaration
	SendInput, {Ctrl down}b{Ctrl up}
	Sleep, 1000
	SplashTextOff
} Else If WinActive("ahk_exe Explorer.exe") {
	SendInput, {LWinDown}{Left}{LWinUp}
	Sleep, 500
	SendInput, {Escape}
} Else If WinActive("ahk_exe gitextensions.exe") {
	SplashTextOn, 400, 100, Checkout Branch
	SendInput, {Ctrl down}.{Ctrl up}
	Sleep, 1000
	SplashTextOff
} Else If WinActive("ahk_exe OUTLOOK.EXE") {
	SplashTextOn, 400, 100, Delete Email
	SendInput, {Del}
	Sleep, 1000
	SplashTextOff
} else if WinActive("ahk_exe chrome.exe"){
	SendInput, {CtrlDown}w{CtrlUp}
}

Return

;  $$$$$$\  
; $$  __$$\ 
; $$ /  \__|
; $$$$$$$\  
; $$  __$$\ 
; $$ /  $$ |
;  $$$$$$  |
;  \______/ 
          

#numpad6::

; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Go to implementaion
	SendInput, {AltDown}{CtrlDown}B{CtrlUp}{AltUp}
	Sleep, 1000
	SplashTextOff
} Else If WinActive("ahk_exe Explorer.exe") {
	SendInput, {LWinDown}{Right}{LWinUp}
	Sleep, 500
	SendInput, {Escape}
} else if WinActive("ahk_exe chrome.exe"){
	SendInput, {CtrlDown}{ShiftDown}t{ShiftUp}{CtrlUp}
}

Return


; $$$$$$$$\ 
; \____$$  |
;     $$  / 
;    $$  /  
;   $$  /   
;  $$  /    
; $$  /     
; \__/      
          

#numpad7::

; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Complete, Next Error
	SendInput, {AltDown}{F12}{AltUp}
	Sleep, 1000
	SplashTextOff
}
If WinActive("ahk_exe gitextensions.exe")
{
	SplashTextOn, 400, 100, Checkout Branch
	SendInput, {Ctrl down}.{Ctrl up}
	Sleep, 1000
	SplashTextOff
} else if WinActive("ahk_exe chrome.exe"){
	SendInput, {Home}
} else if WinActive("ahk_exe teams.exe"){
	SendInput, nasi najlepsi inzynierowie nad tym pracuja (yes){Enter}
}
Return


;   $$\   $$$$$$\  
; $$$$ | $$$ __$$\ 
; \_$$ | $$$$\ $$ |
;   $$ | $$\$$\$$ |
;   $$ | $$ \$$$$ |
;   $$ | $$ |\$$$ |
; $$$$$$\\$$$$$$  /
; \______|\______/ 


#numpad0::

; For some reason WIN key is still pressed when mouse sends the Win + anykey
; So after each short cut, you need to send WIN UP 
Send, {LWin up}{RWin up}

If WinActive("ahk_exe devenv.exe")
{
	SplashTextOn, 200, 200, Complete, Prev Error
	SendInput, {AltDown}{ShiftDown}{F12}{ShiftUp}{AltUp}
	Sleep, 1000
	SplashTextOff
}
If WinActive("ahk_exe gitextensions.exe")
{
	SplashTextOn, 400, 100, Checkout Branch
	SendInput, {Ctrl down}.{Ctrl up}
	Sleep, 1000
	SplashTextOff
} else if WinActive("ahk_exe chrome.exe"){
	SendInput, {End}
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

; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

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

