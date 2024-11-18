@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
winget install JanDeDobbeleer.OhMyPosh

winget install autohotkey --confirm
winget install microsoft-windows-terminal --confirm
@REM choco install onedrive --confirm
winget install keepass --confirm
winget install notepadplusplus --confirm
winget install vim --confirm
winget install hluk.CopyQ --confirm
winget install -e --id Stretchly.Stretchly
winget install vscode --confirm
@REM choco install pwsh --confirm
@REM choco install onenote --confirm
winget install git --confirm
@REM choco install gitextensions --confirm
@REM choco install tortoisegit --confirm
winget install firefox --confirm
winget install 7zip --confirm

@REM choco install seq --confirm
@REM choco install mc --confirm
@REM choco install postman --confirm

" tool to switch between opened applications"
@REM choco install switcheroo --confirm

" fuzzy search for windows powershell
winget install fzf --confirm


@REM config
@REM https://superuser.com/questions/1667853/how-to-change-the-location-of-settings-json-file-in-windows-terminal
mklink /d %LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState C:\mysettings\WindowsTerminal\LocalState