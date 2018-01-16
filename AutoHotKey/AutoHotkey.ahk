; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; ^!n::
; IfWinExist Untitled - Notepad
;	WinActivate
; else
;	Run Notepad
; return

; # - Win key
; ^ - Ctrl key
; ! - Alt key
; + - Shift key

; ---------------------
; WINDOWS KEY BINDINGS
; ---------------------
; #n::Run Notepad

; Match window names by part of the title
SetTitleMatchMode RegEx

; Set Lock keys permanently
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
return

DropBoxDir := "C:\Dropbox"
ToolsDir := DropBoxDir . "\Tools"

;  #+a::
;  Run "..\..\window-layout\window-layout.ahk"
;  Run autohotkey.exe "..\..\shortcut-assistant\shortcut-assistant.ahk"
;  SetWorkingDir, "."
;  retrn

#PgUp::Send {Volume_Up 1}
#PgDn::Send {Volume_Down 1}

!#v::
+#v::
    WinActivate, ^.*( - Microsoft Visual Studio).*$
return

!#t::
+#t::
    WinActivate, ^.*(Total Commander).*$
return

+#a::
!#s::
    WinActivate, Slack
return

+#o::
+#e::
	WinActivate, .*( - OneNote)$
return

!#c::
+#c::
	WinActivate, .*( - Google Chrome)$
return

; Visua Studio Code
!#d::
+#d::
	WinActivate, ^(Todoist).*$
return

!#i::
	WinActivate, ^(Internet Information Services).*$
return

!#n::
+#n::
	WinActivate, ^.*(Notepad\+\+)$
return

#!q::
#+q::
	WinActivate, ^.*(Microsoft SQL Server Management Studio).*$
return

#!r::
#+r::
	WinActivate, ^PS::.*$
return

#!w::
#+w::
	WinActivate, ^.*(Tasks).*$
return

#!z::
#+z::
	WinActivate, ^IPOX.*$
return

#!b::
    Run "http://build.tools.tcwdigital.co.uk:8181" 
return

#!l::
    Run "https://trello.com/b/E4Twkqe5/4-development"
return

#!m::
    Run "C:\Program Files (x86)\Microsoft VS Code\code.exe" C:\Dropbox\mysettings\
return


CAPSLOCK::Escape

; -----------------------
; FUNCTIONS
; -----------------------
RunOrActivate(WinTitle, Target) {	; RoA means "RunOrActivate"
    OutputDebug, %WinTitle% %Target%
    If WinExist( WinTitle )
        WinActivate, %WinTitle%
    else
        Run, %Target%
}

UnEscape_Chars(string){
    StringReplace string, string, file:///, , All
    StringReplace string, string, `%20, `  , All
    StringReplace string, string, `/, `\, All
    return string
}

Explorer_GetWindow(hwnd = ""){
    hwnd := hwnd ? hwnd : WinExist("A")
    WinGetClass class, ahk_id %hwnd%
	if (class="CabinetWClass" or class="ExploreWClass" or class="Progman") {
        ;  for window in ComObjCreate("Shell.Application").Windows {
        ;      if (window.hwnd==hwnd) {
        ;          return window
        ;      }
        ;  }
    }
}

ReturnFirstExistingFile(FileList){
    Loop , parse, FileList, `,
    {
        isFile := FileExist(A_LoopField)
        if (isFile){
            return %A_LoopField%
        }
    }
    return
}

TryOpenApplicationOrDefault(appPath, LastChance, params = ""){
}

GetDirFromWindowTitle(){
    ID := WinExist("A")
    WinGetTitle, Title, ahk_ID %ID%
    if( FileExist(Title))
        return  Title
    return
}

;Reload script on Ctrl + S (Save)
~^s::
IfWinActive, %A_ScriptName%
{
    SplashTextOn,,,Updated script,
    Sleep, 200
    SplashTextOff
    Reload
}
return

