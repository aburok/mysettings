#IfWinActive ahk_class classFoxitReader
    j::Down
    k::Up
    d::PgDn
    u::PgUp
    +n::^PgDn
#IfWinActive

;Reload script on Ctrl + S (Save)
~^s::
IfWinActive, %A_ScriptName%
{
    SplashTextOn,,,Updated script,
    Sleep, 200
    SplashTextOff
    Reload
}
return
