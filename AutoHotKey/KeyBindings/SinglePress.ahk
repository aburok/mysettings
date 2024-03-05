; ! - ALT
; + - SHIFT
; ^ - CTRL
; # - WIN
; < - LEFT KEY e.g  <! - LEFT ALT
; > - RIGHT KEY e.g  >! - RIGHT ALT

; #+m::
;     WinActivate, ^.*(mysettings).*(Visual Studio Code)$
; return


<!+c::
#+c:: {
    WinActivate("ahk_exe OUTLOOK.EXE")
}

<!+e::
#+e:: {
    WinActivate("ahk_exe msedge.exe") 
}

<!+w::
#+w:: {
    WinActivate("^WhatsApp$") 
}

<!+g::
#+g:: {
    WinActivate("ahk_exe GitExtensions.exe") 
}

<!+a::
#+a:: {
    WinActivate("^.*(OneNote for Windows 10)") 
}

<!+x::
#+x:: {
	WinActivate("^.*(Google Chrome)$") 
}

<!+s:: {
	WinActivate("ahk_exe slack.exe") 
}

<!+q:: {
	WinActivate("ahk_exe WindowsTerminal.exe") 
}

<!+z:: {
	WinActivate("^YouTube Music") 
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

; Rider
#+r:: 
<!+r:: {
	; WinActivate, ^PS::.*$
    WinActivate("ahk_exe rider64.exe")
}

; #+a::
;     WinActivate, ^.*(Microsoft Teams).*$
; return

; #+x:: {
;    WinActivate("^.*(xmind).*$") 
; }

; #!v::
; #+v::
;     WinActivate, ^.*( - Microsoft Visual Studio).*$
; return

; #+f:: {
;     WinActivate("^(.*)(ffs_gui).*$")
; }
