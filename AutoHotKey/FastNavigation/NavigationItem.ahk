class NavigationItem {
    SubItems := []

    __New(letter,  description){
        this.Letter := letter
        this.Description := description
        this.Level := 0
        this.Root := this
    }

    AddItem(newItem){
        newItem.Parent := this
        newItem.Root := this.Root
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
        this.AssignRoot()
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
        SplashTextOn, 1200, 600, %title% , %text%
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
        this.AssignRoot()
        this.ShowCommandsAndLaunchSelected()
    }

    BeforeActivation(){
    }

    AssignRoot(){
        Log("[Item] This {1}, Root : {2}. ", [this.Description, this.Root.Description])
        newRoot := this.Root
        for index, subItem in this.SubItems
        {
            subItem.Root := newRoot
            Log("[SubItem] '{1}', Root : {2}, Parent {3}.", [subItem.Description,  subItem.Root.Description, subItem.Parent.Description])
        }
    }
}
