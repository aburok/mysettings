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

    FormatItemText() {
        url := this.FormatUrl()
        return Format("{1} -> {2} - [{3}]", this.letter, this.description, url)
    }

    FormatUrl(){
        formatArgs := this.GetFormatArgs()
        url := Format(this.UrlFormat, formatArgs*)
        formatArgsJson := Json.Dump(formatArgs)
        Log("[WebsiteMenuItem] Format Args : {1}", [formatArgsJson])
        return url
    }

    ActivateItem()
    {
        if(this.Cancel > 0){
            return
        }

        this.Url := this.FormatUrl()
        Log("[WebsiteMenuItem] [{1}] -> '{2}',  UrlFormat: {3}, Url: {4}", [this.Letter, this.Description, this.UrlFormat, this.Url])

        if(this.Url){
            this.OpenUrl()
        } else {
            MsgBox, Url is empty and cannot be opened.
        }
    }
}
