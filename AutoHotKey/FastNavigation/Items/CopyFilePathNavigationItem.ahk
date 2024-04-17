
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

        this.MyMap := Map()
        this.MyMap["AbsolutPath"] := A_Clipboard
        this.MyMap["RelativePath"] := StrReplace(A_Clipboard, this.RelativeRoot, "")
        SplitPath(A_Clipboard, &name, &dir)
        this.MyMap["FileName"] := name
        this.MyMap["ContaingFolder"] := dir

        this.ShowCommandsAndLaunchSelected()
    }
}

