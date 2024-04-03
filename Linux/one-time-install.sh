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