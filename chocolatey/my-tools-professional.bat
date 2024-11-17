 @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

" choco install sigil 

@REM choco install azure-data-studio --confirm
winget install ssms --confirm
@REM choco install sqlpackage --confirm

@REM choco install pwsh --confirm

winget install firefox --confirm

@REM choco install mongodb --confirm
@REM choco install robo3t --confirm

winget install dotnetcore-sdk --confirm
@REM choco install dotnet-5.0-sdk --confirm
@REM choco install dotnetcore-2.1-sdk-7xx --confirm
@REM choco install resharper --confirm
choco install dotultimate --confirm --params "'/NoCpp /NoTeamCityAddin /NoDotCover'"
@REM choco install visualstudio2019enterprise --confirm

@REM choco install nuget.commandline --confirm

choco install sysinternals --confirm
@REM choco install AzureStorageExplorer --confirm
@REM choco install nodejs --confirm

@REM choco install kubernetes-cli --confirm
@REM choco install kubectx --confirm
@REM choco install kubens --confirm
@REM choco install kubelogin --confirm

choco install seq --confirm
@REM choco install azure-cli --confirm
choco install mc --confirm
choco install DacFx-18 --confirm
@REM choco install fiddler --confirm
@REM choco install postman --confirm
@REM choco install servicebusexplorer --confirm
choco install k9s --confirm


@REM " tool to switch between opened applications"
@REM choco install switcheroo
