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
vsShortcuts := "Visual Studio shortcuts`n"
chromeShortcuts := "Chrome shortcuts`n"
gitShortcuts := "Git extensions shortcuts`n"
explorerShortcuts := "Windows Explorer shortcuts`n"
teamsShortcuts := "MS Teams shortcuts`n"


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

#WheelDown::
    {
        SendInput "{AltDown}{F12}{AltUp}"
    }

#WheelUp::
    {
        SendInput "{CtrlDown}{ShiftDown}{Tab}{ShiftUp}{CtrlUp}"
    }

+WheelDown::
    {
        If WinActive("ahk_exe devenv.exe")
        {
            SendInput "{CtrlDown}-{CtrlUp}"
        }
    }

+WheelUp::
    {
        If WinActive("ahk_exe devenv.exe")
        {
            SendInput "{CtrlDown}{ShiftDown}-{ShiftUp}{CtrlUp}"
        }
    }

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
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe chrome.exe") {
            SendInput "{CtrlDown}{F5}{CtrlUp}"
        } else if WinActive("ahk_exe notepad++.exe"){
            SendInput "{CtrlDown}r{CtrlUp}"
        } else if WinActive("ahk_exe doublecmd.exe"){
            SendInput "{CtrlDown}d{CtrlUp}"
        }
    }

    ; $$$$$$$\  $$$$$$$\ $$$$$$\                 
    ; $$  __$$\ $$  __$$\\_$$  _|         $$\    
    ; $$ |  $$ |$$ |  $$ | $$ |           $$ |   
    ; $$ |  $$ |$$$$$$$  | $$ |        $$$$$$$$\ 
    ; $$ |  $$ |$$  ____/  $$ |        \__$$  __|
    ; $$ |  $$ |$$ |       $$ |           $$ |   
    ; $$$$$$$  |$$ |     $$$$$$\          \__|   
    ; \_______/ \__|     \______|                

#PgUp::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe chrome.exe") {
            SendInput "{CtrlDown}w{CtrlUp}"
        }
    }

    ; $$$$$$$\  $$$$$$$\ $$$$$$\               
    ; $$  __$$\ $$  __$$\\_$$  _|              
    ; $$ |  $$ |$$ |  $$ | $$ |                
    ; $$ |  $$ |$$$$$$$  | $$ |        $$$$$$\ 
    ; $$ |  $$ |$$  ____/  $$ |        \______|
    ; $$ |  $$ |$$ |       $$ |                
    ; $$$$$$$  |$$ |     $$$$$$\               
    ; \_______/ \__|     \______|              

#PgDn::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe chrome.exe") {
            SendInput "{CtrlDown}{ShiftDown}t{ShiftUp}{CtrlUp}"
        }
    }

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

    chromeShortcuts := chromeShortcuts . " 1 - Go back `n"
#numpad1::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            WindowTitle := WinGetTitle("A")
            If InStr(WindowTitle, "(Debugging)") {
                ; Step Over
                SendInput "{F10}"
                Return
            }

            SendInput "{Ctrl down}-{Ctrl up}"
        } Else If WinActive("ahk_exe Code.exe") {
            SendInput "{AltDown}{Left}{AltUp}"
        } Else If WinActive("ahk_exe doublecmd.exe") {
            SendInput "{AltDown}{Left}{AltUp}"
        } Else {
            SendInput "{Browser_Back}"
        }
    }

    ; $$\   $$\ 
    ; $$ |  $$ |
    ; $$ |  $$ |
    ; $$$$$$$$ |
    ; \_____$$ |
    ;       $$ |
    ;       $$ |
    ;       \__|

    chromeShortcuts := chromeShortcuts . " 4 - Go forward `n"
    vsShortcuts := vsShortcuts . " 4 - Go to next cursor position `n"
#numpad4::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            WindowTitle := WinGetTitle("A")
            If InStr(WindowTitle, "(Debugging)") {
                ; Run to the Cursor
                SendInput "{CtrlDown}{F10}{CtrlUp}"
                Return
            }

            SendInput "{Ctrl down}{ShiftDown}-{ShiftUp}{Ctrl up}"
            ; SplashTextOn, 400, 100, Go To Next Cursos Position
            ; SetTimer, Off, 2000
        } Else If WinActive("ahk_exe Code.exe") {
            SendInput "{AltDown}{Right}{AltUp}"
        } Else If WinActive("ahk_exe doublecmd.exe") {
            SendInput "{AltDown}{Right}{AltUp}"
        } Else {
            SendInput "{Browser_Forward}"
        }
    }

    ;  $$$$$$\  
    ; $$  __$$\ 
    ; \__/  $$ |
    ;  $$$$$$  |
    ; $$  ____/ 
    ; $$ |      
    ; $$$$$$$$\ 
    ; \________|

#numpad2::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            WindowTitle := WinGetTitle("A")
            If InStr(WindowTitle, "(Debugging)") {
                ; Step Into
                SendInput "{F11}"
                Return
            }

            ; Find Usages
            SendInput "{AltDown}{F7}{AltUp}"
        } Else If WinActive("ahk_exe Explorer.exe") {
            SendInput "{AltDown}{Up}{AltUp}"
        } Else If WinActive("ahk_exe gitextensions.exe") {
            SendInput "{Ctrl down}{Space}{Ctrl up}"
        } else if WinActive("ahk_exe teams.exe"){
            SendInput "(yes){Enter}"
        } Else {
            SendInput "{Ctrl down}{ShiftDown}{Tab}{ShiftUp}{Ctrl up}"
        }
    }

    ; $$$$$$$\  
    ; $$  ____| 
    ; $$ |      
    ; $$$$$$$\  
    ; \_____$$\ 
    ; $$\   $$ |
    ; \$$$$$$  |
    ;  \______/ 

