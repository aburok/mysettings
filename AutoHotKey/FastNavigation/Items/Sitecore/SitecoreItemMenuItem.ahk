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

class SitecoreItemJson extends SitecoreItemMenuItem {

    static itemQueryFormat := "/-/item/v1/?sc_database={1}&sc_itemversion=1&language=en-US&payload=Min&scope=c%7cs&page=0&pageSize=100&fields={2}&query={3}"

    FormatApiUrl(query, database = "master", fields = ""){
        apiUrl := Format(itemQueryFormat, database, fields, query)
        return apiUrl
    }
}
