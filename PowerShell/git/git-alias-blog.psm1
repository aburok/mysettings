
#################################################################################
################################# BLOG Scripts  #################################
#################################################################################

Function git-GetAllRemoteBranches {
    iex "git branch -r"                                <# get all remote branches #> `
        | % { $_ -Match "origin\/(?'name'\S+)" }       <# select only names of the branches #> `
        | % { Out-Null; $matches['name'] }              <# write does names #>
}

Function git-CheckoutAllBranches {
    git-GetAllRemoteBranches `
        | % { iex "git checkout $_" }                  <# execute ' git checkout <branch>' #>
}

Function git-MergeMasterToAll {
    git-GetAllRemoteBranches `
        | % { iex "git checkout $_"; <# checkout branch that will be merged with master #> `
            iex "git merge master"; <# merge master branch into branch #> `
            iex "git push origin $_"; }    <# push merge into origin #>

    git-checkoutMaster
}
