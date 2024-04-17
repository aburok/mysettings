#Include %A_ScriptDir%\Common\Common.Text.ahk
#Include %A_ScriptDir%\Common\Common.Web.ahk
#Include %A_ScriptDir%\Common\Common.Files.ahk
#Include %A_ScriptDir%\Common\Common.Guids.ahk
#Include %A_ScriptDir%\Common\Guid\GuidFormatter.ahk
#Include %A_ScriptDir%\Common\LoremIpsum.ahk

; TestAny(collection, predicate){
;     any := 0
;     For index, element in collection
;     {
;         if(%predicate%(element)){
;             any := any + 1
;         }
;     }
;     return any > 0
; }

RunOrActivate(WinTitle, Target) {	; RoA means "RunOrActivate"
    ; OutputDebug(WinTitle, Target)
    If WinExist( WinTitle ){
        WinActivate WinTitle
    }
    else{
        Run Target
    }
}

Explorer_GetWindow(hwnd := ""){
    hwnd := hwnd ? hwnd : WinExist("A")
    WinGetClass class, "ahk_id " . hwnd
    if (class="CabinetWClass" or class="ExploreWClass" or class="Progman") {
        ;  for window in ComObjCreate("Shell.Application").Windows {
        ;      if (window.hwnd==hwnd) {
        ;          return window
        ;      }
        ;  }
    }
}

KeyWaitAny(Options:="")
{
    ih := InputHook(Options)
    if !InStr(Options, "V")
        ih.VisibleNonText := false
    ih.KeyOpt("{All}", "E") ; End
    ih.Start()
    ih.Wait()
    return ih.EndKey ; Return the key name
}

; RunWaitOne(command) {
;     ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
;     shell := ComObject("WScript.Shell")
;     ; Execute a single command via cmd.exe
;     exec := shell.Exec(ComSpec " /C " command)
;     ; Read and return the command's output
;     return exec.StdOut.ReadAll()
; }

RunWaitMany(commands) {
    shell := ComObject("WScript.Shell")
    ; Open cmd.exe with echoing of commands disabled
    exec := shell.Exec(A_ComSpec " /Q /K echo off")
    ; Send the commands to execute, separated by newline
    exec.StdIn.WriteLine(commands "`nexit") ; Always exit at the end!
    ; Read and return the output of all commands
    return exec.StdOut.ReadAll()
}

;Reload script on Ctrl + S (Save)
~^s:: {
    ; IfWinActive, %A_ScriptName%
    If(WinActive( ".ahk"))
    {
        ; SplashTextOn,,,Updated script,
        ; Sleep, 1000
        ; SplashTextOff
        Reload
        ; Reload "C:\mysettings\AutohotKey\Autohotkey.ahk"
    }
}

Log(formatText, params){
    CurrentDateTime := FormatTime( "yyyy-MM-dd HH:mm:ss")
    text:= CurrentDateTime . " - " . Format(formatText . "`n", params*)
    ; FileAppend(text , "C:\autohotkey.log")
}
