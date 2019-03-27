class SolrUrlMenu extends WebsiteMenuItem {
    __New(letter, description, solrPath = "/#/sitecore_master_index/query"){
        format := "{1}/solr" . solrPath
        base.__New(letter, description, format)
    }

    GetFormatArgs(){
        return [this.Root.Environment.Solr]
    }
}

class SolrUrlItemMenuItem extends SitecoreItemMenu {
    __New(name, description, filter = "", query = "*:*")
    {
        jqArgs := "#broq-filter=.response.docs[]|{name:._name,id:._uniqueid,path:._fullpath} "
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

