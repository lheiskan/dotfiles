alias cls="clear"
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias cfg='/usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

zet() {
  vim "+Zet $*"
}

todo() {
  vim "+Todo $*"
}
