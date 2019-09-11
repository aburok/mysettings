class CopyPropertyMenuItem extends NavigationItem {
    __New(letter, description, property){
        base.__New(letter, description)
        this.PropertyName := property
        this.GuidFormatter := new GuidFormatter()
    }

    GetRootValue(){
        property := this.PropertyName
        obj := this.Root.Item
        value := obj[property]
        Log("Copying property [{1}] Value: [{2}], Root: {3}", [property, value, this.Root.Description])
        return value
    }

    FormatItemText(){
        return Format("{1} -> {2} [{3}]", this.letter, this.Description, this.GetRootValue())
    }

    ActivateItem(){
        value := this.GetRootValue()
        if(value <> ""){
            if(this.GuidFormatter.IsGuid(value)){
                value:= this.GuidFormatter.Format(value)
            }

            Clipboard := value
            ;MsgBox, % Format("{1} : {2}", this.Description, value)
            return
        }
        MsgBox, % "Unable to copy property " . this.PropertyName . " from Root"
        Log("Unable to copy property {1} from Root", [this.PropertyName])
    }
}

