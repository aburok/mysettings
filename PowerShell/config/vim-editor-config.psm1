
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

$editWithGVimOptions = 
Function Edit-Gvim([string] $file){
    $command = ("gvim.exe -p --remote-tab-silent '{0}' %*" -f $file)
    Invoke-Expression -Command $command
}
Set-Alias gvim Edit-Gvim

Copy-IfMissing ($env:DropboxSettingsVim + "\host_vimrc") ($env:USERPROFILE + "\_vimrc")
Copy-IfMissing ($env:DropboxSettingsVim + "\host_gvimrc") ($env:USERPROFILE + "\_gvimrc")
Copy-IfMissing ($env:DropboxSettingsVim + "\host_vsvimrc") ($env:USERPROFILE + "\_vsvimrc")

Set-Alias vi   $env:Vim
Set-Alias vim  $env:Vim


