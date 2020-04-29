class SitecoreItemMenuItem extends SitecoreEditPageMenuItem {
    __New(letter, description, url, itemId = ""){
        base.__New(letter, description, url)
        this.ItemId := itemId
    }

    GetItemId(){
        if(this.Root.Item.Id){
            return this.Root.Item.Id
        } else if(this.ItemId){
            return this.ItemId
        } else {
            InputBox, ItemId, Insert Id of Item
            if(ItemId <> ""){
                return ItemId
            }
        }
        return ""
    }

    GetFormatArgs(){
        formatArgs := [this.GetDomain(), this.GetItemId()]
        Return formatArgs
    }
}
