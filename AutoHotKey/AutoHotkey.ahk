; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.


~^s::
IfWinActive, %A_ScriptName%
{
    SplashTextOn,,,Updated script,
        Sleep, 200
            SplashTextOff
            Reload
}
return


#z::Run www.autohotkey.comx

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

#a::
    Run "..\WinSplit Revolution\WinSplit.exe"
    return

#q::
    Run "..\LINQPad4\LINQPad.exe"
    return


#n::Run "C:\Windows\System32\SnippingTool.exe"

#v::Run "C:\Program Files (x86)\Vim73\vim73\gvim.exe"

#t::Run "..\TotalCommander\totalcmd\Totalcmd.exe"

#c::
ID := WinExist("A")
WinGetTitle, Title, ahk_ID %ID%
isFile := FileExist( Title)
;MsgBox % isFile

Title := Title && isFile ? Title : "%USERPROFILE%"
command := "cd /d " . Title . " & prompt=$p$_%username%@%computername%:$g"
;MsgBox % command
Run, cmd.exe /k %command%
return

;selectedpath := Explorer_GetCurrentPath()
;selectedpath := selectedpath ? selectedpath : "%userprofile%"
;command := "cd /d " . selectedpath . " & prompt=$p$_%username%@%computername%:$g"
;MsgBox % command
;Run, cmd.exe /k %command%
;return

;Explorer_GetCurrentPath(){
    ;ID := WinExist("A")
    ;WinGetClass, Class, ahk_id %ID%
    ;WinGetTitle, Title, ahk_ID %ID%
    ;MsgBox % Title
    ;ControlGetText, ePath, Edit1, ahk_id %ID%
    ;MsgBox % ePath
    ;return ePath
;}


; Power Shell command line
; #w::Run powershell.exe
#p::
^!p::
EnvGet, SystemRoot, SystemRoot
Run %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy unrestricted,
    return


#g::
    Send, ^c
    Run, http://www.google.com/search?q=%Clipboard%
    Return

#h::RunOrActivate("ahk_class Chrome_WidgetWin_1", "chrome.exe")

#o::RunOrActivate("ahk_class rctrl_renwnd32", "outlook.exe")

#i::Run gvim c:\settings.txt

#k::RunOrActivate("ahk_class #32770", "..\KeePass-1.26\KeePass.exe")

#x::RunOrActivate("", "..\ProcessExplorer\procexp.exe")

F1::
selected_file := Explorer_GetSelection()
Run gvim.exe "%selected_file%"
return

Explorer_GetSelection(hwnd="") {
	hwnd := hwnd ? hwnd : WinExist("A")
	WinGetClass class, ahk_id %hwnd%
	if (class="CabinetWClass" or class="ExploreWClass" or class="Progman")
		for window in ComObjCreate("Shell.Application").Windows
			if (window.hwnd==hwnd)
                sel := window.Document.SelectedItems
	for item in sel
	ToReturn .= item.path "`n"
	return Trim(ToReturn,"`n")
}

    ; ^w::WinKill

    ; CHECK .NET Version:
    ; dir %WINDIR%\Microsoft.Net\Framework\v*

    ; For some reason below doesn't work won close a window
    ; Search for users in Active directory
    ; %SystemRoot%\SYSTEM32\rundll32.exe dsquery,OpenQueryWindow

    ; IIS CONFIGURATION FILE
    ; C:\Windows\System32\inetsrv\config\applicationHost.config

    ; GRANT ACCESS TO FILE FOR USER
    ; ICACLS test.txt /grant "IIS AppPool\DefaultAppPool":F

    CAPSLOCK::Ctrl

    ;
    ; F12::
    ; EnvGet, pathset, Path
    ; MsgBox % pathset
    ; return


    ; -----------------------
    ; FUNCTIONS
    ; -----------------------
    RunOrActivate(WinTitle, Target) {	; RoA means "RunOrActivate"
        IfWinExist, %WinTitle%
            WinActivate, %WinTitle%
            else
                Run, %Target%
    }

