class NavigationItem {
    SubItems := []

    __New(letter,  description){
        this.Letter := letter
        this.Description := description
        this.Level := 0
    }

    AddItem(newItem){
        this.SubItems.Push(newItem)
        newItem.Parent := this
        newItem.Level := this.Level + 1
        return this
    }

    AddItemList(newItemList){
        for index, newItem in newItemList
        {
            this.AddItem(newItem)
        }
        return this
    }

    ShowHelp(){
        this.helpText := this.GetHelpText()
        this.ShowSplash(this.helpText)

        ; T2 to limit timout to 2 seconds
        ; L3 to limit the input to 3 keys.
        INPUT, command, T10 L1 I

        SplashTextOff
        ;MsgBox, Command %command% was selected.
        this.LaunchCommand(command)
    }

    ShowSplash(helpText){
        SplashTextOn, 500, 600, Updated script, % helpText
    }

    helpText := ""

    GetHelpText(){
        this.helpText := "Shortcuts`n"
        this.helpText .= this.FormatItemText() . "`n"

        For index, command in this.SubItems
        {
            text := command.FormatItemText()
            this.helpText .= text . "`n"
        }

        return this.helpText
    }

    FormatItemText()
    {
        return Format(" {1} -> {2}" , this.Letter, this.Description)
    }

    LaunchCommand(command){
        for index, cmd in this.SubItems
        {
            letter:= cmd.Letter
            if(letter == command)   {
                cmd.ActivateItem()
            }
        }
    }

    ActivateItem()
    {
        this.ShowHelp()
    }
}
