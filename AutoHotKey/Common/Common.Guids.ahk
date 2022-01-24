; createuuid()
; {
;     varsetcapacity(puuid, 16, 0)
;     if !(dllcall("rpcrt4.dll\uuidcreate", "ptr", &puuid))
;         if !(dllcall("rpcrt4.dll\uuidtostring", "ptr", &puuid, "uint*", suuid))
;             return strget(suuid), dllcall("rpcrt4.dll\rpcstringfree", "uint*", suuid)
;     return ""
; }

; createguid()
; {
;     varsetcapacity(pguid, 16, 0)
;     if !(dllcall("ole32.dll\cocreateguid", "ptr", &pguid)) {
;         size := varsetcapacity(sguid, (38 << !!a_isunicode) + 1, 0)
;         if (dllcall("ole32.dll\stringfromguid2", "ptr", &pguid, "ptr", &sguid, "int", size))
;             return strget(&sguid)
;     }
;     return ""
; }