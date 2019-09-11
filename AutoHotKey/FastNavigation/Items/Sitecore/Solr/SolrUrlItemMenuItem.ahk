class SolrUrlItemMenuItem extends SitecoreItemMenuItem {
    __New(name, description, filter = "", query = "*:*")
    {
        jqArgs := "#broq-filter=.response.docs[]|{name:._name,name2:._displayname,id:._uniqueid,path:._fullpath} "
        format := Format("/solr/sitecore_master_index/select?q={1}&fq={2}&wt=json&indent=true{3}", query, filter, jqArgs)
        format := "{1}" . format
        base.__New(name, description, format)
    }

    OpenUrl(){
        Chrome(this.Url)
    }

    GetDomain(){
        Log("\<SolrUrlItemMenuItem\> {1}" , this.Root.Environment.Solr)
        return this.Root.Environment.Solr
    }
}
