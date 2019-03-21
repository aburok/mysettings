
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


class WebsiteMenuItem extends NavigationItem {
    __New(letter, description, urlFormat)
    {
        base.__New(letter, description)
        this.UrlFormat := urlFormat
    }

    GetFormatArgs(){
        return [""]
    }

    ActivateItem()
    {
        if(this.Cancel > 0){
            return
        }
        formatArgs := this.GetFormatArgs()
        formatArgsJson := Json.Dump(formatArgs)
        Log("[WebsiteMenuItem] Format Args : {1}", [formatArgsJson])
        this.Url := Format(this.UrlFormat, formatArgs*)
        Log("[WebsiteMenuItem] [{1}] -> '{2}',  UrlFormat: {3}, Url: {4}, Args:{5}", [this.Letter, this.Description, this.UrlFormat, this.Url, formatArgsJson])
        firefox(this.Url)
    }
}


class ClipboardWebsiteMenuItem extends WebsiteMenuItem {
    __New(letter, description, urlFormat){
        base.__New(letter, description, "")
        this.UrlFormat := urlFormat
    }

    ActivateItem(){
        urlFragment := Clipboard
        this.Url := Format(this.UrlFormat, urlFragment)
        base.ActivateItem()
    }
}

class LatestFileOpenerNavigationItem extends NavigationItem
{
    __New(letter, description, dir, filePattern){
        base.__New(letter, description)
        this.Dir := dir
        this.FilePattern := filePattern
    }

    ActivateItem(){
        FindLatestFileAndOpen(this.Dir, this.filePattern)
    }
}


class CmdNavigationItem extends NavigationItem
{
    __New(letter, description, command){
        base.__New(letter, description)
        this.Command := command
    }

    static cmdPath := "C:\Windows\System32\cmd.exe"

    ActivateItem(){
        cmd := this.Command
        Run, %cmdPath% /c %cmd%
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


class CopyFilePathNavigationItem extends NavigationItem
{
    __New(letter, name, relativeRoot := ""){
        base.__New(letter, name)
        this.RelativeRoot := relativeRoot

        this.AddItem(new ClipboardNavigationItem("f", "Full path", "AbsolutPath"))
        this.AddItem(new ClipboardNavigationItem("n", "File name", "FileName"))
        this.AddItem(new ClipboardNavigationItem("r", "Relative file path", "RelativePath"))
        this.AddItem(new ClipboardNavigationItem("d", "Containg folder path", "ContaingFolder"))
    }

    ShowSplash(helpText){
        SplashTextOn, 800, 600, Updated script, % helpText
    }

    ActivateItem(){
        Sleep 100
        if(WinActive("ahk_exe  gvim.exe")){
            Send ,yf
        }
        if(WinActive("ahk_exe TOTALCMD64.EXE") or WinActive("ahk_exe devenv.exe") or WinActive("ahk_exe notepad++.exe")){
            Send ^+y
        }
        if(WinActive("ahk_exe Code.exe")){
            Send +!c
        }
        Sleep 100

        this.AbsolutPath := Clipboard
        this.RelativePath := StrReplace(Clipboard, this.RelativeRoot, "")
        SplitPath, Clipboard, name, Clipboard
        this.FileName := name
        SplitPath, Clipboard, Clipboard, dir
        this.ContaingFolder := dir

        this.ShowHelp()
    }
}


class ParseWinTitleNavigationItem extends NavigationItem
{

}
