class HeaderFormatNavigationItem extends NavigationItem
{
    __New(letter, description) {
        super.__New(letter, description)
    }

    cmdPath := "C:\Windows\System32\cmd.exe"

    ActivateItem() {
        headerText := InputBox("Provide header", "Header generator", "T100").value
        textLength := StrLen(headerText)
        padLeft := 40 - Floor(textLength / 2)
        padRight := padLeft - Mod(textLength, 2)
        hashLines := StrReplace(Format("{:80}", ""), " ", "#")
        strFormat := "{3}`n{1:-" padLeft "}{2}{1:" padRight "}`n{3}"
        formatted := Format(strFormat, "#", headerText, hashLines)
        A_Clipboard := formatted
    }
}