class GuidFormatMenuItem extends NavigationItem {

    __New(letter, guidFormat){
        base.__New(letter, description)
        this.GuidFormat := guidFormat
        this.GuidFormatter := new GuidFormatter()
    }

    FormatGuid(){
        guidToFormat := this.Root.GuidToFormat
        Log("GUid to format {1}, format {2}", [guidToFormat, this.GuidFormat])
        formatted := this.GuidFormatter.Format(guidToFormat, this.GuidFormat)
        return formatted
    }

    ActivateItem(){
        formatted := this.FormatGuid()
        Clipboard:= formatted
        ;SendInput {Raw}%formatted%
    }

    FormatItemText(){
        guidText := this.FormatGuid()
        return Format("{1} - {2}", this.letter, guidText)
    }
}
