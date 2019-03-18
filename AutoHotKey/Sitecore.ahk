class SiteCoreUrlMenuItem extends WebsiteMenuItem
{
    __New(letter, description, urlFormat)
    {
        base.__New(letter, description)
        this.UrlFormat := urlFormat
    }

    GetEditDomain()
    {
        return this.Root.EditDomain
    }

    ActivateItem()
    {
        this.Url := Format(this.UrlFormat, this.GetEditDomain())
        base.ActivateItem()
    }
}

class SiteCoreUrlItemMenuItem extends WebsiteMenuItem {
    __New(name, description, itemId)
    {
        base.__New(name, description, "{1}/sitecore/shell/Applications/Content`%20Editor.aspx?id={2}&sc_content=master")
        this.ItemId := itemId
    }

    ActivateItem()
    {
        this.Url := Format(this.UrlFormat, this.ItemId)
        base.ActivateItem()
    }
}

; https://doc.sitecore.com/developers/90/sitecore-experience-management/en/the-restful-api-for-the-itemservice.html
; Sitecore REST API methods
