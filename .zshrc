source $HOME/.dotfiles/.zprezto/runcoms/zshrc  # load prezto
source $HOME/.dotfiles/.zshrc.mine  # .zshrc
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local # ローカルの設定を読み込む

# end speed measurement -> start .zshenv
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
