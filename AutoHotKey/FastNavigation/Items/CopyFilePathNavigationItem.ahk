
class CopyFilePathNavigationItem extends NavigationItem
{
    __New(letter, name, relativeRoot := ""){
        super.__New(letter, name)
        this.RelativeRoot := relativeRoot

        this.AddItem(ClipboardNavigationItem("f", "Full path", "AbsolutPath"))
        this.AddItem(ClipboardNavigationItem("n", "File name", "FileName"))
        this.AddItem(ClipboardNavigationItem("r", "Relative file path", "RelativePath"))
        this.AddItem(ClipboardNavigationItem("d", "Containg folder path", "ContaingFolder"))
    }

    ShowSplash(helpText){
        ; ShowSplash("Updated script", helpText)
    }

    ActivateItem(){
        Sleep 100
        if(WinActive("ahk_exe gvim.exe")){
            Send ",yf"
        }
        if(WinActive("ahk_exe TOTALCMD64.EXE") or WinActive("ahk_exe devenv.exe") or WinActive("ahk_exe notepad++.exe")){
            Send "^+y"
        }
        if(WinActive("ahk_exe Code.exe")){
            Send "+!c"
        }
        Sleep 100

        this.AbsolutPath := A_Clipboard
        this.RelativePath := StrReplace(A_Clipboard, this.RelativeRoot, "")
        this.name := SplitPath(A_Clipboard)
        this.FileName := this.name
        dir := SplitPath ( A_Clipboard)
        this.ContaingFolder := dir

        this.ShowCommandsAndLaunchSelected()
    }
}

