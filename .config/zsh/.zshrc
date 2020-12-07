exist () { command -v $1 &> /dev/null }

# Launch tmux on startup
exist tmux \
  && [[ -z "$TMUX" ]] \
  && tmux -f "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" attach-session

# Powerlevel10k prompt
[[ -r "${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k/powerlevel10k.zsh-theme" ]] \
  && source "${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k/powerlevel10k.zsh-theme"
# Powerlever10k prompt customization
[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh" ]] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh"

# zsh options
setopt autocd nomatch nohup nonotify menu_complete
unsetopt beep extendedglob

# Completion
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
_comp_options+=(globdots)

# History
HISTFILE="{$XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory histignorespace histignoredups histnofunctions histreduceblanks

# Vi mode
bindkey -v
# Fix delay before entering normal mode
export KEYTIMEOUT=1
# Fix deleting characters after quitting normal mode
bindkey -v "^?" backward-delete-char
# Vim keys in tab completson menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Change default behavior with flags
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -rf"
alias scp="scp -r"
# Shorten commands
alias c="code"
alias d="docker"
alias dc="docker-compose"
alias g="git"
alias h="helm"
alias k="kubectl"
alias tf="terraform"
alias v="nvim"
# Dotfiles management
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'
# Overwrite commands
exist exa \
  && alias ls="exa --group-directories-first --icons"
