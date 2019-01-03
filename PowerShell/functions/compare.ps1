function Compare-Directories(
    [string] $originalPath,
    [string] $referencePath,
    [string] $exclude
) {
    $exclude = "App_Data"

    $fso = Get-ChildItem -Recurse `
        -path $originalPath `
        | Where-Object { $_.FullName -notmatch $exclude }

    $fsoBU = Get-ChildItem -Recurse `
        -path $referencePath `
        | Where-Object { $_.FullName -notmatch $exclude }

    Compare-Object -ReferenceObject $fso -DifferenceObject $fsoBU
}