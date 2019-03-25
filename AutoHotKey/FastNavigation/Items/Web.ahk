class WebsiteMenuItem extends NavigationItem {
    __New(letter, description, urlFormat)
    {
        base.__New(letter, description)
        this.UrlFormat := urlFormat
    }

    GetFormatArgs(){
        return [""]
    }

    OpenUrl(){
        firefox(this.Url)
    }

    ActivateItem()
    {
        if(this.Cancel > 0){
            return
        }
        formatArgs := this.GetFormatArgs()
        formatArgsJson := Json.Dump(formatArgs)
        Log("[WebsiteMenuItem] Format Args : {1}", [formatArgsJson])
        this.Url := Format(this.UrlFormat, formatArgs*)
        Log("[WebsiteMenuItem] [{1}] -> '{2}',  UrlFormat: {3}, Url: {4}, Args:{5}", [this.Letter, this.Description, this.UrlFormat, this.Url, formatArgsJson])

        if(this.Url){
            this.OpenUrl()
        } else {
            MsgBox, Url is empty and cannot be opened.
        }
    }
}
