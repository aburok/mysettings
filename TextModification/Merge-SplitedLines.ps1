. .\Replace-RegexPatternWithCheck.ps1

$splittedParagraph = '(?:\S\-)?</p>\s+<p class="calibre1">([a-z])'

function MergeInner (
    [string]  $content,
    $matches) {

    $firstGroup = $matches.Groups[1]
    $index = $matches.Index
    $value = $matches.Value
    $valueLength = $matches.Groups[0].Value.Length

    $content = $content.Remove($index, $valueLength).Insert($index, " $firstGroup") 

    return $content
}

function Merge-SplitedLines ($content) {
    Replace-RegexPatternWithCheck $content $splittedParagraph `
        $Function:MergeInner
}