#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\CopyIdFromTitleNavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreAdminItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreLogsMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreItemMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\DatabaseViewerItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\ContenEditorItemMenu.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Solr\Solr.ahk

SiteCoreAdminMenu(){
    admin := new NavigationItem("a", "Admin panel items")
        .AddItem(new SitecoreAdminItem("c", "Cache", "cache.aspx"))
        .AddItem(new SitecoreAdminItem("g", "Show configuration", "ShowConfig.aspx"))
        .AddItem(new SitecoreAdminItem("j", "Show jobs ", "jobs.aspx?refresh=2"))
        .AddItem(new SitecoreAdminItem("q", "Ling Scratch Pad", "LinqScratchPad.aspx"))

    return admin
}

SiteCoreShellMenu(){
    admin := new NavigationItem("c", "Shell items")
        .AddItem(new SitecoreAdminItem("c", "Cache", "cache.aspx"))
        .AddItem(new SitecoreAdminItem("g", "Show configuration", "ShowConfig.aspx"))
        .AddItem(new SitecoreAdminItem("j", "Show jobs ", "jobs.aspx?refresh=2"))
        .AddItem(new SitecoreAdminItem("q", "Ling Scratch Pad", "LinqScratchPad.aspx"))

    return admin
}

OpenItemIn(){
    openIn := new CopyIdFromTitleNavigationItem("o", "Open Item in")
        .AddItem(new DatabaseViewerItem("d", "Open Item in DbViewer "))
        .AddItem(new ContenEditorItemMenu("c", "Content Editor"))
    return openIn
}

SiteCoreLogsMenu(){
    logs := new NavigationItem("l", "Logs")
        .AddItem(new WebsiteMenuItem("m", "Main Logs Page", "{1}/sitecore/admin/Logs.aspx"))
        .AddItem(new SiteCoreLogsMenuItem("l", "Main Logs", "log"))
        .AddItem(new SiteCoreLogsMenuItem("s", "Search Logs", "search.log"))
        .AddItem(new SiteCoreLogsMenuItem("p", "Publishing Logs", "publishing.log"))
    return logs
}

; https://doc.sitecore.com/developers/90/sitecore-experience-management/en/the-restful-api-for-the-itemservice.html
; Sitecore REST API methods


; Sitecore 8.2
; https://doc.sitecore.com/developers/82/sitecore-experience-platform/en/the-restful-api-for-the-itemservice.html
