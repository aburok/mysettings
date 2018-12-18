function Search-Text ([string] $text, [string] $filePattern){
    if(!$filePattern){
        $filePattern = "*.*"
    }
    if(!$text){
        Write-Err "Please provide pattern to look for"
        return
    }

    Get-ChildItem -Recurse -Filter $filePattern `
        | Select-String -Pattern $text
}