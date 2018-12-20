; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; ^!n::
; IfWinExist Untitled - Notepad
;	WinActivate
; else
;	Run Notepad
; return

; # - Win ke:
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

; !LButton::
; Send, Browser_Back
; return

; !RButton::
; Send, Browser_Forward
; return


#PgUp::Send {Volume_Up 1}
#PgDn::Send {Volume_Down 1}
; #j::Send {Volume_Up 1}
; #k::Send {Volume_Down 1}

; #+j::Send {Shift}+{LWin}+{Left}
; #+h::Send #+{Left}
#!h::Send #+{Left}
#+l::Send #+{Right}
#+j::Send #{Left}
#+k::Send #{Right}
#+u::Send #{Up}

#+h::
    SoundSet, 1, Microphone, mute, 2
return

#!v::
#+v::
    WinActivate, ^.*( - Microsoft Visual Studio).*$
return

;================================================================================    
; ================================== MERCK MANUALS =============================
; ================================================================================ 

#+m::
    ; WinActivate, ^(Merck\.Manuals).*( - Microsoft Visual Studio).*$
    WinActivate, ^.*(mysettings).*(Visual Studio Code)$
return

#+f::
    WinActivate, ^(.*)(ffs_gui).*$
return

; ================================================================================ 
; ================================================================================ 
; ================================================================================ 

; #+q::
#+t::
; #+w::
    ; WinActivate, ^.*(Total Commander).*$
    WinActivate, ahk_exe TOTALCMD64.EXE
return

; #+a::
; #!s::
;    WinActivate, Slack
; return

#+o::
	; WinActivate, .*(dawid\.koruba@avanade\.com - Outlook).*$
    WinActivate, ahk_exe OUTLOOK.EXE
return


#+e::
	; WinActivate, .*(OneNote).*$
    WinActivate, ahk_exe ONENOTE.EXE
return

#!c::
#+c::
	WinActivate, ^.*(Google Chrome)$
return

; #+h::
;     WinActivate, ^.*(Google Hangouts).*$

; Visua Studio Code
#!i::
#+i::
	WinActivate, ^(Todoist).*$
return

; Visua Studio Code
#!d::
#+d::
	WinActivate, ^.*(Visual Studio Code)$
return

#!n::
#+n::
	WinActivate, ^.*(Notepad\+\+).*$
return

; Powershell / Command line tool
#+r::
	; WinActivate, ^PS::.*$
    WinActivate, ahk_exe ConEmu64.exe
return

+!?::

MsgBox, 
    (
        Shortcuts

================================
    Applications
    SHIFT + ALT + D

        a -> Teams
        b -> Chrome (Browser)
        c -> Command Line (ConEmu)
        d -> Dev Tools Chrome
        f -> Total Commander (Files)
        h -> Hangouts
        l -> Skype / Lync
        m -> Visual Studio Code
        n -> Notepad ++
        r -> Fiddler
        v -> Visual Studio 
        w -> Vim

================================
    Commands
    SHIFT + ALT + C

        f -> Flush DNS
    )
return

+!d::

INPUT, command, T2 L1

if (command = "a")
    WinActivate, ^.*(Microsoft Teams).*$
else if (command = "b")
	WinActivate, ^.*(Google Chrome)$
else if (command = "c")
    WinActivate, ahk_exe ConEmu64.exe
else if (command = "d")
    WinActivate, ^DevTools - .*$
else if (command = "e")
    WinActivate, ahk_exe ONENOTE.EXE
else if (command = "f")
    WinActivate, ahk_exe TOTALCMD64.EXE
else if (command = "g")
    WinActivate, ahk_exe mintty.exe
else if (command = "h")
    WinActivate, ^.*(Google Hangouts).*$
else if (command = "k")
    WinActivate, ^.*(Google Hangouts).*$
else if (command = "l")
    WinActivate, ahk_exe lync.exe
else if (command = "m")
    WinActivate, ^.*(mysettings).*(Visual Studio Code)$
else if (command = "n")
	WinActivate, ^.*(Notepad\+\+).*$
else if (command = "r")
    WinActivate, ahk_exe Fiddler.exe
else if (command = "v")
    WinActivate, ^.*( - Microsoft Visual Studio).*$
else if (command = "w")
    WinActivate, ^.*(- GVIM).*$
else if (command = "9")
    Run "https://9gag.com"

return 


+!c::

INPUT, command, T2 L2

if (command = "f"){
    MsgBox % RunWaitMany("
    (
        echo Flush DNS
        echo ipconfig `/flushdns 
        ipconfig `/flushdns 
        echo nbtstat -r 
        nbtstat -r 
        echo netsh int ip reset
        netsh int ip reset
        echo netsh winsock reset
        netsh winsock reset 
    )")
} else if (command = "a"){

}
return

+!f::
INPUT, command, T2 L2

if (command = "ia")
    gvim("C:\Windows\System32\inetsrv\Config\applicationHost.config")
else if (command = "hh")
    gvim("C:\Windows\System32\drivers\etc\hosts")
else if (command = "co"){
    gvim(Clipboard)
}
return

+!v::

INPUT, command, T2 L1

if (command = "e"){
    INPUT, command, T2 L1
    LastNLetters := SubStr(Clipboard, -1 * command)
    Send, %LastNLetters%
}
else if (command = "s"){
    INPUT, command, T2 L1
    FirstNLetters := SubStr(Clipboard, 1, command)
    Send, %FirstNLetters%
}

return

+!g::
INPUT, command, T2 L1
if (command="g"){
    Clipboard := CreateGUID()
}
else if (command="u"){
    Clipboard := CreateUUID()
}

return


+!i::

    INPUT, command, T2 L1
    Url:=CopyBrowserUrl()
    if (command="f"){
        firefox(Url)
    }
    else if (command="e"){
        Edge(Url)
    }
    else if (command="i"){
        IE(Url)
    }

return

#+a::
    WinActivate, ^.*(Microsoft Teams).*$
return

#+x::
   WinActivate, ^.*(xmind).*$
return

#+b::
#+z::
    WinActivate, ahk_exe mintty.exe
return



#Include %A_ScriptDir%\Common.ahk
#Include %A_ScriptDir%\Common.Web.ahk
#Include %A_ScriptDir%\Common.Files.ahk
#Include %A_ScriptDir%\slugify.ahk
#Include %A_ScriptDir%\ParseUrl.ahk
#Include %A_ScriptDir%\GuidUtils.ahk


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

^+c::
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
