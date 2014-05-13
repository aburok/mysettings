
;
; expose - a naive implementation of Apple's Expose feature
;
;
; When activated all the visible windows are tiled on the
; screen. A window can be selected with the cursor keys and
; enter. The window selection can be cancelled with escape.
;
; When a window is selected the size and positon of all
; windows is restored and the selected window is activated.
;
; TODO:
;
;     - handling minimized windows
;       how do we know if a window is minimized?
;

; constants

square_numbers = 1,4,9,16,25,36,49,64,81,100
stringsplit, squares, square_numbers, `,

square_roots = 1,2,3,4,5,6,7,8,9,10
stringsplit, roots, square_roots, `,

; window data fields

field_id     = 1
field_x      = 2
field_y      = 3
field_width  = 4
field_height = 5

;----------------------------------------------------------------------
;
; I never use the right control key, that's why I chose it.
;
rcontrol::

; enumerate windows on the screen and store their information

numwindows = 0
active_window = 0

winget, ids, list, , , Program Manager
loop, %ids%
{
    stringtrimright, id, ids%a_index%, 0
    wingettitle, title, ahk_id %id%

    ; don't add windows with empty titles
    if title =
        continue

    numwindows += 1

    wingetpos, x, y, width, height, ahk_id %id%
    windows%numwindows% = %id%#%x%#%y%#%width%#%height%

    ; store the index of the initially active window
    ifwinactive, ahk_id %id%
        active_window = %numwindows%
}


if numwindows = 0
{
    msgbox, There are no windows on the screen.
    return
}

if numwindows = 1
{
    msgbox, This is the only window
    return
}

if active_window = 0
{
    msg = no active window found
    gosub, fatalerror
}


; find the smallest rectangle which can hold all
; the windows

loop, %squares0%
{
    stringtrimleft, square, squares%a_index%, 0
    stringtrimleft, root, roots%a_index%, 0

    if numwindows <= %square%
        break
}

; compute the number of rows and columns

columns = %root%
rows = 1
winnum = %root%

loop, %root%
{
    if winnum >= %numwindows%
        break

    rows += 1
    winnum += %root%
}

; calculate the width of columns and the height of rows

wingetpos, , , column_width, row_height, Program Manager

column_width /= %columns%
row_height /= %rows%

; tile the windows on the screen

x = 0
y = 0

column = 1

loop, %numwindows%
{
    stringtrimleft, windata, windows%a_index%, 0
    stringsplit, windata, windata,#
    stringtrimleft, id, windata%field_id%, 0

    winmove, ahk_id %id%, , %x%, %y%, %column_width%, %row_height%

    if column = %columns%
    {
        column = 1
        x = 0
        y += %row_height%
    }
    else
    {
        column += 1
        x += %column_width%
    }
}

; let the user select a window

row = 0
column = 0

loop
{
    input, input, L1, {enter}{esc}{up}{down}{left}{right}

    if ErrorLevel = EndKey:enter
        break

    if ErrorLevel = EndKey:escape
        break

    if ErrorLevel = EndKey:up
        if row = 0
            continue
        else
            row -=1

    if ErrorLevel = EndKey:down
    {
        row += 1
        gosub, calculatearrayindex

        if index = 0
        {
            row -= 1
            continue
        }
    }

    if ErrorLevel = EndKey:left
        if column = 0
            continue
        else
            column -=1

    if ErrorLevel = EndKey:right
    {
        column += 1
        gosub, calculatearrayindex

        if index = 0
        {
            column -= 1
            continue
        }
    }

    ; activate selected window
    gosub, calculatearrayindex

    ; index cannot be 0 here
    if index = 0
    {
        msg = index is zero
        gosub, fatalerror
    }

    stringtrimleft, windata, windows%index%, 0
    stringsplit, windata, windata,#
    stringtrimleft, id,  windata%field_id%, 0

    winactivate, ahk_id %id%
}

; restore dimensions of selected window first and
; then the others in the background
;
; if the user pressed escape active_window already
; contains the index of initially active window

if ErrorLevel = EndKey:enter
{
    active_window = %index%
}

index = %active_window%
gosub, restorewindow
winactivate, ahk_id %id%

; restore size of the other windows

loop, %numwindows%
{
    ; it's already restored
    if a_index = %active_window%
        continue

    index = %a_index%
    gosub, restorewindow
}

return

;----------------------------------------------------------------------
;
; Calculate index of current position in the window array
;
; Parameters:
;     row        - the row index (0- based)
;     column     - the column index (0- based)
;     numwindows - the number of windows
;
; Returns:
;     index  - the calculated index or 0 if no valid index can be
;              calculated
;
calculatearrayindex:

if column = %columns%
{
    index = 0
    return
}

if row = %rows%
{
    index = 0
    return
}

index = %columns%
index *= %row%
index += %column%
index += 1   ; arrays are 1-based

if index > %numwindows%
{
    index = 0
    return
}

return

;----------------------------------------------------------------------
;
; Restore window size and position
;
; Parameters:
;     index  - the window index in the window array
;
restorewindow:

stringtrimleft, windata, windows%index%, 0
stringsplit, windata, windata,#

stringtrimleft, id,     windata%field_id%, 0
stringtrimleft, x,      windata%field_x%, 0
stringtrimleft, y,      windata%field_y%, 0
stringtrimleft, width,  windata%field_width%, 0
stringtrimleft, height, windata%field_height%, 0

winmove, ahk_id %id%, , %x%, %y%, %width%, %height%

return

;----------------------------------------------------------------------
;
; Displays an error message and terminates the script
;
; Parameters:
;     msg  - error message
;
fatalerror:
msgbox, Script error: %msg%
exit
