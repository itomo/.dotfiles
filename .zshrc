export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

umask 002
cdpath=(~)
setopt AUTOPUSHD
setopt PUSHD_IGNORE_DUPS
setopt AUTO_CD
source ~/.zshrc.bindkey
source ~/.zshrc.prompt
source ~/.zshrc.complete
source ~/.zshrc.history
source ~/.zshrc.alias
