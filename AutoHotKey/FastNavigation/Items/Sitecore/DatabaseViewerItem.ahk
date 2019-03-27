class DatabaseViewerItem extends SitecoreItemMenuItem {
    __New(letter, description) {
        format := "{1}/sitecore/admin/dbbrowser.aspx?db=master&lang=en&id={2}"
        base.__New(letter, description, format)
    }
}

