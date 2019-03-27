class GuidMenuItem extends NavigationItem {
    __New(letter, description){
        base.__New(letter, description)
        this.GuidFormatter := new GuidFormatter()
    }

    GetGuid(){
        GuidToFormat := Clipboard
        if(this.GuidFormatter.IsGuid(GuidToFormat)){
            this.Root.GuidToFormat := GuidToFormat
            return 1
        }

        InputBox, GuidToFormat, Insert Guid you like to format
        if(this.GuidFormatter.IsGuid(GuidToFormat)){
            this.Root.GuidToFormat := GuidToFormat
            return 1
        }

        return 0
    }

    ActivateItem(){
        if(this.GetGuid() > 0){
        Log("Get GUid to format {1}", [this.Root.GuidToFormat])
            this.AssignRoot()
            this.ShowCommandsAndLaunchSelected()
        }
    }

    GetTitle(){
        return "Format Guid : " . this.Root.GuidToFormat
    }
}

