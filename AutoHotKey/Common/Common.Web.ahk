resetIISAndPing(url2Ping){
    ; MsgBox, "Reseting IIS"
    ; MsgBox % RunWaitMany(
    ; ("
    ;     iisreset
    ;     iisreset
    ;     curl -D -s --url
    ; ")
    ;     .
    ;      %url2Ping%
    ;      .
    ; (   " -o $null
    ;     echo Page pinged successfully
    ; )
    ; )
}

resetAppPool(appPool){
    command := Format("Restart-WebAppPool -Name '{1}'", appPool)
    Run, powershell -NoExit -Command  %command%
}

changeAddress(to, fromList){
    LocalUrl:= CopyBrowserUrl()
    for index, element in fromList
    {
        LocalUrl := StrReplace(LocalUrl, element, to)
    }
    Chrome(LocalUrl)
}

CopyBrowserUrl(){
    Send ^l
    Sleep 100
    Send ^c
    Sleep 100
    return Clipboard
}

Chrome(pageUrl){
    Run, chrome.exe %pageUrl%
}

Firefox(pageUrl){
    Run, C:\Program Files\Mozilla Firefox\firefox.exe %pageUrl%
}

Edge(pageUrl){
    Run microsoft-edge:%pageUrl%
}


IE(pageUrl){
    Run, iexplore.exe %pageUrl%
}

FlushAll(){
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
}