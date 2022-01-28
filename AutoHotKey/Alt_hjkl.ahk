; ===============
__help := ""

keyMap := Map()
keyMap["h"] := "Left"
__help := __help . "Left        -> LALT + H `n"
keyMap["j"] := "Down"
__help := __help . "Down        -> LALT + J `n"
keyMap["k"] := "Up"
__help := __help . "Up          -> LALT + K `n"
keyMap["l"] := "Right"
__help := __help . "Right       -> LALT + L `n"
keyMap[","] := "PgUp"
__help := __help . "Page Up     -> LALT + , `n"
keyMap["."] := "PgDn"
__help := __help . "Page Down   -> LALT + . `n"
keyMap[";"] := "Home"
__help := __help . "Home        -> LALT + (`; - SEMICOLON) `n"
keyMap["'"] := "End"
__help := __help . "End         -> LALT + (' - SINGLE QUOTE) `n"
keyMap["d"] := "Del"
__help := __help . "Del         -> LALT + D `n"
keyMap["x"] := "BackSpace"
__help := __help . "BackSpace   -> LALT + X `n"

<!/:: {
    MsgBox(__help, "Help","iconi T30")
}

*<!h::
*<!j::
*<!k::
*<!l::
*<!,::
*<!.::
*<!d::
*<!x::
*<!;::
*<!':: {
    MsgBox(GetKeyState("CapsLock", "T"))
    global keyMap
    PressedKey := SubStr(A_ThisHotkey, 4, 1)
    if(!keyMap.Has(PressedKey)){
        return
    }
    ThisHotKey := keyMap[PressedKey]
    CtrlPressed := ((GetKeyState("Control", "D") or GetKeyState("CapsLock", "D")) ? "^" : "")
    ShiftPressed := (GetKeyState("Shift", "D") ? "+" : "")
    KeyInput := ShiftPressed . CtrlPressed . "{" . ThisHotKey . "}"
    ; MsgBox(KeyInput)
    Send(KeyInput)
}

; Media 
<!\::Media_Play_Pause
__help := __help . "`n LALT + \ `t`t`t -> MEDIA PLAYPPAUSE"

<!]::Media_Next
__help := __help . "`n LALT + SHIFT + ] `t`t`t -> MEDIA NEXT"

+<!]::Media_Prev
__help := __help . "`n LALT + ] `t`t`t -> MEDIA PREVIOUS"

<!F1::Volume_Mute
__help := __help . "`n LALT + F1 `t`t -> VOLUME MUTE"
<!0::Volume_Mute
__help := __help . "`n LALT + 0 `t`t -> VOLUME MUTE"
<!MButton::Volume_Mute
__help := __help . "`n LALT + 0 `t`t -> VOLUME MUTE"

<!F2::Volume_Down
__help := __help . "`n LALT + F2 `t`t -> VOLUME DOWN"
<![::Volume_Down
    __help := __help . "`n LALT + [ `t`t`t -> VOLUME DOWN"

<!WheelDown::Volume_Down
__help := __help . "`n LALT + WHEEL DOWN `t`t -> VOLUME DOWN"

<!F3::Volume_Up
__help := __help . "`n LALT + F3 `t`t -> VOLUME UP"
+<![::Volume_Up
__help := __help . "`n LALT + SHIFT + [ `t`t -> VOLUME UP"
<!WheelUp::Volume_Up
__help := __help . "`n LALT + WHEEL UP `t`t -> VOLUME UP"
