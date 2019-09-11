class RecentItemsViewer {
    __New(configPath){
        Log("RecentItemsViewer constructor", [])
        this.Config := new Configuration(configPath)
        this.fileName := "C:/MerckItems.txt"
    }

    GetItem(newItemText){
        for index, item in this.recentItems
        {
            if(item.ItemId = newItem.ItemId){
                return item
            }
        }
        return ""
    }

    ParseClipboardItem(){
        pattern := "Oi)" . this.Config.Common.Patterns.Info
        Position := RegExMatch(Clipboard, pattern, OutputVar)

        if(Position = 0) {
            return
        }

        this.LoadRecentItems()
        itemText := OutputVar.Value[1]
        newItem := Jxon_Load(newItemText)

        existingItem := this.GetItem(itemText)

        if(existingItem = ""){
            newEntry := this.CreateRecentItem(newItem)
            this.recentItems.Push(newEntry)
        } else {
            FormatTime, currentDate
            existingItem.lastViewed :=  currentDate
        }
        this.StoreItems()
    }


    CreateRecentItem(itemInfo){
        FormatTime, currentDate

        entry := { }
        entry.item := itemInfo
        entry.lastViewed := currentDate

        return entry
    }

    LoadRecentItems(){
        file := FileOpen(this.fileName, "r")
        this.itemJson := file.Read()
        file.Close()
        if(this.itemJson = ""){
            this.itemJson := "{""items"" : []}"
        }
        try {
            this.recentItems := Jxon_Load(this.itemJson)
        } catch e {
            this.itemJson := "{""items"" : []}"
        }
        this.recentItems := Jxon_Load(this.itemJson)
    }

    StoreItems(){
        this.itemsJson := Jxon_Dump(this.recentItems)
        file := FileOpen("C:/MerckItems.txt", "w")
        file.Write(this.itemsJson)
        file.Close()
    }

    DisplayItem(item){
        return Format("{1} -> {2}", item.ItemId, item.itemName)
    }

    FormatItemList(){
        For index, entry in this.recentItems.items
        {
            text .= this.DisplayItem(entry) . "`n"
        }
        this.itemsFormatted := text
        return text
    }

    SelectItemToDisplay(){
        INPUT, command, T60 L2, {Esc}
        position := RegExMatch(command, "^\d+\s*$")

        Log("Past id of Item number : {1}, positioon {2}", [command, position])

        if(position > 0){
            command:= Trim(command)
            item := this.recentItems.items[command]
            this.Root.Item := item
        }
    }

    ShowDialog(){
        Log("Show recent items dialog", [])
        this.LoadRecentItems()
        text := this.FormatItemList()
        Log("items : {1}", [text])
        SplashTextOn, 1200, 800, MerckItems, % text
        this.SelectItemToDisplay()
        SplashTextOff
    }

    DisplayRecentItems(){
        text := Format("{{}{1}-{2}-{3}-{4}-{5}{}}", 1, 2, 3, 4, 5)

        Log("{1}", [this.Config.Common.Patterns.Info])
    }

}
