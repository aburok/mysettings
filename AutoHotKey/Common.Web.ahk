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