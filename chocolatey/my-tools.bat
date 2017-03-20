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

cinst linqpad4

cinst keepass

 cinst gimp

cinst procexp

cinst autohotkey.portable

cinst xmind

cinst truecrypt

choco install sigil 