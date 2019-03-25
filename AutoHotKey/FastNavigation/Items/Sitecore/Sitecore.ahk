class SitecoreEditItem extends WebsiteMenuItem {
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


class SitecoreItemMenu extends WebsiteMenuItem {
    __New(letter, description, url, itemId = ""){
        base.__New(letter, description, url)
        this.ItemId := itemId
    }

    GetItemId(){
        if(this.Root.Item.Id){
            return this.Root.Item.Id
        } else if(this.ItemId){
            return this.ItemId
        } else {
            InputBox, ItemId, Insert Id of Item
            if(ItemId <> ""){
                return ItemId
            }
        }
        return ""
    }

    GetDomain(){
        return this.Root.Environment.EditDomain
    }

    GetFormatArgs(){
        formatArgs := [this.GetDomain(), this.GetItemId()]
        Return formatArgs
    }
}

class DatabaseViewerItem extends SitecoreItemMenu {
    __New(letter, description) {
        format := "{1}/sitecore/admin/dbbrowser.aspx?db=master&lang=en&id={2}"
        base.__New(letter, description, format)
    }
}


class ContenEditorItemMenu extends SitecoreItemMenu {
    __New(name, description, itemId = "") {
        format :=  "{1}/sitecore/shell/Applications/Content`%20Editor.aspx?sc_bw=1&sc_lang=en"
        if(itemId){
            format .=  "&fo={2}&sc_content=master"
        }
        base.__New(name, description, format, itemId)
    }
}

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

SiteCoreAdminMenu(){
    admin := new NavigationItem("a", "Admin panel items")
        .AddItem(new SitecoreEditMenu("c", "Cache", "cache.aspx"))
        .AddItem(new SitecoreEditMenu("g", "Show configuration", "ShowConfig.aspx"))
        .AddItem(new SitecoreEditMenu("j", "Show jobs ", "jobs.aspx?refresh=2"))
        .AddItem(new SitecoreEditMenu("q", "Ling Scratch Pad", "LinqScratchPad.aspx"))
        .AddItem(new SitecoreItemMenu("e", "Content Editor", "{1}/sitecore/shell/Applications/Content`%20Editor.aspx?sc_bw=1"))
        .AddItem(new SitecoreItemMenu("d", "Publishing Dashboard", "{1}/sitecore/client/Applications/Publishing/Dashboard"))

    return admin
}

SiteCoreLogsMenu(){
    logs := new NavigationItem("l", "Logs")
        .AddItem(new WebsiteMenuItem("m", "Main Logs Page", "{1}/sitecore/admin/Logs.aspx"))
        .AddItem(new SiteCoreLogsMenuItem("l", "Main Logs", "log"))
        .AddItem(new SiteCoreLogsMenuItem("s", "Search Logs", "search.log"))
        .AddItem(new SiteCoreLogsMenuItem("p", "Publishing Logs", "publishing.log"))
    return logs
}

OpenItemIn(){
    openIn := new CopyIdFromTitleNavigationItem("o", "Open Item in")
        .AddItem(new SolrUrlItemMenuItem("s", "Open ItemId In Solr", "_uniqueid:*{2}*"))
        ; .AddItem(new SolrUrlItemMenuItem("p", "Open Item that have this item in Path"))
        .AddItem(new SolrUrlItemMenuItem("p", "Open Item based on Templated ID (of this item)", "_template:{2}"))
        .AddItem(new DatabaseViewerItem("d", "Open Item in DbViewer "))
        .AddItem(new ContenEditorItemMenu("c", "Content Editor"))
    return openIn
}

; https://doc.sitecore.com/developers/90/sitecore-experience-management/en/the-restful-api-for-the-itemservice.html
; Sitecore REST API methods


; Sitecore 8.2
; https://doc.sitecore.com/developers/82/sitecore-experience-platform/en/the-restful-api-for-the-itemservice.html
