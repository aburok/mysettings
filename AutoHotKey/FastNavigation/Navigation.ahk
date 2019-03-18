#Include %A_ScriptDir%\FastNavigation\NavigationItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\AppNavigationItem.ahk

class FastNavigation {
    __New(rootItem){
        this.rootItem := rootItem
        rootItem.Root := this

        this.Context := {}
    }

}
