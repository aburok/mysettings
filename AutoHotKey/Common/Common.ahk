
RunOrActivate(WinTitle, Target) {	; RoA means "RunOrActivate"
    OutputDebug, %WinTitle% %Target%
    If WinExist( WinTitle )
        WinActivate, %WinTitle%
    else
        Run, %Target%
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


RunWaitOne(command) {
    ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
    shell := ComObjCreate("WScript.Shell")
    ; Execute a single command via cmd.exe
    exec := shell.Exec(ComSpec " /C " command)
    ; Read and return the command's output
    return exec.StdOut.ReadAll()
}

RunWaitMany(commands) {
    shell := ComObjCreate("WScript.Shell")
    ; Open cmd.exe with echoing of commands disabled
    exec := shell.Exec(ComSpec " /Q /K echo off")
    ; Send the commands to execute, separated by newline
    exec.StdIn.WriteLine(commands "`nexit")  ; Always exit at the end!
    ; Read and return the output of all commands
    return exec.StdOut.ReadAll()
}



;Reload script on Ctrl + S (Save)
~^s::
; IfWinActive, %A_ScriptName%
IfWinActive, .ahk
{
    SplashTextOn,,,Updated script,
    Sleep, 1000
    SplashTextOff
    Reload
    ; Reload "C:\mysettings\AutohotKey\Autohotkey.ahk"
}
return