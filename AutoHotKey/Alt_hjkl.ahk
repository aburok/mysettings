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
; NOT USING WSAD vvvvvvv
; keyMap["w"] := "Up"
; __help := __help . "Up        -> LALT + W `n"
; keyMap["s"] := "Down"
; __help := __help . "Down        -> LALT + S `n"
; keyMap["a"] := "Left"
; __help := __help . "Left          -> LALT + A `n"
; ALT + SHIFT + D was in clonflict with OneNote insert date
; keyMap["d"] := "Right"
; __help := __help . "Right       -> LALT + D `n"
; NOT USING WSAD ^^^^^^^^
keyMap[","] := "PgUp"
__help := __help . "Page Up     -> LALT + , `n"
keyMap["."] := "PgDn"
__help := __help . "Page Down   -> LALT + . `n"
keyMap[";"] := "Home"
__help := __help . "Home        -> LALT + (`; - SEMICOLON) `n"
keyMap["'"] := "End"
__help := __help . "End         -> LALT + (' - SINGLE QUOTE) `n"
keyMap["x"] := "Delete"
__help := __help . "Delete   -> LALT + X `n"
keyMap["r"] := "Enter"
__help := __help . "Enter   -> LALT + R `n"
keyMap["e"] := "Escape"
__help := __help . "Escape   -> LALT + E `n"
keyMap["o"] := ["End", "Enter"]
__help := __help . "Escape   -> LALT + O `n"

+<!/:: {
    MsgBox(__help, "Help","iconi T30")
}

*<!h::
*<!j::
*<!k::
*<!l::
; *<!w::
; *<!s::
; *<!a::
; *<!d::
*<!,::
*<!.::
*<!x::
*<!r::
*<!e::
*<!;::
*<!':: {
    global keyMap
    PressedKey := SubStr(A_ThisHotkey, 4, 1)
    if(!keyMap.Has(PressedKey)){
        return
    }
    ThisHotKey := keyMap[PressedKey]
    CtrlPressed := ((GetKeyState("Control") or GetKeyState("CapsLock")) ? "^" : "")
    ShiftPressed := (GetKeyState("Shift") ? "+" : "")

    if (type(ThisHotKey) = "String"){
        KeyInput := ShiftPressed . CtrlPressed . "{" . ThisHotKey . "}"
        Send(KeyInput)
    }     
}

*<!+x::BackSpace

; Media 
<!\::Media_Play_Pause
__help := __help . "`n LALT + \ `t`t`t -> MEDIA PLAYPPAUSE"

; <!]::Media_Next
<!RButton::Media_Next
__help := __help . "`n LALT + SHIFT + ] `t`t`t -> MEDIA NEXT"

; +<!]::Media_Prev
+<!RButton::Media_Prev
__help := __help . "`n LALT + ] `t`t`t -> MEDIA PREVIOUS"

; <!F1::Volume_Mute
; __help := __help . "`n LALT + F1 `t`t -> VOLUME MUTE"
; <!0::Volume_Mute
; __help := __help . "`n LALT + 0 `t`t -> VOLUME MUTE"
; <!MButton::Volume_Mute
; __help := __help . "`n LALT + 0 `t`t -> VOLUME MUTE"

; <!F2::Volume_Down
; __help := __help . "`n LALT + F2 `t`t -> VOLUME DOWN"
<![::Volume_Down
    __help := __help . "`n LALT + [ `t`t`t -> VOLUME DOWN"

<!WheelDown::Volume_Down
__help := __help . "`n LALT + WHEEL DOWN `t`t -> VOLUME DOWN"

; <!F3::Volume_Up
; __help := __help . "`n LALT + F3 `t`t -> VOLUME UP"
<!]::Volume_Up
__help := __help . "`n LALT + SHIFT + [ `t`t -> VOLUME UP"
<!WheelUp::Volume_Up
__help := __help . "`n LALT + WHEEL UP `t`t -> VOLUME UP"
