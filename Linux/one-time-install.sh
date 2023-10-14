sudo apt-get install bat --yes
sudo apt-get install git --yes
sudo apt-get install fzf --yes
sudo apt-get install vifm --yes
sudo apt-get install fd-find --yes
# GPASTE is a UI clipboard
# sudo apt-get install gpaste --yes
sudo apt-get install xclip --yes  


git clone https://github.com/aburok/mysettings.git /mysettings
git clone git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
ln -s /usr/bin/batcat ~/.local/bin/bat