class GuidFormatter {
    static guidRegex := "Oi)^[{(]?([0-9A-Fa-f]{8})[-]?([0-9A-Fa-f]{4})[-]?([0-9A-Fa-f]{4})[-]?([0-9A-Fa-f]{4})[-]?([0-9A-Fa-f]{12})[)}]?$"
    ; https://docs.microsoft.com/pl-pl/dotnet/api/system.guid.tostring?view=netframework-4.7.2
    static NFormat := "{1}{2}{3}{4}{5}"
    static BFormat := "{{}{1}-{2}-{3}-{4}-{5}{}}"
    static DFormat := "{1}-{2}-{3}-{4}-{5}"
    static PFormat := "({1}-{2}-{3}-{4}-{5})"
    static XFormat := "{1}x{2}x{3}x{4}x{5}"

    IsGuid(guidAsText){
        position := RegExMatch(guidAsText, this.guidRegex, guidMatch)

        return position > 0
    }

    Format(guidAsText, outputFormat =  "{1}-{2}-{3}-{4}-{5}"){
        position := RegExMatch(guidAsText, this.guidRegex, guidMatch)

        if(position = 0){
            return ""
        }

        formatted := Format(outputFormat, guidMatch.Value[1], guidMatch.Value[2], guidMatch.Value[3], guidMatch.Value[4], guidMatch.Value[5])
        return formatted
    }
}
