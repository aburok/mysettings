class AppMenuLevel extends NavigationItem {

    ActivateItem(){
        Log("Activate Item {1} -> {2} {3}", [this.Letter, this.TitlePattern, this.Description])
        exists := WinExist("" . this.TitlePattern)
        if exists
            WinActivate
        return
    }

}


class WebsiteMenuItem extends MenuLevel {
    __New(letter, name, description, url)
    {
        base.__New(name, "", "", description)
        this.environment := environment
        this.Url := url
    }

    ActivateItem()
    {
        Log("[Merck] Address change Item {1} -> {2}", [this.Letter, this.Description])

        chrome(this.Url)
    }
}


class ClipboardWebsiteMenuItem extends WebsiteMenuItem {
    __New(letter, name, description, urlFormat){
        this.UrlFormat := urlFormat
    }

    ActivateItem(){
        urlFragment := Clipboard

        this.Url := Format(this.UrlFormat, urlFragment)

        base.ActivateItem()
    }
}
