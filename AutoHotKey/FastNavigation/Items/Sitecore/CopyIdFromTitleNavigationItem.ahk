class CopyIdFromTitleNavigationItem extends NavigationItem{
    __New(letter, description){
        base.__New(letter, description)
        this.titleParse := new WindowTitleParser()
    }

    ActivateItem(){
        browser := this.Root.Config.Browser.Patterns
        item := this.titleParse.GetInfo(browser.info)
        this.Root.Item := item

        Log("ItemID : {1} Template: {2} Path: [{3}], Media [{4}] ", [item.itemId, item.templateId, item.Path, item.MediaId])

        base.ActivateItem()
    }
}

