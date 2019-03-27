class EnvironmentNavigationItem extends NavigationItem {
    __New(environment){
        letter := environment.titlePrefix
        StringLower, letter, letter
        base.__New(letter, environment.name)
        this.Environment := environment
    }

    BeforeActivation() {
        this.Root.Environment := this.Environment
        Log("Setting Edit Environment to : {1}, Root Name {2}", [this.Root.Environment.EditDomain, this.Root.Description])
    }
}

