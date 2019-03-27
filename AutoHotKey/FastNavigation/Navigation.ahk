#Include %A_ScriptDir%\FastNavigation\NavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\AppNavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Common.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\CopyPropertyMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\GuidMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\SeparatorMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Web.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Files.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Shell.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Iis.ahk
#Include %A_ScriptDir%\FastNavigation\Items\AddressChangeItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Sitecore.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Solr.ahk

class FastNavigation extends NavigationItem{
    __New(shortcut, description){
        base.__New(shortcut, description)

        this.rootItem := rootItem
        this.Root := this

        this.Context := {}
    }
}
