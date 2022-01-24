class AddressNavigationItem extends NavigationItem {

    ; GetDomainRegexp(){
    ;     regexFormat := this.Root.Config.Browser.Patterns.Url
    ;     jsonConfig := Json.Dump(this.Root.Config)
    ;     jsondomains := Json.Dump(this.Root.Config.OtherDomains)
    ;     ; Log("[AddressChangeItem] config : {1} {2} ", [jsonConfig, jsondomains])
    ;     domains := this.Root.Config.OtherDomains
    ;     joinedDomains := StringJoin(domains, "|")
    ;     regex := Format(regexFormat, joinedDomains)
    ;     Log("[AddressChangeItem] Other domains : {1}, joined: {2}, regex: {3}", [domains[1], joinedDomains, regex])
    ;     return regex
    ; }

    ; ; https://autohotkey.com/docs/commands/RegExMatch.htm
    ; ; https://autohotkey.com/docs/misc/RegEx-QuickRef.htm#subpat
    ; ; i ->	Case-insensitive matching, which treats the letters A through Z as identical to their lowercase counterparts.
    ; ; O ->  such as "O)abc.*123" -- a match object is stored in OutputVar.
    ; ; U -> 	Ungreedy. Makes the quantifiers *+?{} consume only those characters absolutely necessary to form a match, leaving the remaining ones available for the next part of the pattern
    ; ; NON-CAPTURING GROUP (?:) -> (?:.*) - To use the parentheses without the side-effect of capturing a subpattern, specify ?: as the first two characters inside the parentheses;
    ; ; FormatRegex(){
    ; ;     urlPattern := this.DestinationEnv
    ; ;     domains:= this.Root.
    ; ; }
    ; FormatUrl(CurrentUrl){
    ;     EnvRegex := "OiU)" . this.GetDomainRegexp()
    ;     Log("[AddressChangeItem] Regex pattern : '{1}', url : '{2}' ", [EnvRegex, CurrentUrl])
    ;     Position := RegExMatch(CurrentUrl, EnvRegex, MatchUrl)
    ;     format := this.Root.Environment.UrlPattern.Format

    ;     if(Position > 0){
    ;         UrlDomain:= MatchUrl.Value[1]
    ;         UrlPath:= MatchUrl.Value[2]
    ;         TargetUrl:= Format(format, UrlDomain, UrlPath)
    ;         Log("[AddressChangeItem] Target Url : '{1}' ", [TargetUrl])
    ;         return TargetUrl
    ;     }
    ;     Log("[AddressChangeItem] Unable to find mathing address ", [TargetUrl])
    ;     return ""
    ; }

    ; browsers := ["ahk_exe  chrome.exe", "ahk_exe firefox.exe"]

    ; IsInBrowser()
    ; {
    ;     isBRowser := 0
    ;     For index, winClass in this.browsers
    ;     {
    ;         isActive := WinActive(winClass)
    ;         if(isActive){
    ;             isBRowser := isBRowser + 1
    ;         }
    ;     }
    ;     return isBRowser > 0
    ; }

    ; ActivateItem(){
    ;     Log("[Merck] Address change Item {1} -> {2}", [this.Letter, this.Description])

    ;     if(not this.IsInBrowser()) {
    ;         Log("[Merck] Address change : Run this command in browser window", [])
    ;         MsgBox, Run this command in browser window
    ;         return
    ;     }

    ;     LocalUrl := CopyBrowserUrl()
    ;     if(StrLen(LocalUrl) > 200){
    ;         Log("[Merck] Address change : Url is longer than 200. `n`r", LocalUrl)
    ;         MsgBox, Url is longer than 200. `n`r %LocalUrl%
    ;         return
    ;     }

    ;     this.UrlFormat := this.FormatUrl(LocalUrl)
    ;     if(this.UrlFormat <> ""){
    ;         firefox(this.UrlFormat)
    ;         return
    ;     }

    ;     Log("[Merck] Address change : Could not match url to any Environment ", [])
    ;     MsgBox, Could not match url to any Environment
    ; }
}
