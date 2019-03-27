class GuidMenuItem extends NavigationItem {

    __New(letter, description, guidFormat){
        base.__New(letter, description)
        this.GuidFormat := guidFormat
        this.GuidFormatter := new GuidFormatter()
    }

    FormatGuid(){
        GuidToFormat := Clipboard
        formatted := this.GuidFormatter.Format(GuidToFormat, this.GuidFormat)
        if(formatted <> ""){
            return formatted
        }

        InputBox, GuidToFormat, Insert Guid you like to format
        formatted := this.GuidFormatter.Format(GuidToFormat, this.GuidFormat)

        return formatted
    }

    ActivateItem(){
        formatted := this.FormatGuid(GuidToFormat)
        if(formatted = ""){
            MsgBox, Pasted text is not a guid
            return
        }

        Clipboard:= formatted
        ;SendInput {Raw}%formatted%
    }
}
