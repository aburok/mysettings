class NavigationItem {
    SubItems := []

    __New(letter, winShortcut, titlePattern, description){
        this.Letter := letter
        this.WinShortcut := winShortcut
        this.TitlePattern := titlePattern
        this.Description := description
        this.Level := 0

        hasWinLetter := winShortcut  && StrLen(winShortcut) > 0
        ; MsgBox, Try Bind %winLetter% %name% %hasWinLetter%
        if(hasWinLetter){
            ; Custom hotkey register function
            Hotkey(this.WinShortcut, "ActivateWindow", this.TitlePattern)
        }
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
        SplashTextOn, 500, 600 , Updated script, % this.helpText

        INPUT, command, T10 L1 I

        SplashTextOff
        ;MsgBox, Command %command% was selected.
        this.LaunchCommand(command)
    }

    helpText := ""

    GetHelpText(){
        if(this.helpText && this.helpText.Length() > 0){
            return this.helpText
        }

        this.helpText := "Shortcuts`n"
        this.helpText .= Format(" {1} - > {2} `n`n", this.Description, this.Letter)

        For index, command in this.SubItems
        {
            this.helpText.= Format(" {1} -> {2}`n" , command.Letter, command.Description)
        }

        return this.helpText
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
