
;See msgbox-creator , example from user 'Thalon' :
;https://autohotkey.com/boards/viewtopic.php?p=41708#p41708

;- Example GUI > MSGBOX
;pr1=%a_programfiles%\AUTOHOTKEY\AutoHotkey.chm
MyGui := Gui()
MyGui.Add("Text",, "Please enter your name:")
MyGui.AddEdit("vName")
MyGui.Add("Button", "default", "Send Virtual Key").OnEvent("Click", ProcessUserInput)
MyGui.Show()

ProcessUserInput(*)
{
    Send("{vk1}")
}
;=================================================================