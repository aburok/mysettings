; #!v::
; #+v::
;     WinActivate, ^.*( - Microsoft Visual Studio).*$
; return

; #+m::
;     WinActivate, ^.*(mysettings).*(Visual Studio Code)$
; return

#+f::
    WinActivate, ^(.*)(ffs_gui).*$
return


; #+t::
;     WinActivate, ahk_exe TOTALCMD64.EXE
; return


; #+o::
;     WinActivate, ahk_exe OUTLOOK.EXE
; return


; #+e::
;     WinActivate, ahk_exe ONENOTE.EXE
; return

; #!c::
; #+c::
; 	WinActivate, ^.*(Google Chrome)$
; return

; #!i::
; #+i::
; 	WinActivate, ^(Todoist).*$
; return

; Visua Studio Code
; #!d::
; #+d::
; 	WinActivate, ^.*(Visual Studio Code)$
; return

; #!n::
; #+n::
; 	WinActivate, ^.*(Notepad\+\+).*$
; return

; Powershell / Command line tool
#+r::
	; WinActivate, ^PS::.*$
    WinActivate, ahk_exe ConEmu64.exe
return


; #+a::
;     WinActivate, ^.*(Microsoft Teams).*$
; return

#+x::
   WinActivate, ^.*(xmind).*$
return

#+b::
#+z::
    WinActivate, ahk_exe mintty.exe
return