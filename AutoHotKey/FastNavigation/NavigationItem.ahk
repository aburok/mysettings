class NavigationItem {
    SubItems := []

    __New(letter, description) {
        this.Letter := letter
        this.Description := description
        this.Level := 0
        this.Root := this
        this.MyGui := Gui()
    }

    AddItem(newItem) {
        newItem.Parent := this
        newItem.Root := this.Root
        newItem.Level := this.Level + 1
        this.SubItems.Push(newItem)

        return this
    }

    AddItemList(newItemList) {
        for index, newItem in newItemList
        {
            this.AddItem(newItem)
        }
        return this
    }

    ShowCommandsAndLaunchSelected() {
        this.AssignRoot()
        ; this.ShowHelp()
        this.ShowHelpV2()

        command := KeyWaitAny("T10 L1 I")

        this.HideHelp()
        this.LaunchCommand(command)
    }

    ShowHelp() {
        title := this.GetTitle()
        text := this.GetCommandsList()
        this.ShowSplash(title, text)
    }

    ShowHelpV2() {
        title := this.GetTitle()

        this.MyGui := Gui()
        For index, subItem in this.SubItems
        {
            text := subItem.FormatItemText()
            this.MyGui.SetFont("w800")
            this.MyGui.Add("Text", "X10 " , subItem.Letter)
            this.MyGui.SetFont("w1")
            this.MyGui.Add("Text", "X+20 ", subItem.Description)
            ; this.MyGui.Add("Text", "X+10 ", text)
        }
        this.MyGui.Show
    }

    HideHelp() {
        ; SplashTextOff
        this.MyGui.Hide()
    }

    ShowSplash(title, text) {
        this.MyGui := Gui()
        this.MyGui.Add("Text", "R2", text)
        this.MyGui.Show
    }

    GetCommandsList() {
        helpText := "Available Commands: `n"

        For index, subItem in this.SubItems
        {
            text := subItem.FormatItemText()
            helpText .= text . "`n"
        }

        return helpText
    }

    GetTitle() {
        return this.Description
    }

    FormatItemText() {
        return Format(" {1} -> {2}", this.Description, this.Letter)
    }

    LaunchCommand(command) {
        this.AssignRoot()
        this.BeforeActivation()
        for index, cmd in this.SubItems
        {
            letter := cmd.Letter
            if (letter == command) {
                cmd.ActivateItem()
            }
        }
    }

    ActivateItem() {
        this.AssignRoot()
        this.ShowCommandsAndLaunchSelected()
    }

    BeforeActivation() {
    }

    AssignRoot() {
        Log("[Item] This {1}, Root : {2}. ", [this.Description, this.Root.Description])
        newRoot := this.Root
        for index, subItem in this.SubItems
        {
            subItem.Root := newRoot
            Log("[SubItem] '{1}', Root : {2}, Parent {3}.", [subItem.Description, subItem.Root.Description, subItem.Parent.Description])
        }
    }
}