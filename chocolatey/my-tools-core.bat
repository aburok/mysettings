@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
winget install JanDeDobbeleer.OhMyPosh

winget install autohotkey --confirm
winget install microsoft-windows-terminal --confirm
choco install onedrive --confirm
winget install keepass --confirm
winget install notepadplusplus --confirm
choco install vim --confirm
winget install hluk.CopyQ --confirm
choco install vscode --confirm
choco install pwsh --confirm
choco install onenote --confirm
choco install git --confirm
choco install gitextensions --confirm
choco install tortoisegit --confirm
choco install firefox --confirm
choco install 7zip --confirm

choco install seq --confirm
choco install mc --confirm
choco install postman --confirm

" tool to switch between opened applications"
choco install switcheroo --confirm

" fuzzy search for windows powershell
choco install fzf --confirm

" App that remins about breaks from work"
choco install stretchly --confirm