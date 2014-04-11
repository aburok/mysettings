#/::
    helpFile := GetHelpFilePath()
    if (helpFile){
        GoSub, READHELP
        GoSub, CREATEGUI
        GoSub, FILLLIST
    }
    else
    {
        MsgBox, No Shortcuts defined for this application.
    }
return

GetHelpFilePath(){
    WinGetClass, windowClass, A
    WinGetTitle , Title, A
    folder := "shortcuts"
    if ( windowClass == "rctrl_renwnd32" )
    {
        return "shortcuts\outlook.help"
    }
    if ( windowClass == "Vim" )
    {
        return "shortcuts\vim.help"
    }
    if (windowClass == "ConsoleWindowClass")
    {
        IfInString, Title, PowerShell
        {
            return "shortcuts\powershell.help"
        }

        return "shortcuts\cmd.help"
    }
    if (windowClass == "CabinetWClass"){
        return "shortcuts\windows7.help"
    }
    if (windowClass == "XLMAIN"){
        return "shortcuts\excel.help"
    }
    IfInString, Title, Visual Studio
    {
        IfInString, windowClass, HwndWrapper
        {
            return "shortcuts\visualstudio.help"
        }
    }

    if (RegExMatch(windowClass, "Chrome.*") > 0 ){
        return "shortcuts\Chrome.help"
    }

    if (windowClass == "TTOTAL_CMD") {
        return "shortcuts\totalcmd.help"
    }

    return
}

CREATEGUI:
    Gui, Font, s10, Verdana
    Gui, Add, Text, , Search :
    Gui, Add, Edit, vFilterText gFILLLIST W1000
    Gui, Add, ListView, grid r20 W1000, Shortcut|Description
    LV_ModifyCol(1, 200)
        ;:Gui, Add, Text,, %A_LoopReadLine%
    Gui, Show, , Shortcuts for Outlook from %helpFile%.
return

READHELP:
    Loop, READ, %helpFile%
    {
        Line%A_Index% := A_LoopReadLine
        Line0 = %A_Index%
    }
return

FILLLIST:
    LV_Delete()
    GuiControlGet, FilterText
    StringReplace, filter, FilterText, %A_Space%, .*, All
    filter := "i)" . filter
    Loop, %Line0%
    {
        IF(IsLineForDisplay(Line%A_Index%, filter))
        {
            StringSplit, Array, Line%A_Index%, `;
            LV_Add("", Array1, Array2, A_Index)
        }
    }
return

IsLineForDisplay(line, filterText)
{
    isEmpty := RegExMatch(Line%A_Index%, "^$") > 0
    isComment := RegExMatch(Line%A_Index%, "^\s*//") > 0

    if(isEmpty || isComment)
    {
        return   false
    }

    isMatchingFilter := RegExMatch(Line%A_Index%, filterText) > 0
    return isMatchingFilter
}

GuiEscape:
; ExitApp - THIS WILL EXIT ALSO THE AHK PROGRAM, NOT ONLU GUI
IF ( FilterText == "")
    Gui, Destroy
ELSE
    ; If the filter box is not empty it will clear it on first Esc
    GuiControl,, FilterText
Return

OnExit:
    Gui, Destroy
return


~^s::
IfWinActive, %A_ScriptName%
{
    SplashTextOn,,,Updated script,
        Sleep, 200
            SplashTextOff
            Reload
}
return
