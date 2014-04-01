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

#a:: Run "..\..\Tools\WinSplit Revolution\WinSplit.exe"

#q:: Run "..\..\Tools\LINQPad4\LINQPad.exe"

#n::Run "C:\Windows\System32\SnippingTool.exe"

#v::
path3 = %PROGRAMFILES%\vim\vim74\gvim.exe
path1 = C:\Program Files (x86)\vim\Vim74\gvim.exe
path2 = %PROGRAMFILES%\Vim73\vim73\gvim.exe
gvimPath := path1 . "," . path2 . "," . path3

; Get directory of selected Explorer window to set Gvim Path
workingDir := GetWorkingDirectory()
params := " -c ""cd " . workingDir . " "" "
TryOpenApplicationFromList(gvimPath, "Gvim.exe", params)
return


#t::Run "..\..\Tools\TotalCommander\totalcmd\Totalcmd.exe"

#c::
Title := GetWorkingDirectory()
prompt := "prompt=$p$_%username%@%computername%:$g"
command := "cd /d " . Title . " & " . prompt
Run, cmd.exe /k %command%
return


; Power Shell command line
#p::
^!p::
    workingDir :=  " -command "" cd '" . GetWorkingDirectory() . "' """
    params := " -ExecutionPolicy unrestricted -noexit " . workingDir
    command = %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe %params%
    Run , %command%
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


CAPSLOCK::Ctrl

; -----------------------
; FUNCTIONS
; -----------------------
RunOrActivate(WinTitle, Target) {	; RoA means "RunOrActivate"
    IfWinExist, %WinTitle%
        WinActivate, %WinTitle%
    else
        Run, %Target%
}

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

ReturnFirstExistingFile(FileList){
    Loop , parse, List, `,
    {
        isFile := FileExist(A_LoopField)
        if (isFile){
            return %A_LoopField%
        }
    }
    return
}

TryOpenApplicationFromList(List, LastChance, params = ""){
    existingFile := ReturnFirstExistingFile(List)
    if (existingFile)
        Run, %existingFile% %params%
    ; Last chance
    Run, %LastChance% %params%
}

GetWorkingDirectory(){
    dir := GetDirFromWindowTitle()
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
