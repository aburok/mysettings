param(
    [string] $file,
    [string] $pattern = "*.html"
)

. .\Merge-SplitedLines.ps1
. .\Remove-PageNumberLines.ps1

$pathToFile = Split-Path $file
$fileName = Split-Path $file -Leaf
$fileNameWithoutExt = [io.path]::GetFileNameWithoutExtension($fileName)
$fileExtension = [io.path]::GetExtension($fileName)

$outputDir = Join-Path $pathToFile $fileNameWithoutExt
$modifiedFileZip = Join-Path $pathToFile "$fileNameWithoutExt.modified.zip"

if(Test-Path $outputDir){
    Remove-Item $outputDir -Force -Recurse
}

New-Item $outputDir -ItemType Directory

Copy-Item -Path $file -Destination $modifiedFileZip
Expand-Archive -Path $modifiedFileZip -DestinationPath $outputDir  

$pageNumberAtEndOfLine = '\s+\d+</p>'
$multipleSpaces = '-\s{2,}'
$removeEmptyLinks = '<a id="142"></a>'

$patterns = @($pageNumberAtEndOfLine, $pageNumberInNewLine, $multipleSpaces)

Get-ChildItem $outputDir -Recurse -Filter $pattern |
ForEach-Object {
    Write-Host "======================================"
    Write-Host "Checking file : $(Split-Path $_ -Leaf)"

    $content = Get-Content -Path $_.FullName -Raw -Encoding UTF8

    Write-Host "Content count : $(($content | Measure-Object ).count) lines"

    $content = Merge-SplitedLines($content)
    $content = Remove-PageNumberLines($content)

    # $content -replace $splittedParagraph, $splittedParagraphReplace | Write-Host
}

Compress-Archive -Path $outputDir -DestinationPath $modifiedFileZip -Force

Rename-Item -NewName ( [io.path]::ChangeExtension($modifiedFileZip, "epub")) `
    -Path $modifiedFileZip
