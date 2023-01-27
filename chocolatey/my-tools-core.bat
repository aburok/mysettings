@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
winget install JanDeDobbeleer.OhMyPosh

choco install autohotkey --confirm
choco install microsoft-windows-terminal --confirm
choco install tidal --confirm
choco install onedrive --confirm
choco install keepass --confirm
choco install notepadplusplus --confirm
choco install vim --confirm
choco install copyq --confirm
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