class SitecoreAdminItem extends WebsiteMenuItem {
    __New(letter, description, page){
        format := "{1}/sitecore/admin/" . page
        base.__New(letter, description, format)
    }

    GetDomain(){
        return this.Root.Environment.EditDomain
    }

    GetFormatArgs(){
        formatArgs := [this.GetDomain()]
        Return formatArgs
    }
}

