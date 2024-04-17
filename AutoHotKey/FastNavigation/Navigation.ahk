#Include %A_ScriptDir%\FastNavigation\NavigationItem.ahk
; #Include %A_ScriptDir%\FastNavigation\ConfigurationReader.ahk
#Include %A_ScriptDir%\FastNavigation\Items\CopyFilePathNavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Common.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Web\Web.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Files.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Shell.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Text\HeaderFormat.ahk

Log("script path {1}", [A_ScriptDir])

class FastNavigation extends NavigationItem{
    __New(shortcut, description, configPath){
        super.__New(shortcut, description)

        this.rootItem := super.rootItem
        this.Root := this

        this.Context := {}
        ; this.titleParse := WindowTitleParser()

        this.ConfigPath := configPath
        ; this.Config := ConfigurationReader(configPath)

    }

    AddAllEnvironments(editItems){
    }

    AddCommonPages()
    {

    }
}
