
class ProjectUrlItem extends WebsiteMenuItem {
    __New(letter, description, urlFormat, environment){
        base.__New(letter, description, urlFormat)
        this.EnvironmentName := environment
    }

    ; "urlPattern": {
    ;     "protocol": "https",
    ;     "domain": "test(edit)?\\.({1})\\.com",
    ;     "format": "https://test.{1}.com/{2}"
    ; },
    GetFormatArgs(){
        formatDomain := this.Root.Environment.UrlPattern.Format
        domain := Format(formatDomain, this.EnvironmentName, "")
        Log("[MerckUrlItem] {1} , {2} , {3} ", [this.EnvironmentName, domain, formatDomain])
        formatArgs := [domain]
        Return formatArgs
    }
}
