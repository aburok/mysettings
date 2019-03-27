#Include %A_ScriptDir%\FastNavigation\Items\Common\SeparatorMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\CopyPropertyMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Guid\GuidMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Guid\GuidFormatMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\EnvironmentNavigationItem.ahk


GetGuidFormat(){
    guidMenu := new GuidMenuItem("g", "Format guid from clipboard")
        .AddItem(new GuidFormatMenuItem("b", GuidFormatter.BFormat))
        .AddItem(new GuidFormatMenuItem("d", GuidFormatter.DFormat))
        .AddItem(new GuidFormatMenuItem("n", GuidFormatter.NFormat))
        .AddItem(new GuidFormatMenuItem("x", GuidFormatter.XFormat))
        return guidMenu
}

GetYankMenu(){
    yankMenu := new CopyIdFromTitleNavigationItem("y", "Parse Ids from title")
        .AddItem(new CopyPropertyMenuItem("i", "ID - Copy id from title", "Id"))
        .AddItem(new CopyPropertyMenuItem("t", "Template ID - Copy template id from title", "TemplateId"))
        .AddItem(new CopyPropertyMenuItem("p", "Path - Copy path from title", "Path"))
        .AddItem(new CopyPropertyMenuItem("l", "Language - Copy language from title", "Lang"))
        .AddItem(new CopyPropertyMenuItem("n", "Name - Copy item name", "Name"))
        .AddItem(new CopyPropertyMenuItem("m", "Copy Media Id from title", "MediaId"))

    return yankMenu
}



