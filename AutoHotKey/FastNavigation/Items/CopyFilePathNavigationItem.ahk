
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

        this.ShowCommandsAndLaunchSelected()
    }
}

