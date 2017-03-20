function Replace-RegexPatternWithCheck (
    [string] $content,
    [string] $regexPattern,
    [scriptblock] $action) {

    # $content | {$_ -match $splittedParagraph} | Write-Host 
    $matches = [regex]::Match($content, $regexPattern)

    While ($matches.Index -gt 0) {
        $firstGroup = $matches.Groups[1]
        $index = $matches.Index
        $value = $matches.Value
        $valueLength = $matches.Groups[0].Value.Length

        Write-Host "Index = $index, length = $valueLength"
        # Write-Host "Group Count $($matches.Groups.Length)"
        # Write-Host "Group 0 = [$($matches.Groups[0])]"
        # Write-Host "Group 1 = [$firstGroup]"

        Write-Host $content.Substring($index - 30, $valueLength + 60) `
            -ForegroundColor Yellow

        $content = $action.Invoke($content, $matches)

        Write-Host $content.Substring($index - 30, $valueLength + 60) `
            -ForegroundColor Green

        # Read-Host 

        $matches = [regex]::Match($content, $regexPattern)
    }

    return $content
}