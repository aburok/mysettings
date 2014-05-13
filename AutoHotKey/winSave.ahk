;**************************************
;** store window sizes & positions
;
;   usage:
;      to save window sizes & positions, call "WinSave.ahk"
;      to restore window sizes & positions, call "WinRestore.ahk"
;
;   incorporates code from "expose.ahk" by "keyboardfreak"
;      http://www.autohotkey.com/forum/topic1090.html
;
; @version 1.0 cranky 20-Mar-2010; tested on Win XP SP2
;**************************************

#SingleInstance force

;SetTitleMatchMode:
;  1 = starts with
;  2 = contains
;  3 = exact
SetTitleMatchMode, 2

; global variables
NumWindows = 0
active_window = 0

; global constants
spaces  := "                 "
gDebug = 0 ; set to 1 to enable debug output (DebugView etc)
movetime = 700 ; time for a window to resize / minimize / maximize

;**********************************
;** store window sizes & positions;
;   shink to fit a small screen
;**********************************

If gDebug
{
	OutputDebug, **** winsave.ahk ****

	; format a header for debug output,
	; with fixed-width columns:
	StringLeft, padding, spaces, (12 - StrLen("IDX"))
	msg := "IDX" . padding . A_tab . "| "

	StringLeft, padding, spaces, (8 - StrLen("MinMax"))
	msg := msg . "MinMax" . padding . A_tab . "| "

	StringLeft, padding, spaces, (8 - StrLen("XPOS"))
	msg := msg . padding . "XPOS" . ","
	StringLeft, padding, spaces, (8 - StrLen("YPOS"))
	msg := msg . padding . "YPOS" . A_tab . "| "

	StringLeft, padding, spaces, (8 - StrLen("WIDTH"))
	msg := msg . padding . "WIDTH" . ","
	StringLeft, padding, spaces, (8 - StrLen("HEIGHT"))
	msg := msg . padding . "HEIGHT" . A_tab . "| "

	msg := msg . "TITLE"

	OutputDebug, %msg%
}
Else
{
	BlockInput, On
}

datafile = %A_Temp%\$winsave$.tmp
If FileExist(datafile)
	FileDelete, %datafile%

msg := "# temp file for WinSave.ahk and WinRestore.ahk" . Chr(13) . Chr(10)
FileAppend, %msg%, %datafile%

;** enumerate all windows with titles:
;
WinGet, IDs, List, , , Program Manager
Loop, %IDs%
{
	StringTrimRight, id, IDs%a_index%, 0
	WinGetTitle, title, ahk_id %id%

	; don't add windows with empty titles
	If title =
		Continue

	numwindows += 1

	; store the index of the active window
	IfWinActive, ahk_id %id%
		active_window = %id%

	WinGet, IsMinMax, MinMax, ahk_id %id%
	If IsMinMax <> 0
	{
		WinRestore, ahk_id %id%
		Sleep, %movetime%
	}

	WinGetPos, x, y, wid, hgt, ahk_id %id%

	If gDebug
	{
		; format a line for debug output,
		; with fixed-width columns:
		StringLeft, padding, spaces, (12 - StrLen(id))
		msg := id . padding . A_tab . "| "

		StringLeft, padding, spaces, (8 - StrLen(IsMinMax))
		msg := msg . IsMinMax . padding . A_tab . "| "

		StringLeft, padding, spaces, (8 - StrLen(x))
		msg := msg . padding . x . ","
		StringLeft, padding, spaces, (8 - StrLen(y))
		msg := msg . padding . y . A_tab . "| "

		StringLeft, padding, spaces, (8 - StrLen(wid))
		msg := msg . padding . wid . ","
		StringLeft, padding, spaces, (8 - StrLen(hgt))
		msg := msg . padding . hgt . A_tab . "| "

		msg := msg . title

		OutputDebug,  %msg%
	}

	; store window id, position & size as a formatted string:
	fields = %id%#%IsMinMax%#%x%#%y%#%wid%#%hgt%

	fields := fields . Chr(13) . Chr(10)
	FileAppend, %fields%, %datafile%

;	; (TEST) shrink the window
;	WinMove, ahk_id %id%, , 0, 0, 500, 400
;	Sleep, %movetime%

	If (IsMinMax < 0)
	{
		WinMinimize, ahk_id %id%
		Sleep, %movetime%
	}
	Else If (IsMinMax > 0)
	{
		WinMaximize, ahk_id %id%
		Sleep, %movetime%
	}
}

If active_window <> 0
	WinActivate, ahk_id %active_window%

BlockInput, Off
Exit ;
