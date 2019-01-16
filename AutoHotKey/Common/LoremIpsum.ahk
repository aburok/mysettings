GenerateLoremIpsum()
{
    InputBox, paragraphNumber, Enter number of paragraphs you want to generate:

    FileRead, LoremIpsumText, C:\mysettings\AutoHotKey\Common\LoremIpsum.txt

    paragraphs:=StrSplit(LoremIpsumText, "`n")

    if (ErrorLevel = 0){
        LineCount:=0
        result:=""
        paragraphEnd:= paragraphNumber + 0

        line:=""
        for index, paragraph in paragraphs
        {
            result .= paragraph "`n"
            LineCount:=LineCount + 1

            if(index >= paragraphEnd){
                break
            }
        }

        Clipboard:=result
        ; Send ^v
    }

}