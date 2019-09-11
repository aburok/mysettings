class WindowTitleParser {
    GetInfo(pattern = ""){
        WinGetTitle WinTitle, A

        if(pattern <> ""){
            itemInfoText := this._Match(WinTitle, pattern)
        } else {
            itemInfoText := WinTitle
        }
        item := this._DeserializeInfo(itemInfoText)
        return item
    }

    _Match(haystack, pattern){
        pattern := "Oi)" . pattern
        Position := RegExMatch(haystack, pattern, MatchVar)
        Log("Pattern : {1} Match: {2} ", [pattern, MatchVar.Value[1]])
        if(Position > 0){
            return Trim(MatchVar.Value[1])
        }
        return ""
    }

    _DeserializeInfo(itemInfoText){
        Log("Parsing itemInfoText {1}" , [itemInfoText])
        try {
            item := Jxon_Load(itemInfoText)
        } catch {
        item := ""
        }
        return item
    }
}

