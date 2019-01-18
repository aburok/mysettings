; https://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine
; Hotkey library 
Hotkey(hk, fun, arg) {
    Static funs := {}, args := {}
    funs[hk] := Func(fun), args[hk] := arg
    ;MsgBox, Hotkey %hk% %arg% %fun%
    Hotkey, %hk%, Hotkey_Handle
return

Hotkey_Handle:
    hkfunc := funs[A_ThisHotkey]
    hkargs := args[A_ThisHotkey]
    ;MsgBox, Launched Hotkey %A_ThisHotkey% %hkargs% %hkfunc%
    hkfunc.(hkargs)
return
}