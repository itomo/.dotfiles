#!/bin/bash

DOT_FILES=( .zshenv .zshrc .zshrc.alias .zshrc.bindkey .zshrc.complete .zshrc.history .zshrc.prompt .gitconfig .vimrc .vim .tmux.conf .dir_colors .inputrc .zprezto )

for file in ${DOT_FILES[@]}
do
    if [ -e $HOME/$file ]; then
        echo "failed: $file is already exists"
    else
        ln -s $HOME/.dotfiles/$file $HOME/$file
        echo "success: $file is linked"
    fi
done

PREZTO_FILES=( zlogin zlogout zpreztorc zprofile )

for pfile in ${PREZTO_FILES[@]}
do
    if [ -e $HOME/.$pfile ]; then
        echo "failed: $pfile is already exists"
    else
        ln -s $HOME/.dotfiles/.zprezto/runcoms/$pfile $HOME/.$pfile
        echo "success: $pfile is linked"
    fi
done
