ParseUrl(url) {
    urlObj := Object()
    
    If (p := InStr(url,"://")) {
        urlObj.protocol := SubStr(url, 1, p-1)
        url := SubStr(url, p+3)
    }

    If (p := InStr(url,"/")) {
        url2 := SubStr(url, p+1)
        url := SubStr(url, 1, p-1)
        Loop, parse, url2, /
        {
            If (A_LoopField != "")
            urlObj.subDir[A_Index] := A_LoopField
        }
    }

    If (p := InStr(url,"@")) {
        url2 := SubStr(url, 1, p-1)
        url := SubStr(url, p+1)
        p := InStr(url2,":")
        urlObj.ftpUser := SubStr(url2, 1, p-1)
        urlObj.ftpPass := SubStr(url2, p+1)
    }

    If (p := InStr(url,":")) {
        urlObj.port := SubStr(url, p+1)
        url := SubStr(url, 1, p-1)
    }

    Loop, parse, url, .
    {
        url3 := A_LoopField . "." . url3
        count := A_Index
    }

    url3 := SubStr(url3, 1, StrLen(url3)-1)
    p := InStr(url3,".")
    urlObj.domainExt := SubStr(url3, 1, p-1)

    url3 := SubStr(url3, p+1)
    p := InStr(url3,".")

    urlObj.domainName := SubStr(url3, 1, p-1)

    url := SubStr(url3, StrLen(urlObj.domainExt)+StrLen(urlObj.domainName)-1)

    If (count > 1) {
        Loop, parse, url, .
        urlObj.subDomainDir[A_Index] := A_LoopField
    }

    Return % urlObj
}