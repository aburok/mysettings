class SeparatorMenuItem extends NavigationItem {
    __New(){
        super.__New("%", "Separator")
    }

    FormatItemText(){
        return " ========================= "
    }

    AddItem(){
        return
    }
}
