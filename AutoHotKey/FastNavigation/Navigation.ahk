#Include %A_ScriptDir%\FastNavigation\NavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\AppNavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Common.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Web\Web.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Files.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Shell.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Sitecore\Sitecore.ahk

Log("script path {1}", [%A_ScriptDir%])

class FastNavigation extends NavigationItem{
    __New(shortcut, description){
        base.__New(shortcut, description)

        this.rootItem := rootItem
        this.Root := this

        this.Context := {}
    }
}
