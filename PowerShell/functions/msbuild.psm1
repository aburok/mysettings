function build-WebProject(
    [string] $projectPath,
    [string] $config, 
    [string] $outputPath,
    [string] $websiteName) {

    if (Test-Path($outputPath)) {

        Remove-Item $outputPath -Force -Recurse
        Stop-WebSite $websiteName
        Stop-WebAppPool $websiteName
    }

    . "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" `
        $projectPath `
        "/p:Configuration=""$config""" `
        "/p:OutputPath=$outputPath"
}

function build-WebProjectDowtk() {
    build-WebProject `
        -projectPath "src/FatMedia.Dowtk.Cms.Website/FatMedia.Dowtk.Cms.Website.csproj" `
        -config "Staging" `
        -outputPath "d:\CogWorks\dwk0246-0707-day-out-with-the-kids-website_varia\TestBuild"
}

function Transform-Configs($xml, $xdt) {
    if (!$xml -or !(Test-Path -path $xml -PathType Leaf)) {
        throw "File not found. $xml";
    }
    if (!$xdt -or !(Test-Path -path $xdt -PathType Leaf)) {
        throw "File not found. $xdt";
    }

    $scriptPath = (Get-Variable MyInvocation -Scope 1).Value.InvocationName | split-path -parent
    Add-Type -LiteralPath "$scriptPath\Microsoft.Web.XmlTransform.dll"

    $xmldoc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument;
    $xmldoc.PreserveWhitespace = $true
    $xmldoc.Load($xml);

    $transf = New-Object Microsoft.Web.XmlTransform.XmlTransformation($xdt);
    if ($transf.Apply($xmldoc) -eq $false) {
        throw "Transformation failed."
    }
    $xmldoc.Save($xml);
}

function Delete-ConfigTransforms() {
    # $configPrefixes = @( "web", "connectionStrings", "ExamineSettings" )

    $configurations = @( "Dev", "Staging", "Client-Staging", "Pre-Prod", "Live")
    $configName = $configurations | ForEach-Object { "*.$_.config" }

    $configTransforms = Get-ChildItem .\ `
        -Include $configName `
        -Recurse

    $configTransforms | ForEach-Object {
        $fileName = $_.FullName
        Write-Host "Removing configuration transform file: $ileName"
        Remove-Item $ileName `
            -Force `
            -WhatIf
    }
}