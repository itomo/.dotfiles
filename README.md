dotfiles
========
# 1. Usage
cd ~/
git clone https://github.com/itomo/.dotfiles.git
cd ~/.dotifiles
git submodule update --init
sh ./setup.sh

# 2. Setting vim
cd ~/
vim
:NeoBundleInstall
