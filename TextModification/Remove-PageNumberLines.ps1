. .\Replace-RegexPatternWithCheck.ps1

$pageNumberInNewLine = '<p class="calibre1">\d+</p>'

function Inner ($content) {
    $content = $content.Remove($index, $valueLength) 
    return $content
}

function Remove-PageNumberLines ($content) {

    Replace-RegexPatternWithCheck $content `
        $splittedParagraph `
        $Function:Inner

}