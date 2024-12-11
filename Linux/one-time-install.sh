sudo apt-get install bat --yes
sudo apt-get install git --yes
sudo apt-get install fzf --yes
sudo apt-get install vifm --yes
sudo apt-get install fd-find --yes
# GPASTE is a UI clipboard
# sudo apt-get install gpaste --yes
# sudo apt-get install xclip --yes  
sudo apt-get install tree --yes  
sudo apt-get install ripgrep --yes  
sudo apt-get install powerline --yes  

if [ ! -d /mysettings ]; then
    git clone https://github.com/aburok/mysettings.git /mysettings
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat

cp /mysettings/git/.tigrc_host ~/.tigrc
cp /mysettings/Vim/host_files_User_Dir/.vimrc ~/
cp /mysettings/Linux/vifmrc ~/
cp /mysettings/Linux/.inputrc ~/
cp /mysettings/Linux/.fdignore ~/
cp /mysettings/Linux/.bashrc ~/


LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/