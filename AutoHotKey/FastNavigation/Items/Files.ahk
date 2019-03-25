
class LatestFileOpenerNavigationItem extends NavigationItem
{
    __New(letter, description, dir, filePattern){
        base.__New(letter, description)
        this.Dir := dir
        this.FilePattern := filePattern
    }

    ActivateItem(){
        FindLatestFileAndOpen(this.Dir, this.FilePattern)
    }
}
