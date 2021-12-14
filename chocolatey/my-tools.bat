 @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin


cinst git.install

cinst notepadplusplus.install

cinst 7zip.install
cinst 7zip.commandline

cinst vim

cinst GoogleChrome

cinst nodejs.install

cinst vlc


cinst python


cinst ccleaner

cinst console2

cinst filezilla


cinst paint.net

cinst virtualbox

cinst phantomjs

cinst DotNet4.5

cinst windirstat

cinst ConEmu

cinst keepass

 cinst gimp

cinst procexp

cinst autohotkey.portable

cinst xmind

cinst truecrypt

choco install sigil 

choco install jing

choco install autohotkey --confirm
choco install microsoft-windows-terminal --confirm
choco install brave --confirm
choco install tidal --confirm
choco install onedrive --confirm
choco install keepass --confirm
choco install totalcommander --confirm
choco install notepadplusplus --confirm
choco install vim --confirm
choco install copyq --confirm
choco install vscode --confirm
choco install azure-data-studio --confirm
choco install ssms --confirm
choco install sqlpackage --confirm
choco install pwsh --confirm
choco install onenote --confirm
choco install git --confirm
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
choco install 7zip --confirm
choco install sysinternals --confirm
choco install AzureStorageExplorer --confirm
choco install nodejs --confirm
choco install kubernetes-cli --confirm
choco install kubectx --confirm
choco install kubens --confirm
choco install kubelogin --confirm
choco install lens --confirm
choco install mongodb-database-tools --confirm
choco install seq --confirm
choco install azure-cli --confirm
choco install mc --confirm
choco install DacFx-18 --confirm
choco install fiddler --confirm
choco install postman --confirm
choco install servicebusexplorer --confirm
choco install k9s --confirm

winget install JanDeDobbeleer.OhMyPosh