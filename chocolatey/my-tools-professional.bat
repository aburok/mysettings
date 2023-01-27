 @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

" choco install sigil 

choco install azure-data-studio --confirm
choco install ssms --confirm
choco install sqlpackage --confirm

choco install pwsh --confirm

choco install firefox --confirm

choco install mongodb --confirm
choco install robo3t --confirm

choco install dotnetcore-sdk --confirm
choco install dotnet-5.0-sdk --confirm
choco install dotnetcore-2.1-sdk-7xx --confirm
choco install resharper --confirm
choco install dotultimate --confirm --params "'/NoCpp /NoTeamCityAddin /NoDotCover'"
choco install visualstudio2019enterprise --confirm

choco install nuget.commandline --confirm

choco install sysinternals --confirm
choco install AzureStorageExplorer --confirm
choco install nodejs --confirm

choco install kubernetes-cli --confirm
choco install kubectx --confirm
choco install kubens --confirm
choco install kubelogin --confirm

choco install seq --confirm
choco install azure-cli --confirm
choco install mc --confirm
choco install DacFx-18 --confirm
choco install fiddler --confirm
choco install postman --confirm
choco install servicebusexplorer --confirm
choco install k9s --confirm


" tool to switch between opened applications"
choco install switcheroo

" fuzzy search for windows powershell
choco install fzf

" App that remins about breaks from work"
choco install stretchly