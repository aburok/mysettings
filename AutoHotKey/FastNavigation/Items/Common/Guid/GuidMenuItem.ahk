class GuidMenuItem extends NavigationItem {
    __New(letter, description){
        base.__New(letter, description)
        this.GuidFormatter := new GuidFormatter()

        this.Root := this
    }

    GetGuid(){
        GuidToFormat := Clipboard
        Log("Clipboard {1}", [GuidToFormat])

        if(this.GuidFormatter.IsGuid(GuidToFormat)){
            Log("Clipboard contains correct GUID = {1}, returning.", [GuidToFormat])
            this.GuidToFormat := GuidToFormat

            Log("this.GuidToFormat = {1}.", [this.GuidToFormat])
            return 1
        }

        GuidToFormat:= InputBox("Insert Guid you like to format", "Guid")
        if(this.GuidFormatter.IsGuid(GuidToFormat)){
            Log("User pasted correct GUID = {1}, returning.", [GuidToFormat])
            this.GuidToFormat := GuidToFormat
            return 1
        }

        return 0
    }

    ActivateItem(){
        if(this.GetGuid() > 0){
            Log("Get GUid to format {1}", [this.GuidToFormat])
            this.AssignRoot()
            this.ShowCommandsAndLaunchSelected()
        }
    }

    GetTitle(){
        return "Format Guid : " . this.Root.GuidToFormat
    }
}

