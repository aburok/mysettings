class NavigationItem {
    SubItems := []

    __New(letter,  description){
        this.Letter := letter
        this.Description := description
        this.Level := 0
    }

    AddItem(newItem){
        newItem.Parent := this
        newItem.Level := this.Level + 1
        this.SubItems.Push(newItem)
        return this
    }

    AddItemList(newItemList){
        for index, newItem in newItemList
        {
            this.AddItem(newItem)
        }
        return this
    }

    ShowCommandsAndLaunchSelected(){
        this.ShowHelp()

        INPUT, command, T10 L1 I

        this.HideHelp()
        this.LaunchCommand(command)
    }

    ShowHelp(){
        title := this.GetTitle()
        text := this.GetCommandsList()
        this.ShowSplash(title, text)
    }

    HideHelp(){
        SplashTextOff
    }

    ShowSplash(title, text){
        SplashTextOn, 500, 600, %title% , %text%
    }

    GetCommandsList(){
        helpText := "Available Commands: `n"

        For index, subItem in this.SubItems
        {
            text := subItem.FormatItemText()
            helpText .= text . "`n"
        }

        return helpText
    }

    GetTitle(){
        return this.Description
    }

    FormatItemText(){
        return Format(" {1} -> {2}" , this.Description, this.Letter)
    }

    LaunchCommand(command){
        this.AssignRoot()
        this.BeforeActivation()
        for index, cmd in this.SubItems
        {
            letter:= cmd.Letter
            if(letter == command)   {
                cmd.ActivateItem()
            }
        }
    }

    ActivateItem() {
        this.ShowCommandsAndLaunchSelected()
    }

    BeforeActivation(){
    }

    AssignRoot(){
        for index, items in this.SubItems
        {
            ; Log("[Item] This {1}, subItem: {2}, Root : {3}, Parent {4}, new Root: {5}", [this.Description, newItem.Description, this.Root.Description, newItem.Parent.Description, newItem.Root.Description])
            items.Root := this.Root
        }
    }
}
