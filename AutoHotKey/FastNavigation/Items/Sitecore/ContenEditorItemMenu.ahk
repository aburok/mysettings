class ContenEditorItemMenu extends SitecoreItemMenuItem {
    __New(name, description, itemId = "") {
        format :=  "{1}/sitecore/shell/Applications/Content`%20Editor.aspx?sc_bw=1&sc_lang=en"
        if(itemId){
            format .=  "&fo={2}&sc_content=master"
        }
        base.__New(name, description, format, itemId)
    }
}
