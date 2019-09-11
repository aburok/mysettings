
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

handleCopying2(){
    INPUT, command, T2 L1

    if ("c" = command){   ; Format Peer review request
        ; MsgBox, Foramt Peer review request
        ; BranchName:=GetBranchNameFromIssueTitle()

        ; IssueUrl:=CopyBrowserUrl()
        ; IssueNumber:=GetIssueNumber()
        ; IssueUrl:=Format("https://jiraisdp.avanade.com/projects/BAETB003/issues/BAETB003-{1}", IssueNumber)
        ; TfsBranchAddress:=Format("https://tfs13isdp.avanade.com/tfs13/TFS13M/MER00005-MerckManual/_git/MER00005-MerckManuals#version=GB{1}&_a=history", BranchName)
        ; FormatedString:=Format("PeerReview: {1} `n Jira Issue: {2} `n TFS url: {3} ", BranchName, IssueUrl,  TfsBranchAddress)
        ; MsgBox, %FormatedString%
        ; Clipboard:=FormatedString
    }
    else if ("r" = command){
        Sleep 500
        Send ^+y
        Sleep 100
        Clipboard := StrReplace(Clipboard, "C:\Projects\MER00005-MerckManuals\app\Merck.Manuals\", "")
    }
    else if ("n" = command){
        Sleep 500
        Send ^+y
        Sleep 100
        SplitPath, Clipboard, Clipboard, dir
    }
    else if ("p" = command){
        Sleep 500
        Send ^+y
        Sleep 100
        SplitPath, Clipboard, name, Clipboard
    }
    else if ("#" = command
    || "b" = command){
        ;Clipboard:=GetIssueNumber()
    }
}
