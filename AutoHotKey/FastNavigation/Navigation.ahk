class FastNavigation extends NavigationItem{
    __New(shortcut, description){
        base.__New(shortcut, description)

        this.rootItem := rootItem
        this.Root := this

        this.Context := {}
    }
}
