; Bindable ALT+Fn Window selector - josephusm
;
; Use Ctrl+Fn to bind the active window, and Alt+Fn to raise it later
;

Loop, 12
{
    id%A_Index% := 0
}
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

BindKey(key)
{
    ; Store the active window's ID

    WinGet, active_id, ID, A
    id%key% := active_id
    win_id := id%key%

    WinGetTitle, Title, ahk_id %win_id%

    ToolTip, %key% : %Title%
    SetTimer, RemoveToolTip, 3000

    return
}

UseBind(key)
{
    ; Use the stored window's ID to focus it
    ; if it still exists

    win_id := id%key%

    if WinExist("ahk_id" . win_id)
    {
        WinActivate, ahk_id %win_id%
        WinGetTitle, Title, ahk_id %win_id%

        ToolTip, %key% . %Title%
        SetTimer, RemoveToolTip, 500
    }
    else
    {
        ToolTip, %key%: No existing window bound
        SetTimer, RemoveToolTip, 1000
    }

    return
}

global help_showned := false
ShowHelp(){
    help := ""
    if(help_showned){
        return
    }

    help_showned := true
    Loop, 12
    {
        win_id := id%A_Index%
        WinGetTitle, Title, ahk_id %win_id%
        help := help . "F" . A_Index . " : " . Title . "`n"
    }
    ToolTip, %help%
    return
}

;!F12::ShowHelp()
~ALT::ShowHelp()
~ALT UP::
ToolTip
help_showned := false
return


^F1::BindKey(1)
!F1::UseBind(1)

^F2::BindKey(2)
!F2::UseBind(2)

^F3::BindKey(3)
!F3::UseBind(3)

; ^F4::BindKey(4)
; !F4::UseBind(4)

^F5::BindKey(5)
!F5::UseBind(5)

^F6::BindKey(6)
!F6::UseBind(6)

^F7::BindKey(7)
!F7::UseBind(7)

^F8::BindKey(8)
!F8::UseBind(8)

^F9::BindKey(9)
!F9::UseBind(9)

^F10::BindKey(10)
!F10::UseBind(10)

^F11::BindKey(11)
!F11::UseBind(11)

^F12::BindKey(12)
!F12::UseBind(12)


; AUTO RELOAD SCRIPT AFTER SAVE
~^s::
IfWinActive, %A_ScriptName%
{
    SplashTextOn,,,Updated script,
        Sleep, 200
            SplashTextOff
            Reload
}
return
