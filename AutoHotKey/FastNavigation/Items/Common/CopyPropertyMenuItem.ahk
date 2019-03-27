class CopyPropertyMenuItem extends NavigationItem {
    __New(letter, description, property){
        base.__New(letter, description)
        this.PropertyName := property
    }

    ActivateItem(){
        property := this.PropertyName
        obj := this.Root.Item
        value := obj[property]
        Log("Copying property [{1}] from Parent [{2}], Parent:{3}", [property, value, obj.Description])
        Clipboard := value
        MsgBox, % Format("{1} : {2}", this.Description, value)
    }
}

