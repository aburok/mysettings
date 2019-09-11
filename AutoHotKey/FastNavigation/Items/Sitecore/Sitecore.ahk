#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\CopyIdFromTitleNavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreAdminItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreEditPageMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreLogsMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\SitecoreItemMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\DatabaseViewerItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\ContenEditorItemMenu.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\ProjectUrlItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Solr\Solr.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\RecentItems\RecentItemsViewer.ahk

SiteCoreAdminMenu(){
    ; https://github.com/alan-null/sc_ext/blob/master/app/sc_ext/modules/launcher/providers/ContentEditorCommandsProvider.ts
    ; https://github.com/alan-null/sc_ext/blob/master/app/sc_ext/modules/launcher/providers/AdminShortcutsCommandsProvider.ts
    admin := new NavigationItem("a", "Admin panel items")
        .AddItem(new SitecoreAdminItem("c", "Cache", "cache.aspx"))
        .AddItem(new SitecoreAdminItem("d", "Dependency Injection Configuration", "ShowServicesConfig.aspx"))
        .AddItem(new SitecoreAdminItem("e", "EventQueue Statistics", "EventQueueStats.aspx"))
        .AddItem(new SitecoreAdminItem("g", "Show configuration", "ShowConfig.aspx"))
        .AddItem(new SitecoreAdminItem("j", "Show jobs ", "jobs.aspx?refresh=2"))
        .AddItem(new SitecoreAdminItem("l", "Show logs ", "Logs.aspx"))
        .AddItem(new SitecoreAdminItem("q", "Ling Scratch Pad", "LinqScratchPad.aspx"))
        .AddItem(new SitecoreAdminItem("r", "Rendering statistics", "stats.aspx?site=website"))

    return admin
}

SiteCoreShellMenu(){
    shell := new NavigationItem("c", "Shell items")
        .AddItem(new SitecoreEditPageMenuItem("p", "Powershell", "{1}/sitecore/shell/Applications/PowerShell/PowerShellIse?sc_bw=1"))

    return shell
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

GetYankMenu(){
    yankMenu := new CopyIdFromTitleNavigationItem("y", "Parse Ids from title")
        .AddItem(new CopyPropertyMenuItem("i", "ID - Copy id from title", "ItemId"))
        .AddItem(new CopyPropertyMenuItem("t", "Template ID - Copy template id from title", "TemplateId"))
        .AddItem(new CopyPropertyMenuItem("p", "Path - Copy path from title", "ItemPath"))
        .AddItem(new CopyPropertyMenuItem("l", "Language - Copy language from title", "Lang"))
        .AddItem(new CopyPropertyMenuItem("n", "Name - Copy item name", "ItemName"))
        .AddItem(new CopyPropertyMenuItem("m", "Copy Media Id from title", "MediaId"))
        .AddItem(new CopyPropertyMenuItem("u", "Copy item Url", "ItemUrl"))

    return yankMenu
}

GetDiagnosticFilesOnLocal() {
    diagnostics := new NavigationItem("d", "Diagnostic")
        .AddItem(new LatestFileOpenerNavigationItem("l", "Sitecore Log", config.diagnostics.sitecore, "log.*.txt"))
        .AddItem(new LatestFileOpenerNavigationItem("s","Sitecore Search Log",  config.diagnostics.sitecore, "Search.log.*.txt"))
        .AddItem(new LatestFileOpenerNavigationItem("r","IIS request Log",  config.diagnostics.sitecore, "Search.log.*.txt"))
        .AddItem(new LatestFileOpenerNavigationItem("i","SOLR Log",  config.diagnostics.solr, "solr.log"))
    return diagnostics
}

; https://doc.sitecore.com/developers/90/sitecore-experience-management/en/the-restful-api-for-the-itemservice.html
; Sitecore REST API methods


; Sitecore 8.2
; https://doc.sitecore.com/developers/82/sitecore-experience-platform/en/the-restful-api-for-the-itemservice.html
