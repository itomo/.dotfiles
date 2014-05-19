#!/bin/bash

DOT_FILES=( .zshenv .zshrc .zshrc.alias .zshrc.bindkey .zshrc.complete .zshrc.history .zshrc.prompt .gitconfig .vimrc .vim .tmux.conf .dir_colors .inputrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/.dotfiles/$file $HOME/$file
done
