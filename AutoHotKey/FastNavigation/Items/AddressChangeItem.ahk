class AddressNavigationItem extends NavigationItem{


    __New(name, description, environment)
    {
        base.__New(name, "", "", description)
        this.DestinationEnv := environment
    }

    ; https://autohotkey.com/docs/commands/RegExMatch.htm
    ; https://autohotkey.com/docs/misc/RegEx-QuickRef.htm#subpat
    ; i ->	Case-insensitive matching, which treats the letters A through Z as identical to their lowercase counterparts.
    ; O ->  such as "O)abc.*123" -- a match object is stored in OutputVar.
    ; U -> 	Ungreedy. Makes the quantifiers *+?{} consume only those characters absolutely necessary to form a match, leaving the remaining ones available for the next part of the pattern
    ; NON-CAPTURING GROUP (?:) -> (?:.*) - To use the parentheses without the side-effect of capturing a subpattern, specify ?: as the first two characters inside the parentheses;
    ; FormatRegex(){
    ;     urlPattern := this.DestinationEnv
    ;     domains:= this.Root.
    ; }

    ActivateItem(){
        Log("[Merck] Address change Item {1} -> {2}", [this.Letter, this.Description])

        if(not WinActive("ahk_exe  chrome.exe")) {
            Log("[Merck] Address change : Run this command in browser window", [])
            MsgBox, Run this command in browser window
            return
        }

        DestinationEnv := "local"

        LocalUrl := CopyBrowserUrl()
        if(StrLen(LocalUrl) > 200){
            Log("[Merck] Address change : Url is longer than 200. `n`r", LocalUrl)
            MsgBox, Url is longer than 200. `n`r %LocalUrl%
            return
        }

        for index, element in UrlFormats
        {
            if(element.Name == this.Name){
                EnvRegex := "OiU)^" . element.Regex . "(.+)$"
                Position:= RegExMatch(LocalUrl, EnvRegex, MatchUrl)
                if(Position > 0){

                    EnvFormat := element.Format
                    UrlDomain:= MatchUrl.Value[1]
                    UrlPath:= MatchUrl.Value[2]

                    TargetUrl:= Format(EnvFormat, UrlDomain, UrlPath)
                    ; MsgBox, %EnvFormat% %UrlDomain% %UrlPath% %TargetUrl%

                    Chrome(TargetUrl)
                    return
                }
            }
        }

        Log("[Merck] Address change : Could not match url to any Environment ", [])
        MsgBox, Could not match url to any Environment
    }
}
