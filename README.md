dotfiles
========
# 0. mac事前準備(home brew install とcoreutil のinstall)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
brew install coreutils  

# 1. 使い方
cd ~/  
git clone https://github.com/itomo/.dotfiles.git  
cd ~/.dotifiles  
git submodule update --init  
sh ./setup.sh  
cd .zprezto  
git submodule update --init  

# 2. Vim の設定
cd ~/  
vim  
:NeoBundleInstall  

# 3. git の設定
・リポジトリ毎に設定  
cd <repository-path>  
git config user.name <user.name>  
git config user.email <user.email>  

・環境毎に設定  
git config --system user.name <user.name>  
git config --system user.email <user.email>  

・確認  
git config --list | grep user  

・ローカル設定ファイル  
/etc/.gitconfig  
