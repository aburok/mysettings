class GuidFormatter {
    static guidRegex := "i)^[\s\{\(]*([\da-f]{8})-?([\da-f]{4})-?([\da-f]{4})-?([\da-f]{4})-?([\da-f]{12})[\)\}\s]*$"
    ; https://docs.microsoft.com/pl-pl/dotnet/api/system.guid.tostring?view=netframework-4.7.2
    static NFormat := "{1}{2}{3}{4}{5}"
    static BFormat := "{{}{1}-{2}-{3}-{4}-{5}{}}"
    static DFormat := "{1}-{2}-{3}-{4}-{5}"
    static PFormat := "({1}-{2}-{3}-{4}-{5})"
    static XFormat := "{1}x{2}x{3}x{4}x{5}"

    IsGuid(guidAsText){
        position := RegExMatch(guidAsText, GuidFormatter.guidRegex)

        return position > 0
    }

    Format(guidAsText, outputFormat :=  "{1}-{2}-{3}-{4}-{5}"){
        position := RegExMatch(guidAsText, GuidFormatter.guidRegex, &guidMatch)

        if(position = 0){
            return ""
        }

        formatted := Format(outputFormat, guidMatch.Value[1], guidMatch.Value[2], guidMatch.Value[3], guidMatch.Value[4], guidMatch.Value[5])
        return formatted
    }
}
