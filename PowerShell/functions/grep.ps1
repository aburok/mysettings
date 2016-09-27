function grep-Tree([string]$pattern){
    ls . -recurse | Select-String $pattern -SimpleMatch -Context 1,1
}

