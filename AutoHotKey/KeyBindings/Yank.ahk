
+!y::
INPUT, command, T10 L2

if("fn" = command){
    YankFileName()
}
return

YankFileName(){
    Sleep 200
    if(WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe TOTALCMD64.EXE")) {
        Send ^+y
    } else if (WinActive("ahk_exe code.exe")){
        Send ^+c
    }
    Sleep 100
    SplitPath, Clipboard, Clipboard, dir
}
; key: Y
