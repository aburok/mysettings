SlugifyText(Text){
    Slug := RegExReplace(Text, "[\]\[]" , "")
    Slug := Trim(Slug)
    Slug := RegExReplace(Slug, "\W+" , "-")
    Slug := Trim(Slug, " .,-!?")
    return Slug
}


StringJoin(array, delimiter = ";")
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

    Loop, parse, vText, `n, `r
    {
        result := result . character . " " . %A_LoopField%
    }

    resultText := StringJoin(vText, "`n`r".character)
    MsgBox, resultText

    return resultText
}

UnEscape_Chars(string){
    StringReplace string, string, file:///, , All
    StringReplace string, string, `%20, `  , All
    StringReplace string, string, `/, `\, All
    return string
}
