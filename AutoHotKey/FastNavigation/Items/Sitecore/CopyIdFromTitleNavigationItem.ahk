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

