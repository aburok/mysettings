
class SolrUrlItemMenuItem extends SitecoreItemMenu {
    __New(name, description, filter = "", query = "*:*")
    {
        jqArgs := "#broq-filter=.response.docs[] "
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

