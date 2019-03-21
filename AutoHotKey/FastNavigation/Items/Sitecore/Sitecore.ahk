class EnvironmentNavigationItem extends NavigationItem {
    __New(letter, description, environment){
        base.__New(letter, description)
        this.Environment := environment
    }

    BeforeActivation() {
        this.Root.Environment := this.Environment
        Log("Setting Edit Environment to : {1}, Root Name {2}", [this.Root.Environment.EditDomain, this.Root.Description])
    }
}

class SiteCoreUrlMenuItem extends WebsiteMenuItem {
    GetFormatArgs()
    {
        formatArgs := [this.Root.Environment.EditDomain]
        Log("[SiteCoreUrlMenuItem] Root : {1}, Root Name {2}", formatArgs)
        Log("[SiteCoreUrlMenuItem] Address change Item {1} -> {2} : Url: {3}, Args:{4}", [this.Letter, this.Description, this.UrlFormat, this.Root.Environment.EditDomain])
        return formatArgs
    }
}

class SiteCoreUrlItemMenuItem extends WebsiteMenuItem {
    __New(name, description, itemId)
    {
        base.__New(name, description, "{1}/sitecore/shell/Applications/Content`%20Editor.aspx?id={2}&sc_content=master")
        this.ItemId := itemId
    }

    GetFormatArgs(){
        formatArgs := [this.Root.Environment.EditDomain, this.itemId]
        Return formatArgs
    }
}



; https://doc.sitecore.com/developers/90/sitecore-experience-management/en/the-restful-api-for-the-itemservice.html
; Sitecore REST API methods


; Sitecore 8.2
; https://doc.sitecore.com/developers/82/sitecore-experience-platform/en/the-restful-api-for-the-itemservice.html
