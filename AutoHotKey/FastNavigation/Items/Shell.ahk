class AppMenuLevel extends NavigationItem {
    __New(letter, description, winShortcut, titlePattern){
        base.__New(letter, description)

        this.WinShortcut := winShortcut
        this.TitlePattern := titlePattern

        hasWinLetter := winShortcut  && StrLen(winShortcut) > 0
        ; MsgBox, Try Bind %winLetter% %name% %hasWinLetter%
        if(hasWinLetter){
            ; Custom hotkey register function
            Hotkey(this.WinShortcut, "ActivateWindow", this.TitlePattern)
        }
    }

    ActivateItem(){
        Log("Activate Item {1} -> {2} {3}", [this.Letter, this.TitlePattern, this.Description])
        exists := WinExist("" . this.TitlePattern)
        if exists
            WinActivate
        return
    }
}


class ClipboardNavigationItem extends NavigationItem
{
    __New(letter, description, propertyName)
    {
        base.__New(letter, description)
        this.PropertyName := propertyName
    }

    ActivateItem()
    {
        value := this.Parent[this.PropertyName]
        Clipboard := value
    }

    FormatItemText()
    {
        text := base.FormatItemText()
        text .= " => " . this.Parent[this.PropertyName]
        return text
    }
}


class CmdNavigationItem extends NavigationItem
{
    __New(letter, description, command){
        base.__New(letter, description)
        this.Command := command
    }

    static cmdPath := "C:\Windows\System32\cmd.exe"

    GetCommand(){
        return this.Command
    }

    ActivateItem(){
        cmd := this.GetCommand()
        Run, %cmdPath% /c %cmd%
    }
}


