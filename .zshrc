export PATH="/usr/local/sbin:$HOME/go/bin:$HOME/bin:$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/lauri/go/bin/gocomplete go

# use vim to edit previous commands
export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# alias for managing dotfiles|config with git
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
