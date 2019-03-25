class AppPoolRecycleMenu extends CmdNavigationItem {
    __New(letter, appPool){
        description := Format("Recycle {1} AppPool.", appPool)
        base.__New(letter, description)
        this.AppPool := appPool
    }

    GetCommand(){
        return  Format("C:\Windows\System32\inetsrv\appcmd recycle apppool /apppool.name:'{1}'", this.AppPool)
    }

    ActivateItem(){
        MsgBox, 4, , "Recycle appPool"
        IfMsgBox No
            return
        base.ActivateItem()
    }
}
