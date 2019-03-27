class SitecoreLogsMenuItem extends WebsiteMenuItem {
    __New(letter, description, type){
        format := Format("/sitecore/admin/Logs.aspx?file={1}", type)
        format := "{1}" . format . ".{2}.txt&lastBytes=0"
        base.__New(letter, description, format)
        this.Type := type
    }

    GetFormatArgs(){
        ; InputBox, DaysBack, Insert numbers of days back
        ; https://www.autohotkey.com/docs/commands/FormatTime.htm
        FormatTime, TimeString,, yyyyMMdd
        return [this.Root.Environment.EditDomain, TimeString]
    }
}

