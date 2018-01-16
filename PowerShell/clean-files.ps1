function Remove-AllPackageFolders (
    [switch] $remove,
    [string] $pathToRemove = ".\") {

    $foldersToRemove =  "^.*\\packages$", 
    "^.*\\node-modules$",
    "^.*\\bower_components$", 
    "^.*\\bin$", "^.*\\obj$"

    Write-Host "Finding directories inside $pathToRemove path..."
    $foldersToRemove |
    ForEach-Object {
        Write-Host "Finding files for $_ pattern"
        Remove-FoldersThatMatchPattern `
        -path $pathToRemove `
        -pattern $_  `
        -remove:$remove.IsPresent    
    }
}

function Remove-FoldersThatMatchPattern (
    [switch] $remove,
    [string] $path = ".\", 
    [string] $pattern) {

    $files = Get-ListOfFoldersThatMatchPattern  -path $path -pattern $pattern 
    $totalSize =0

    $files | 
    ForEach-Object {
        Write-Host "Path: '$_'" 
    }  

    if($remove){
        $files | ForEach-Object { Remove-Item $_ -Recurse -Force  }
    }
}

function Get-ListOfFoldersThatMatchPattern (
    [string] $path,
    [string] $pattern) {

    Get-ChildItem $path -Directory -Recurse |
    Where-Object { $_.FullName -match $pattern } |
    ForEach-Object {$_.FullName} 
}