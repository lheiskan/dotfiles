# for loading bash configs in emulation mode
source_sh () {
  emulate -LR sh
  . "$@"
}

source $HOME/.bashrc

export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
