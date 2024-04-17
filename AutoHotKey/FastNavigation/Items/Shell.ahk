class AppMenuLevel extends NavigationItem {
    __New(letter, description, winShortcut, titlePattern) {
        super.__New(letter, description)

        this.WinShortcut := winShortcut
        this.TitlePattern := titlePattern

        hasWinLetter := winShortcut && StrLen(winShortcut) > 0
        ; Hotkey this.WinShortcut, (ThisHotKey) => this.ActivateWindow()
        ; MsgBox, Try Bind %winLetter% %name% %hasWinLetter%
        if (hasWinLetter) {
            ; Custom hotkey register function
            ; Hotkey(this.WinShortcut, "ActivateWindow", this.TitlePattern)
        }
    }

    ActivateWindow() {
        exists := WinExist("" . this.TitlePattern)
        if exists
            WinActivate
        return
    }

    ActivateItem() {
        Log("Activate Item {1} -> {2} {3}", [this.Letter, this.TitlePattern, this.Description])
        this.ActivateWindow()
    }
}


class ClipboardNavigationItem extends NavigationItem
{
    __New(letter, description, propertyName)
    {
        super.__New(letter, description)
        this.PropertyName := propertyName
    }

    ActivateItem()
    {
        value := this.Parent.MyMap[this.PropertyName]
        A_Clipboard := value
    }

    FormatItemText()
    {
        text := super.FormatItemText()
        text .= " => " . this.Parent.MyMap[this.PropertyName]
        return text
    }
}


class CmdNavigationItem extends NavigationItem
{
    __New(letter, description, command) {
        super.__New(letter, description)
        this.Command := command
    }

    GetCommand() {
        return this.Command
    }

    ActivateItem() {
        cmd := this.GetCommand()
        Run cmd
    }
}

class PlaySoundItem extends NavigationItem
{
    __New(letter, description, soundFile) {
        super.__New(letter, description)
        this.SoundFile := soundFile
    }

    ActivateItem() {
        path :=  A_ScriptDir . this.SoundFile
        SoundPlay(path)
    }
}

class CopyJiraTicketAsBranchNameItem extends NavigationItem
{
    __New(letter, description) {
        super.__New(letter, description)
    }

    ActivateItem() {
        ; MsgBox WinGetTitle("A")
        Found := RegExMatch(WinGetTitle("A"), "^\[([^\]]+)\]\s+(.+)\s+\- Jira", &Title)
        if (Found > 0) {
            A_Clipboard := Title[1] "_" StrReplace(StrLower(Title[2]), A_Space, "_")
        } else {
            ; MsgBox Found WinGetTitle("A")
        }
    }
}