class EnvironmentNavigationItem extends NavigationItem {
    __New(environment){
        letter := environment.titlePrefix
        StringLower, letter, letter
        base.__New(letter, environment.name)
        this.Environment := environment
    }

    BeforeActivation() {
        this.Root.Environment := this.Environment
        Log("Setting Edit Environment to : {1}, Root Name {2}", [this.Root.Environment.EditDomain, this.Root.Description])
    }
}


class CopyIdFromTitleNavigationItem extends NavigationItem{
    Match(haystack, pattern){
        pattern := "Oi)" . pattern
        Position := RegExMatch(haystack, pattern, MatchVar)
        Log("Pattern : {1} Match: {2} ", [pattern, MatchVar.Value[1]])
        if(Position > 0){
            return Trim(MatchVar.Value[1])
        }
        return ""
    }

    ActivateItem(){
        browser := this.Root.Config.Browser.Patterns
        WinGetTitle WinTitle, A

        Log("Pattern : {1} `n Title: {2} ", [Json.Dump(browser), WinTitle])

        item := {}
        item.Id := this.Match(WinTitle, browser.id)
        item.TemplateId := this.Match(WinTitle, browser.TemplateId)
        item.Path := this.Match(WinTitle, browser.path)
        item.Lang := this.Match(WinTitle, browser.lang)
        this.Root.Item := item

        Log("ItemID : {1} Template: {2} Path: [{3}], Media [{4}] ", [item.Id, item.TemplateId, item.Path, item.MediaId])

        base.ActivateItem()
    }
}


class CopyPropertyMenuItem extends NavigationItem {
    __New(letter, description, property){
        base.__New(letter, description)
        this.PropertyName := property
    }

    ActivateItem(){
        property := this.PropertyName
        obj := this.Root.Item
        value := obj[property]
        Log("Copying property [{1}] from Parent [{2}], Parent:{3}", [property, value, obj.Description])
        Clipboard := value
        MsgBox, % Format("{1} : {2}", this.Description, value)
    }
}

GetYankMenu(){
    yankMenu := new CopyIdFromTitleNavigationItem("y", "Parse Ids from title")
        .AddItem(new CopyPropertyMenuItem("i", "Copy id from title", "Id"))
        .AddItem(new CopyPropertyMenuItem("t", "Copy Template Id from title", "TemplateId"))
        .AddItem(new CopyPropertyMenuItem("p", "Copy Path from title", "Path"))
        .AddItem(new CopyPropertyMenuItem("l", "Copy Language from title", "Lang"))
        .AddItem(new CopyPropertyMenuItem("m", "Copy Media Id from title", "MediaId"))

    return yankMenu
}


class SeparatorMenuItem extends NavigationItem {
    __New(){
        base.__New("%", "Separator")
    }

    FormatItemText(){
        return " ========================= "
    }

    AddItem(){
        return
    }
}

