PATH="$PATH:${HOME}/bin"
PATH=${HOME}/go/bin:$PATH

alias cls="clear"
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias cfg='/usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

set -o vi

zet() {
  vim "+Zet $*"
}

todo() {
  vim "+Todo $*"
}
