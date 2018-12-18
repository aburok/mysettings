; ===================================================      
; ===================================================      
; GLOBAL VARIABLES DOESN"T WORK WHEN FILE IS BEING INCLUDED
; THEY WORK WHEN THEY ARE DECLARED IN FUNCTION
; THIS FUNCTION MUST BE CALLED
;
InitializeGlobals(){
    global MerckRoot := "c:\Projects\MER00005-MerckManuals\"
    global MerckSrc := MerckRoot . "app\Merck.Manuals\"
    global MerckWebSrc := MerckSrc . "Merck.Manuals.Web\"
    global MerckWebDest := MerckSrc . "Merck.Manuals.DevSitecore\Website\"
    global MerckLogs := MerckSrc . "Merck.Manuals.DevSitecore\Data\logs\"
    global SolrLogs := "c:\solr-5.1.0\server\logs\"
}
; ===================================================      
; ===================================================      

; +!mt::
;     Run "test.merckmanuals.com"
; return
+!m::
InitializeGlobals()
; T2 to limit timout to 2 seconds 
; L3 to limit the input to 3 keys.
INPUT, command, T2 L2

if (command = "tt")
    Run "https://test.merckmanuals.com/home"
else if (command = "tp")
    Run "https://test.merckmanuals.com/professional"
else if (command = "tc")
    Run "https://testedit.merckmanuals.com/sitecore/admin/cache.aspx"
else if (command = "tj")
    Run "https://testedit.merckmanuals.com/sitecore/admin/jobs.aspx?refresh=2"
else if (command = "tb")
    Run "https://testedit.merckmanuals.com/sitecore/client/Applications/Publishing/Dashboard"
else if (command = "ts" || command = "te")
    Run "https://testedit.merckmanuals.com/sitecore/shell/Applications/Content`%20Editor.aspx?sc_bw=1"

; LOCAL Site
else if (command = "lc")
    Run "http://merckmanuals/sitecore/admin/cache.aspx"
else if (command = "le")
    Run "http://merckmanuals/sitecore/shell/Applications/Content`%20Editor.aspx?sc_bw=1"
else if (command = "lf")
    Run "http://merckmanuals/sitecore/admin/ShowConfig.aspx"
else if (command = "lh")
    Run "http://merckmanuals/home"
else if (command = "lj")
    Run "http://merckmanuals/sitecore/admin/jobs.aspx?refresh=2"
else if (command = "ll")
    Run "http://merckmanuals/"
else if (command = "lp")
    Run "http://merckmanuals/professional"
else if (command = "lv")
    Run "http://merckvetmanual/"
else if (command = "lr"){
    resetIIsAndPing("http://merckmanuals/home")
}

else if (command = "mi")
    Run "https://jiraisdp.avanade.com/projects/BAETB003/issues/?filter=myopenissues"
else if (command = "bb" )
    Run "https://teamcityisdp.avanade.com/overview.html"
else if (command = "bs" )
    Run "https://teamcityisdp.avanade.com/project.html?projectId=MER00005_SIT"
else if (command = "sc" )
    Run "https://tfs13isdp.avanade.com/tfs13/TFS13M/MER00005-MerckManual/_git/MER00005-MerckManuals"

; Before deploy - launch Publishing Dashboard and Jobs Viewr
else if (command = "bd" )  {
    Run "https://testedit.merckmanuals.com/sitecore/admin/jobs.aspx?refresh=2"
    Run "https://testedit.merckmanuals.com/sitecore/client/Applications/Publishing/Dashboard"
}

; else if (command = "dl")
; Convert Url from Clipboard to local one
else if (command = "al"){
    changeAddress("http://merckmanuals", ["https://test.merckmanuals.com", "https://uat.merckmanuals.com"])
}
else if (command = "at"){
    changeAddress("http://test.merckmanuals.com/", ["http://merckmanuals/", "https://uat.merckmanuals.com"] )
}
else if (command = "av"){
    changeAddress("https://test.merckvetmanual.com", "http://merckvetmanual")
}
else if (command = "au"){
    changeAddress("https://uat.merckmanuals.com", ["https://test.merckmanuals.com", "http://merckmanuals"])
}
else if (command = "yr"){
        Sleep 500
        Send ^+y
        Sleep 100
        Clipboard := StrReplace(Clipboard, "C:\Projects\MER00005-MerckManuals\app\Merck.Manuals\", "")
}
else if (command = "yn"){
        Sleep 500
        Send ^+y
        Sleep 100
        SplitPath, Clipboard, Clipboard, dir
}
else if (command = "yp"){
        Sleep 500
        Send ^+y
        Sleep 100
        SplitPath, Clipboard, name, Clipboard
}
else if (command = "dl"){
    FindLatestFileAndOpen(MerckLogs, "log.*.txt")
}
else if (command = "ds"){
    FindLatestFileAndOpen(SolrLogs, "solr.log")
}
else if (command = "dr"){
    FindLatestFileAndOpen(MerckLogs, "Search.log.*.txt")
}
else if (command = "dd"){
    Run, %MerckLogs%
}

return

FindLatestFileAndOpen(path, filePattern){
    global 

    Loop %path%\%filePattern%
    If ( A_LoopFileTimeModified >= Time )
        Time := A_LoopFileTimeModified, File := A_LoopFileLongPath

    IF (File = ""){
        MsgBox, Could not find any file in path %path%
    }
    else{
        MsgBox, File found %File%
        gvim(File)
    }
}


changeAddress(to, fromList){
    Send ^l
    Sleep 50
    Send ^c
    Sleep 50

    LocalUrl:= Clipboard
    for index, element in fromList
    {
        LocalUrl := StrReplace(LocalUrl, element, to)
    }
    Run % LocalUrl
}
    
#+^y::
    MsgBox, 68, Help, Visual Studio copy file info Win + Shift + Y: To copy :`n Full path -> p `n File name -> n, 2
return

#+y::
    INPUT, command, T2 L1

    if(command = "p"){
        Sleep 500
        Send ^+y

        Sleep 100
        FullFileName := Clipboard
        SplitPath, FullFileName, name, dir
        Clipboard := dir
    } else if (command = "n"){
        Sleep 500
        Send ^+y

        Sleep 100
        FullFileName := Clipboard
        SplitPath, FullFileName, name, dir
        Clipboard := name
    } else if (command = "r"){
        Sleep 500
        Send ^+y

        Sleep 100
        FullFileName := Clipboard
        relPath := SubStr(FullFileName, InStr(FullFileName, "Merck.Manuals.Web") + StrLen("Merck.Manuals.Web"))
        Clipboard := relPath
    }
return

#+^d::
    Sleep 500
    Send ^+y

    Sleep 100
    FullFileName := Clipboard
    SplitPath, FullFileName, name, dir
    FullFileName := StrReplace(FullFileName, "Merck.Manuals.Web", "Merck.Manuals.DevSitecore\Website")
    Run %FullFileName%
return

#^c::
    INPUT, command, T2 L1

    if(command = "#"){
        Send ^c
        sleep 100
        text := Clipboard
        MsgBox, %text%

        Clipboard := InsertCharacterAtStart(%text%, "#")

        sleep 100
        Send ^v
    }
return

InsertCharacterAtStart(vText, character){
    result := ""

    Loop, parse, vText, `n, `r
    {
        result := result . character . " " . %A_LoopField%
    }

    resultText := StringJoin(vText, "`n`r".character)
    MsgBox, resultText

    return resultText
}

StringJoin(array, delimiter = ";")
{
  Loop
    If Not %array%%A_Index% Or Not t .= (t ? delimiter : "") %array%%A_Index%
      Return t
}