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
        item.Url := this.Match(WinTitle, browser.itemUrl)
        item.Lang := this.Match(WinTitle, browser.lang)
        item.Name := this.Match(WinTitle, browser.name)
        this.Root.Item := item

        Log("ItemID : {1} Template: {2} Path: [{3}], Media [{4}] ", [item.Id, item.TemplateId, item.Path, item.MediaId])

        base.ActivateItem()
    }
}

class GuidMenuItem extends NavigationItem {
    static guidRegex := "Oi)^[{(]?([0-9A-Fa-f]{8})[-]([0-9A-Fa-f]{4})[-]([0-9A-Fa-f]{4})[-]([0-9A-Fa-f]{4})[-]([0-9A-Fa-f]{12})[)}]?$"
    __New(letter, description, guidFormat){
        base.__New(letter, description)
        this.GuidFormat := guidFormat
    }
    ActivateItem(){
        GuidToFormat := Clipboard
        position := RegExMatch(GuidToFormat, this.guidRegex, guidMatch)
        if(position = 0){
            InputBox, GuidToFormat, Insert Guid you like to format
            if( GuidToFormat = ""){
                return
            }

            position := RegExMatch(GuidToFormat, this.guidRegex, guidMatch)
            if(position = 0){
                MsgBox, Pasted text is not a guid : %GuidToFormat%
                return
            }
        }

        formatted := Format(this.GuidFormat, guidMatch.Value[1], guidMatch.Value[2], guidMatch.Value[3], guidMatch.Value[4], guidMatch.Value[5])
        ;MsgBox, % this.GuidFormat . " " . formatted
        Clipboard:= formatted
        ;SendInput {Raw}%formatted%
    }
}

GetGuidFormat(){
    guidMenu := new NavigationItem("g", "Format guid from clipboard")
        .AddItem(new GuidMenuItem("f", "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}", "{{}{1}-{2}-{3}-{4}-{5}{}}"))
        .AddItem(new GuidMenuItem("n", "XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", "{1}-{2}-{3}-{4}-{5}"))
        .AddItem(new GuidMenuItem("s", "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",  "{1}{2}{3}{4}{5}"))
        .AddItem(new GuidMenuItem("x", "XXXXXXXXxXXXXxXXXXxXXXXxXXXXXXXXXXX", "{1}x{2}x{3}x{4}x{5}"))
        return guidMenu
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
        .AddItem(new CopyPropertyMenuItem("n", "Copy Item Name", "Name"))
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

