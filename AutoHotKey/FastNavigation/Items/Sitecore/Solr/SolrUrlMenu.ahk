class SolrUrlMenu extends WebsiteMenuItem {
    __New(letter, description, solrPath = "/#/sitecore_master_index/query"){
        format := "{1}/solr" . solrPath
        base.__New(letter, description, format)
    }

    GetFormatArgs(){
        return [this.Root.Environment.Solr]
    }

    SetFilter(filter){

    }
}
