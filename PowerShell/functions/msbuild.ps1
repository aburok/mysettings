function build-WebProject(
    [string] $projectPath,
    [string] $config, 
    [string] $outputPath,
    [string] $websiteName){

        if(Test-Path($outputPath)){

        Remove-Item $outputPath -Force -Recurse
Stop-WebSite $websiteName
Stop-WebAppPool $websiteName
        }

    . "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" `
        $projectPath `
        "/p:Configuration=""$config""" `
        "/p:OutputPath=$outputPath"
}

function build-WebProjectDowtk(){
    build-WebProject `
        -projectPath "src/FatMedia.Dowtk.Cms.Website/FatMedia.Dowtk.Cms.Website.csproj" `
        -config "Staging" `
        -outputPath "d:\CogWorks\dwk0246-0707-day-out-with-the-kids-website_varia\TestBuild"
}