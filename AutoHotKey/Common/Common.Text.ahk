SlugifyText(Text){
    Slug := RegExReplace(Text, "[\]\[]" , "")
    Slug := Trim(Slug)
    Slug := RegExReplace(Slug, "\W+" , "-")
    Slug := Trim(Slug, " .,-!?")
    return Slug
}

StringJoin(array, delimiter := ";")
{
    text := ""
    for index, element in array
    {
        if(index < array.Length()){
            text .= element . delimiter
        }
    }
    text .= element
    return text
}

InsertCharacterAtStart(vText, character){
    result := ""

    Loop Parse, vText, "`n", "`r"
    {
        result := result . character . " " . %A_LoopField%
    }

    resultText := StringJoin(vText, "`n`r".character)
    MsgBox( resultText )

    return resultText
}

UnEscape_Chars(string){
    string := StrReplace (string, "file:///", "")
    string := StrReplace ( string, "`%20", "` " )
    string := StrReplace ( string, "`/", "`\")
    return string
}
