
+!s::
    Input, command, L1 T2

    if (command = "h"){
        WinGetTitle JiraIssueTitle, A
        ; JiraIssueTitle := Trim(Clipboard)
        Slug := StrReplace(JiraIssueTitle, " - JIRA Infusion - Google Chrome", "")
        Clipboard := SlugifyText(Slug)
    }
    else if (command = "c"){
        Send ^c
        Sleep 50
        Clipboard := SlugifyText(Clipboard)
    }

    
return

SlugifyText(Text){
    Slug := RegExReplace(Text, "[\]\[]" , "")
    Slug := Trim(Slug)
    Slug := RegExReplace(Slug, "\W+" , "-")
    return Slug
}
