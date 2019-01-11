; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; # - Win ke:
; ^ - Ctrl key
; ! - Alt key
; + - Shift key

; ---------------------
; WINDOWS KEY BINDINGS
; ---------------------

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

#+m::
    ; WinActivate, ^(Merck\.Manuals).*( - Microsoft Visual Studio).*$
    WinActivate, ^.*(mysettings).*(Visual Studio Code)$
return

#+f::
    WinActivate, ^(.*)(ffs_gui).*$
return


#+t::
    WinActivate, ahk_exe TOTALCMD64.EXE
return


#+o::
    WinActivate, ahk_exe OUTLOOK.EXE
return


#+e::
    WinActivate, ahk_exe ONENOTE.EXE
return

#!c::
#+c::
	WinActivate, ^.*(Google Chrome)$
return

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

if ("a" = command)
    WinActivate, ^.*(Microsoft Teams).*$
else if ("b" = command)
	WinActivate, ^.*(Google Chrome)$
else if ("c" = command)
    WinActivate, ahk_exe ConEmu64.exe
else if ("d" = command)
    WinActivate, ^DevTools - .*$
else if ("e" = command)
    WinActivate, ahk_exe ONENOTE.EXE
else if ("f" = command)
    WinActivate, ahk_exe TOTALCMD64.EXE
else if ("g" = command)
    WinActivate, ahk_exe mintty.exe
else if ("h" = command)
    WinActivate, ^.*(Google Hangouts).*$
else if ("k" = command)
    WinActivate, ^.*(Google Hangouts).*$
else if ("l" = command)
    WinActivate, ahk_exe lync.exe
else if ("m" = command)
    WinActivate, ^.*(mysettings).*(Visual Studio Code)$
else if ("n" = command)
	WinActivate, ^.*(Notepad\+\+).*$
else if ("r" = command)
    WinActivate, ahk_exe Fiddler.exe
else if ("v" = command)
    WinActivate, ^.*( - Microsoft Visual Studio).*$
else if ("w" = command)
    WinActivate, ^.*(- GVIM).*$
else if ("9" = command)
    Run "https://9gag.com"

return


+!c::

INPUT, command, T2 L2

if ("f" = command){
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

return


+!i::

    INPUT, command, T2 L1
    Url:=CopyBrowserUrl()
    if ("f" = command){
        firefox(Url)
    }
    else if ("e" = command){
        Edge(Url)
    }
    else if ("i" = command){
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

; The FileName parameter may optionally be preceded by *i and a single space,
;   which causes the program to ignore any failure to load the included file. 
; For example: #Include *i SpecialOptions.ahk. 
; This option should be used only when the included file's contents are not essential to the main script's operation.
#Include *i %A_ScriptDir%\..\..\_Merck\Merck.ahk


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

!+q::
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return


#IfWinActive, ahk_exe  TOTALCMD64.EXE
{
    !d::
    Send {Home}
    Send {Shift Down}
    Sleep 10
    Send {F6 Down}
    Sleep 10
    Send {F6 Up}{Shift Up}
    return 
}
#IfWinActive

#IfWinActive, ahk_exe  chrome.exe
{
    !+g::
    oldClipboard:=Clipboard
    url:= CopyBrowserUrl()
    Clipboard := RegExReplace(url, "www\.youtube", "www.genyoutube")
    Send ^t
    sleep 10
    Send ^v
    Sleep 10
    Send {Enter}
    sleep 10
    Clipboard:=oldClipboard
    return 
}
#IfWinActive