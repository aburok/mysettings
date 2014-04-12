**************************************
;** restore windows to original size & position
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
;** restore windows to original size & position
;**********************************

If gDebug
{
	OutputDebug, **** winrestore.ahk ****

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

; save active window
WinGet, IDs, List, , , Program Manager
Loop, %IDs%
{
	StringTrimRight, id, IDs%a_index%, 0
	; store the index of the active window
	IfWinActive, ahk_id %id%
		active_window = %id%
}

datafile = %A_Temp%\$winsave$.tmp
If FileExist(datafile)
{
	; continue
}
Else
{
	MsgBox, Error: cannot find %datafile%
	BlockInput, Off
	Exit
}

; restore window size & position
;
Loop, Read, %datafile%
{
	If gDebug
		OutputDebug, ---- A_LoopReadLine = %A_LoopReadLine%

	StringLeft, c1, A_LoopReadLine, 1
	If (c1 = "#")
		Continue ;

	StringSplit, windata, A_LoopReadLine,#

	StringTrimLeft, id,     windata1, 0
	StringTrimLeft, minmax, windata2, 0
	StringTrimLeft, x,      windata3, 0
	StringTrimLeft, y,      windata4, 0
	StringTrimLeft, wid,    windata5, 0
	StringTrimLeft, hgt,    windata6, 0

	If ErrorLevel
	{
		MsgBox, Error reading %datafile%
		BlockInput, Off
		Exit
	}

	If gDebug
	{
		; format a line for debug output,
		; with fixed-width columns:
		StringLeft, padding, spaces, (12 - StrLen(id))
		msg := id . padding . A_tab . "| "

		StringLeft, padding, spaces, (8 - StrLen(minmax))
		msg := msg . minmax . padding . A_tab . "| "

		StringLeft, padding, spaces, (8 - StrLen(x))
		msg := msg . padding . x . ","
		StringLeft, padding, spaces, (8 - StrLen(y))
		msg := msg . padding . y . A_tab . "| "

		StringLeft, padding, spaces, (8 - StrLen(wid))
		msg := msg . padding . wid . ","
		StringLeft, padding, spaces, (8 - StrLen(hgt))
		msg := msg . padding . hgt . A_tab . "| "

		msg := msg . "(title)"

		OutputDebug,  %msg%
	}

	WinGet, procID, PID, ahk_id %id%
	If procID = 0
	{
		; this window has been closed
		; since running WinSave; ignore:
		Continue ;
	}

	WinGet, IsMinMax, MinMax, ahk_id %id%
	If IsMinMax <> 0
	{
		WinRestore, ahk_id %id%
		Sleep, %movetime%
	}

	WinMove, ahk_id %id%, , %x%, %y%, %wid%, %hgt%
	Sleep, %movetime%

	If (minmax < 0)
	{
		WinMinimize, ahk_id %id%
		Sleep, %movetime%
	}
	Else If (minmax > 0)
	{
		WinMaximize, ahk_id %id%
		Sleep, %movetime%
	}
}

FileDelete, %datafile%

If active_window <> 0
	WinActivate, ahk_id %active_window%

BlockInput, Off
Exit ;