#numpad5::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            WindowTitle := WinGetTitle("A")
            If InStr(WindowTitle, "(Debugging)") {
                ; Stop Out of method
                SendInput "{ShiftDown}{F11}{ShiftUp}"
                Return
            }

            ;  Show File in Solution Explorer
            SendInput "{AltDown}{ShiftDown}L{ShiftUp}{AltUp}"
        } else If WinActive("ahk_exe gitextensions.exe") {
            SendInput "{CtrlDown}b{CtrlUp}"
        } Else {
            SendInput "{Ctrl down}{Tab}{Ctrl up}"
        }
    }

    ;  $$$$$$\  
    ; $$ ___$$\ 
    ; \_/   $$ |
    ;   $$$$$ / 
    ;   \___$$\ 
    ; $$\   $$ |
    ; \$$$$$$  |
    ;  \______/ 

#numpad3::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            WindowTitle := WinGetTitle("A")
            If InStr(WindowTitle, "(Debugging)") {
                ; Continue execution
                SendInput "{F5}"
                Return
            }

            ; Go To Declaration
            SendInput "{Ctrl down}b{Ctrl up}"
        } Else If WinActive("ahk_exe Explorer.exe") {
            SendInput "{LWinDown}{Left}{LWinUp}"
            Sleep( 500 )
            SendInput "{Escape}"
        } Else If WinActive("ahk_exe gitextensions.exe") {
            ; SplashTextOn, 400, 100, Checkout Branch
            SendInput "{Ctrl down}.{Ctrl up}"
        } Else If WinActive("ahk_exe OUTLOOK.EXE") {
            SendInput "{Del}"
        } else if WinActive("ahk_exe chrome.exe"){
            SendInput "{CtrlDown}w{CtrlUp}"
        }
    }

    ;  $$$$$$\  
    ; $$  __$$\ 
    ; $$ /  \__|
    ; $$$$$$$\  
    ; $$  __$$\ 
    ; $$ /  $$ |
    ;  $$$$$$  |
    ;  \______/ 

#numpad6::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            WindowTitle := WinGetTitle("A")
            If InStr(WindowTitle, "(Debugging)") {
                ; Quick watch variable
                SendInput "{ShiftDown}{F9}{ShiftUp}"
                Return
            }
            ; Go to implementaion
            SendInput "{AltDown}{CtrlDown}B{CtrlUp}{AltUp}"
        } Else If WinActive("ahk_exe Explorer.exe") {
            SendInput "{LWinDown}{Right}{LWinUp}"
            Sleep ( 500 )
            SendInput "{Escape}"
        } else if WinActive("ahk_exe chrome.exe"){
            SendInput "{CtrlDown}{ShiftDown}t{ShiftUp}{CtrlUp}"
        }
    }

    ; $$$$$$$$\ 
    ; \____$$  |
    ;     $$  / 
    ;    $$  /  
    ;   $$  /   
    ;  $$  /    
    ; $$  /     
    ; \__/      

#numpad7::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            ;  Next Error
            SendInput "{AltDown}{F12}{AltUp}"
        }
        If WinActive("ahk_exe gitextensions.exe")
        {
            ; Checkout Branch
            SendInput "{Ctrl down}.{Ctrl up}"
        } else if WinActive("ahk_exe chrome.exe"){
            SendInput "{Home}"
        } else if WinActive("ahk_exe teams.exe"){
            SendInput "nasi najlepsi inzynierowie nad tym pracuja (yes){Enter}"
        }
    }

    ;   $$\   $$$$$$\  
    ; $$$$ | $$$ __$$\ 
    ; \_$$ | $$$$\ $$ |
    ;   $$ | $$\$$\$$ |
    ;   $$ | $$ \$$$$ |
    ;   $$ | $$ |\$$$ |
    ; $$$$$$\\$$$$$$  /
    ; \______|\______/ 

#numpad0::
    {
        ; For some reason WIN key is still pressed when mouse sends the Win + anykey
        ; So after each short cut, you need to send WIN UP 
        Send "{LWin up}{RWin up}"

        If WinActive("ahk_exe devenv.exe")
        {
            ; Prev Error
            SendInput "{AltDown}{ShiftDown}{F12}{ShiftUp}{AltUp}"
        }
        If WinActive("ahk_exe gitextensions.exe")
        {
            SendInput "{Ctrl down}.{Ctrl up}"
        } else if WinActive("ahk_exe chrome.exe"){
            SendInput "{End}"
        }
    }

#numpad9::
    {
        helpText := generalShortcuts
        If WinActive("ahk_exe devenv.exe")
        {
        helpText := vsShortcuts
        } Else If WinActive("ahk_exe Explorer.exe") {
        helpText := explorerShortcuts
        } Else If WinActive("ahk_exe gitextensions.exe") {
        helpText := gitShortcuts
        } else if WinActive("ahk_exe teams.exe"){
        helpText := teamsShortcuts
        } else if WinActive("ahk_exe chrome.exe"){
        helpText := chromeShortcuts
        }
        MsgBox("" . helpText, "Shortcuts for : ", "O Icon? T10")
    }

    ; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

WheelRight::
    {
        If WinActive("ahk_exe devenv.exe")
        {
            ;    Send {Ctrl}{NumpadSub}
            ;     Send !{F7}   ; Find Usages
            SendInput "^!b"
        }
        Else If WinActive("ahk_class Notepad")
        {
            Msg := "Notepad"
            MsgBox ( "Let's write something" )
        }
        Else If WinActive("ahk_class CalcFrame") 
        {
            Msg := "CalcFrame"
            MsgBox ( "let's calculate!" )
        }
    }