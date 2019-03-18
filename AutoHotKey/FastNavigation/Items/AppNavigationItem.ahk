class AppMenuLevel extends MenuLevel {

    ActivateItem(){
        Log("Activate Item {1} -> {2} {3}", [this.Letter, this.TitlePattern, this.Description])
        exists := WinExist("" . this.TitlePattern)
        if exists
            WinActivate
        return
    }
}
