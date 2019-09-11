#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Solr\SolrUrlItemMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Solr\SolrUrlMenu.ahk

GetSolrMenu(){
    solr := new NavigationItem("s", "Solr menu")
        .AddItem(new SolrUrlItemMenuItem("s", "Open ItemId In Solr", "_uniqueid:*{2}*"))
        ; .AddItem(new SolrUrlItemMenuItem("p", "Open Item that have this item in Path"))
        .AddItem(new SolrUrlItemMenuItem("p", "Open Item based on Templated ID (of this item)", "_template:{2}&fq=_language:en"))
        .AddItem(new SolrUrlMenu("q", "Open ItemId In Solr Query Panel", "_uniqueid:*{2}*"))
        ; .AddItem(new SolrUrlItemMenuItem("p", "Open Item that have this item in Path"))
        .AddItem(new SolrUrlMenu("p", "Open Item based on Templated ID (of this item)", "_template:{2}&fq=_language:en"))
    return solr
}
