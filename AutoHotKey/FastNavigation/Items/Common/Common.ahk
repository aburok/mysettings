#Include %A_ScriptDir%\Common\Guid\GuidFormatter.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\SeparatorMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\WindowTitleParser.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\CopyPropertyMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Guid\GuidMenuItem.ahk
#Include %A_ScriptDir%\FastNavigation\Items\Common\Guid\GuidFormatMenuItem.ahk
; #Include %A_ScriptDir%\FastNavigation\Items\Common\EnvironmentNavigationItem.ahk


GetGuidFormat(letter){
    guidMenu := GuidMenuItem(letter, "Format guid from clipboard")
        .AddItem(GuidFormatMenuItem("b", GuidFormatter.BFormat))
        .AddItem(GuidFormatMenuItem("d", GuidFormatter.DFormat))
        .AddItem(GuidFormatMenuItem("n", GuidFormatter.NFormat))
        .AddItem(GuidFormatMenuItem("x", GuidFormatter.XFormat))
        
    return guidMenu
}


class TranslateItem extends NavigationItem {
    __New(letter){
        this.UrlFormat := "https://translate.google.com/?rlz=1C1CHBF_enPL813PL813&um=1&ie=UTF-8&hl=pl&client=tw-ob#view=home&op=translate&sl=en&tl={1}&text={2}"
        super.__New(letter, "Translate word from english to ...")
    }

    ActivateItem(){
        WordToTranslate := InputBox( "Insert Word to translate")
        Language := InputBox (" Insert destination language ")

        url := Format(this.UrlFormat, Language, WordToTranslate)
        Chrome(url)
    }
}

; class TimeItem extends NavigationItem {

;     __New(letter, timeZone){
;         super.__New(letter, guidFormat)
;         this.TimeZone := timeZone
;     }

;     FormatGuid(){
;         guidToFormat := this.Parent.GuidToFormat
;         Log("GUid to format {1}, format {2}", [guidToFormat, this.GuidFormat])
;         formatted := this.GuidFormatter.Format(guidToFormat, this.GuidFormat)
;         return formatted
;     }

;     ActivateItem(){
;         formatted := this.FormatGuid()
;         A_Clipboard:= formatted
;         ;SendInput {Raw}%formatted%
;     }

;     FormatItemText(){
;         guidText := this.FormatGuid()
;         return Format("{1} - {2}", this.letter, guidText)
;     }
; }
