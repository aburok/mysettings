; ! - ALT
; + - SHIFT
; ^ - CTRL
; # - WIN
; < - LEFT KEY e.g  <! - LEFT ALT
; > - RIGHT KEY e.g  >! - RIGHT ALT

; #!v::
; #+v::
;     WinActivate, ^.*( - Microsoft Visual Studio).*$
; return

; #+m::
;     WinActivate, ^.*(mysettings).*(Visual Studio Code)$
; return

; #+f:: {
;     WinActivate("^(.*)(ffs_gui).*$")
; }

; #+o::
;     WinActivate, ahk_exe OUTLOOK.EXE
; return

<!+e::
#+e:: {
    WinActivate("ahk_exe msedge.exe") 
}

<!+w::
#+w:: {
    WinActivate("ahk_exe gvim.exe") 
}

<!+a::
#+a:: {
    WinActivate("ahk_exe ONENOTE.EXE") 
}

<!+c::
#+c:: {
	WinActivate("^.*(Google Chrome)$") 
}

<!+s:: {
	WinActivate("ahk_exe slack.exe") 
}

<!+x:: {
	WinActivate("ahk_exe WindowsTerminal.exe") 
}

; #!i::
; #+i::
; 	WinActivate, ^(Todoist).*$
; return

; Visua Studio Code
; #!d::
; #+d::
; 	WinActivate, ^.*(Visual Studio Code)$
; return

<!+d::
#+d:: {
	WinActivate("^.*(Notepad\+\+).*$") 
    }

; Powershell / Command line tool
#+r:: {
	; WinActivate, ^PS::.*$
    WinActivate("ahk_exe ConEmu64.exe")
}

; #+a::
;     WinActivate, ^.*(Microsoft Teams).*$
; return

#+x:: {
   WinActivate("^.*(xmind).*$") 
}