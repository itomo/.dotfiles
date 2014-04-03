dotfiles
========
# 1. 使い方
cd ~/
git clone https://github.com/itomo/.dotfiles.git
cd ~/.dotifiles
git submodule update --init
sh ./setup.sh

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
