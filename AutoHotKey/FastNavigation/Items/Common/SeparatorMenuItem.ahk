class SeparatorMenuItem extends NavigationItem {
    __New(){
        base.__New("%", "Separator")
    }

    FormatItemText(){
        return " ========================= "
    }

    AddItem(){
        return
    }
}
