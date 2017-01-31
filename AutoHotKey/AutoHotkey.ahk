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

DropBoxDir := "C:\Dropbox"
ToolsDir := DropBoxDir . "\Tools"

#IfWinActive ahk_class CabinetWClass
    F1::
        selected_file := Explorer_GetSelection()
        Path := ToolsDir . "\vim73-zlib-win32\gvim.exe"
        command := Path . " " . selected_file
        Run , %command%
        return
#IfWinActive

#+a::
Run "..\..\window-layout\window-layout.ahk"
Run autohotkey.exe "..\..\shortcut-assistant\shortcut-assistant.ahk"
SetWorkingDir, "."
return

#+c::
Title := GetWorkingDirectory()
prompt := "prompt=$p$_%username%@%computername%:$g"
command := "cd /d " . Title . " & " . prompt
Run, cmd.exe /k %command%
return

#+e::
if (FileExist(clipboard) == "D"){
    explorer := "explorer /select," clipboard
    Run, %explorer%
    return
}
Run explorer.exe %userprofile%
return


#+h::RunOrActivate("ahk_class Chrome_WidgetWin_1", "chrome.exe")

#+i::Run gvim c:\settings.txt

#+o::
RunOrActivate("ahk_class rctrl_renwnd32", "outlook.exe")
return

#PgUp::Send {Volume_Up 1}
#PgDn::Send {Volume_Down 1}

;#n::

;return


; Power Shell command line
^#p::
    workingDir :=  " -command "" cd '" . GetWorkingDirectory() . "' """
    params := " -ExecutionPolicy unrestricted -noexit " . workingDir
    command = powershell.exe %params%
    Run , %command%
return


#+q:: Run ToolsDir . "\LINQPad4\LINQPad.exe"


!#v::
    workingDir := GetWorkingDirectory()
    params := " -c ""cd " . workingDir . " "" " ;"-S Session.vim "
    RunOrActivate("ahk_exe gvim.exe", "C:\Dropbox\Tools\vim73-zlib-win32\gvim.exe")
return

!#s::
    WinActivate, Slack
return

!#n::
	WinActivate, ahk_exe ONENOTE.exe
return


#!t::Run "C:\Program Files (x86)\Microsoft VS Code\code.exe" C:\Dropbox\mysettings\

#+x::RunOrActivate("", ToolsDir . "\ProcessExplorer\procexp.exe")

#+n::RunOrActivate("", ToolsDir . "\ProcessExplorer\procexp.exe")

#+^s::RunOrActivate("Slack - The Cogworks", "C:\Users\Dawid\AppData\Local\slack\Update.exe --processStart slack.exe")


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

Explorer_GetSelection(hwnd="") {
    window := Explorer_GetWindow(whnd)
    if(window) {
        sel := window.Document.SelectedItems
    }
	for item in sel {
        ToReturn .= item.path "`n"
    }
	return Trim(ToReturn,"`n")
}

Explorer_GetDirectory(hwnd = ""){
    window := Explorer_GetWindow(whnd)
    if(window) {
        location := window.LocationURL
        return UnEscape_Chars(location)
    }
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
        for window in ComObjCreate("Shell.Application").Windows {
            if (window.hwnd==hwnd) {
                return window
            }
        }
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

GetWorkingDirectory(){
    dir := Explorer_GetDirectory()
    If(dir)
        return dir
    return USERPROFILE
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

