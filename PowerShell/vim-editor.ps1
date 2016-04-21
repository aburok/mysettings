$SCRIPTPATH = "C:\Dropbox\Tools"
$VIMPATH    = $SCRIPTPATH + "\vim73-zlib-win32\vim.exe"

Set-Alias vi   $VIMPATH
Set-Alias vim  $VIMPATH

# for editing your PowerShell profile
Function Edit-Profile
{
    vim $profile
}

# for editing your Vim settings
Function Edit-Vimrc
{
    vim $home\_vimrc
}


