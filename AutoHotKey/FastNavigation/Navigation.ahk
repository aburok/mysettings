
class FastNavigation extends NavigationItem{
    __New(rootItem){
        this.rootItem := rootItem
        rootItem.Root := this

        this.Context := {}
    }

}
