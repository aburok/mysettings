class SitecoreEditPageMenuItem extends WebsiteMenuItem {
    __New(letter, description, url){
        base.__New(letter, description, url)
    }

    GetDomain(){
        return this.Root.Environment.EditDomain
    }

    GetFormatArgs(){
        formatArgs := [this.GetDomain()]
        Return formatArgs
    }
}
