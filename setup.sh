#!/bin/bash

DOT_FILES=( .my.cnf .zshrc .zshrc.alias .zshrc.bindkey .zshrc.complete .zshrc.history .zshrc.prompt .gitconfig .vimrc .vim .tmux.conf .dir_colors .inputrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/.dotfiles/$file $HOME/$file
done

# install oh-my-zsh
#[! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.dotfiles/.oh-my-zsh
