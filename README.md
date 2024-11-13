dotfiles
========
# 0. mac事前準備(home brew /coreutil /fish のinstall)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
brew install coreutils  
brew install fish  
which fish  
/etc/shells/に上記で出たパスを追記  

# 1. 使い方
cd ~/  
git clone https://github.com/itomo/.dotfiles.git  
cd ~/.dotifiles  
git submodule update --init  
sh ./setup.sh  
過去対応（zsh)  
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

# 4. fishの設定
fish_config

# (old)4. prezto のテーマ設定  
vim ~/.dotfiles/.zshrc.mine  
prompt pure # <- pure の部分を変更  
