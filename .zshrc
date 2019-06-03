source $HOME/.dotfiles/.zshrc.mine  #自分の.zshrcを有効にする
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local # ローカルの設定を読み込む

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
