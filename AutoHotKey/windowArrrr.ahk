; This script use Ctrl + Win + [hjkl] keys to arrange windows
; each binding has setting of following window arrangments
; separeted by | sign
; Script will incrementally iterate over thos settings and
; change window position and size accordingly


; ---------------
; KEY BINDINGS
; ---------------

^#h::
Settings := "0, 0, 0.5, 1 | 0,0,0.5,0.5 | 0, 0.5, 0.5, 0.5 | 0, 0, 0.6666, 1"
LoopThroughSettings(Settings, "Left")
return

^#j::
Settings := "0, 0.5, 1, 0.5 | 0, 0.5, 0.5, 0.5 | 0.5, 0.5, 0.5, 0.5 "
LoopThroughSettings(Settings, "Bottom")
return

^#k::
Settings := "0, 0, 1, 0.5 | 0, 0, 0.5, 0.5 | 0.5, 0, 0.5, 0.5 "
LoopThroughSettings(Settings, "Top")
return

^#l::
Settings := "0.5, 0, 0.5, 1 | 0.5, 0, 0.5, 0.5 | 0.5, 0.5, 0.5, 0.5 | 0.3333, 0, 0.6666, 1 "
LoopThroughSettings(Settings, "Right")
return

^#q::SetWindowPosition("0, 0, 0.5, 0.5") ; Top Left Corner
^#w::SetWindowPosition("0, 0, 0.3333, 0.5") ; Top
^#e::SetWindowPosition("0.5, 0, 0.5, 0.5") ; Top Right Corner
^#z::SetWindowPosition("0, 0.5, 0.5, 0.5") ; Bottom Left Corner
^#c::SetWindowPosition("0.5, 0.5, 0.5, 0.5") ; Bottom Right Corner

+#h::Send {LWin down }{ Left down}
+#l::Send {LWin down}{ Right down}

^#u:: WinMaximize, A

^#d:: WinMinimize, A



; ---------------
; FUNCTIONS
; ---------------

SetWindowPosition(Setting){
    ParseSettings(Setting)
    PositionWindow()
}

LoopThroughSettings(Settings, Side) {

    CurrentMove := Side
    ResetIfCounterOverLimit(Settings)
    ResetIfDifferentWindow()

    setting := GetSettingOnIndex(Settings, Counter)
    ParseSettings(setting)

    PositionWindow()

    Counter += 1
}

global LastWindowTitle := ""
global LastMove := ""
global Counter := 1

global CurrentMove := ""

ResetIfCounterOverLimit(Settings){
    settingsCount := GetSettingOnIndex(Settings, 0)
    if (!Counter || Counter > settingsCount) {
        Counter := 1
    }
}

ResetIfDifferentWindow(){
    WinGetTitle, Title, A
    if( LastMove <> CurrentMove || LastWindowTitle <> Title){
        Counter := 1
        LastMove := CurrentMove
        LastWindowTitle := Title
    }
}

GetSettingOnIndex(Array, Index){
    StringSplit, Arrangment, Array, `|
    return Arrangment%Index%
}

global xScale := 0
global yScale := 0
global wScale := 0
global hScale := 0

ParseSettings(Array){
    StringSplit, Arrangment, Array, `,

    xScale := Arrangment1
    yScale := Arrangment2
    wScale := Arrangment3
    hScale := Arrangment4
}

global winCenterX := 0
global winCenterY := 0

GetWindowCenter() {
    WinGetPos, winX, winY, winW, winH, A
    ;MsgBox % "Window pos : " . winX . " " . winY
    winCenterX := winX + winW/2
    winCenterY := winY + winH/2
}

;MsgBox % "Monitor # : " . count

; TODO Add here support for many monitors
; -1900    0         1900+1680
; <--------0----------------->
; --------- --------- --------
; |       | |       | |      |
; |       | |       | |      |
; --------- --------- --------


PositionWindow(){
    GetWindowCenter()

    SysGet, primary, MonitorWorkArea
    SysGet, count, MonitorCount
    Loop, %count% {
        SysGet, m, MonitorWorkArea, %A_Index%

        if (WindowIsOnMonitor(mLeft, mRight)){
            MoveCurrentWindow(mLeft, mRight, mTop, mBottom)
        }
        ;MsgBox % " Top " . monitorTop . " right " . monitorRight . " Bottom " . monitorBottom . " Left " . monitorLeft . " Width " . monitorW . " Height " . monitorH
    }
}

WindowIsOnMonitor(mLeft, mRight){
    return mLeft <= winCenterX && winCenterX <= mRight
}

MoveCurrentWindow(left, right, top, bottom){
    monitorW := (right - left)
    monitorH := (bottom - top)

    x:= ( monitorW * xScale + left)
    y:= ( monitorH * yScale )
    w:= ( monitorW * wScale )
    h:= ( monitorH * hScale )

    WinRestore, A
    WinMove, A,, x, y, w, h
}

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
