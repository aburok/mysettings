MyGui := null

    ShowSplash(title, text){
        global MyGui := Gui(, title)
        MyGui.Opt("+AlwaysOnTop +Disabled -SysMenu +Owner") ; +Owner avoids a taskbar button.
        MyGui.Add("Text",, text)
        MyGui.Show("NoActivate") ; NoActivate avoids deactivating the currently active window.
    }