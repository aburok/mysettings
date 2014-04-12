#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto timers, usefull when debugging  ;
; turn off or set high to save cpu     ;
; when debug is done                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetTimer,AutoReloadScript,1000
; Origins of this script are in  this post :
; http://www.autohotkey.com/board/topic/5793-multiple-virtual-desktops


; ***** initialization *****
#WinActivateForce

SetBatchLines, -1         ; maximize script speed!
SetWinDelay, -1
OnExit, CleanUp           ; clean up in case of error (otherwise some windows will get lost)

numDesktops := 4          ; maximum number of desktops
curDesktop := 1           ; index number of current desktop
USE_PAUSE = 1000          ; Tray Tip Pause Length
lock = 0                  ; lock to prevent running both hotkeys at same time
ToolTipX = -1000          ; Tool Tip X position
ToolTipY = -1000          ; Tool Tip Y position

; ***** hotkeys *****
#v::
   AlwaysShowWindow()
return

#1::
   if(lock = 0)
   {
      lock = 1
      SwitchToDesktop(1)
   }
return

#2::
   if(lock = 0)
   {
      lock = 1
      SwitchToDesktop(2)
   }
return

#3::
   if(lock = 0)
   {
      lock = 1
      SwitchToDesktop(3)
   }
return

#4::
   if(lock = 0)
   {
      lock = 1
      SwitchToDesktop(4)
   }
return

^!1::
   if(lock = 0)
   {
      lock = 1
      SendActiveToDesktop(1)
   }
return

^!2::
   if(lock = 0)
   {
      lock = 1
      SendActiveToDesktop(2)
   }
return

^!3::
   if(lock = 0)
   {
      lock = 1
      SendActiveToDesktop(3)
   }
return

^!4::
   if(lock = 0)
   {
      lock = 1
      SendActiveToDesktop(4)
   }
return



#0::goto, cleanup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AutoScriptReload/Suspend ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AutoReloadScript:
   FileGetAttrib,attribs,%A_ScriptFullPath%
   IfInString,attribs,A
   {
      FileSetAttrib,-A,%A_ScriptFullPath%
      ToolTip, %A_ScriptName% updated AutoHotkey script, %ToolTipX%, %ToolTipY%
      SetTimer, AutoReloadScriptToolTip, 2000
   }
return
AutoReloadScriptToolTip:
    SetTimer, AutoReloadScriptToolTip, Off
    ToolTip
    Reload
return

; ***** functions *****

; switch to the desktop with the given index number
SwitchToDesktop(newDesktop)
{
   global

   WinGetActiveTitle, curWin

   sleep, 200

   ; Removes the chance of getting Start Menu Shadow Frozen on Screen
   if(curWin = "")
      WinActivate, Program Manager

   ; Removes the chance of getting Tray or Tooltip shadows frozen on screen
   ToolTip
   TrayTip
   WinClose, ahk_class SysShadow

   sleep, 200

   if (curDesktop <> newDesktop)
   {
      GetCurrentWindows(curDesktop)
      ShowHideWindows(curDesktop, false)
      ShowHideWindows(newDesktop, true)
      activate_window := % active_id%newDesktop%
      WinActivate, ahk_id %activate_window%
      ToolTip,  Switching to desktop %newDesktop%, %ToolTipX%, %ToolTipY%
      curDesktop := newDesktop
   }

   SetTimer, RemoveToolTip, %USE_PAUSE%
   sleep, 1000
   lock = 0

   return
}

; sends the given window from the current desktop to the given desktop
SendToDesktop(windowID, newDesktop)
{
   global
   if (curDesktop <> newDesktop)
   {
   RemoveWindowID(curDesktop, windowID)

   ; add window to destination desktop
   windows%newDesktop% += 1
   i := windows%newDesktop%

   windows%newDesktop%%i% := windowID

   WinHide, ahk_id %windowID%
   ToolTip, Window sent to desktop %newDesktop%, %ToolTipX%, %ToolTipY%
   Send, {ALT DOWN}{TAB}{ALT UP}   ; activate the right window
   }

   SetTimer, RemoveToolTip, %USE_PAUSE%
}

; sends the currently active window to the given desktop
SendActiveToDesktop(newDesktop)
{

   global

   WinGet, id, ID, A

   WinGetActiveTitle, curWin

   sleep, 200

   ; If Window Does not have a title, do not send it
   if( (curWin = "") || (curWin = "Program Manager"))
   {
      lock = 0
      sleep, 1000
      return
   }

   SendToDesktop(id, newDesktop)
   sleep, 1000
   lock = 0
}

; removes the given window id from the desktop <desktopIdx>
RemoveWindowID(desktopIdx, ID)
{
   global
   Loop, % windows%desktopIdx%
   {
      if (windows%desktopIdx%%A_Index% = ID)
      {
         windows%desktopIdx%%A_Index%=      ;Emiel: just empty the array element, array will be emptied by next switch anyway
         Break
      }
   }
}

; this builds a list of all currently visible windows in stores it in desktop <index>
GetCurrentWindows(index)
{
   global
   WinGet, active_id%index%, ID, A                      ; get the current active window
   emptyString =
   StringSplit, windows%index%, emptyString             ; delete the entire windows_index_ array
   WinGet, windows%index%, List,,, Program Manager      ; get list of all visible windows

   ; remove windows which we want to see on all virtual desktops
   Loop, % windows%index%
   {
      id := % windows%index%%A_Index%
      WinGetClass, windowClass, ahk_id %id%
      if windowClass = Shell_TrayWnd     ; remove task bar window id
           windows%index%%A_Index%=      ; just empty the array element, array will be emptied by next switch anyway
      if windowClass = #32770            ; we also want multimontaskbar on all virtual desktops
           windows%index%%A_Index%=      ; just empty the array element, array will be emptied by next switch anyway
      if windowClass = cygwin/x X rl-xosview-XOsview-0   ; xosviews e.d.
           windows%index%%A_Index%=
      if windowClass = cygwin/x X rl-xosview-XOsview-1   ; xosviews e.d.
           windows%index%%A_Index%=
      if windowClass = MozillaUIWindowClass              ; Mozilla thunderbird
      {
        WinGet, ExStyle, ExStyle, ahk_id %id%
          if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
           windows%index%%A_Index%=
      }
      if alwaysShow%id% = 1
           windows%index%%A_Index%=
   }
}

; if show=true then shows windows of desktop %index%, otherwise hides them
ShowHideWindows(index, show)
{
   global

   Loop, % windows%index%
   {
      id := % windows%index%%A_Index%
      if show
         WinShow, ahk_id %id%
      else
         WinHide, ahk_id %id%
   }
}

AlwaysShowWindow()
{
    global
    WinGet, activeWindow, ID, A
    If alwaysShow%activeWindow%
    {
       alwaysShow%activeWindow%=
       ToolTipMessage := "Active window will no longer be shown on all desktops"
    }
    else
    {
       alwaysShow%activeWindow% := 1
       ToolTipMessage := "Active window will be on all desktops"
    }
    ToolTip, %ToolTipMessage%, %ToolTipX%, %ToolTipY%
    SetTimer, RemoveToolTip, %USE_PAUSE%
}

; show all windows from all desktops on exit
CleanUp:
Loop, %numDesktops%
   ShowHideWindows(A_Index, true)
ExitApp

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
