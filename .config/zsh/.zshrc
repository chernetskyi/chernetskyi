exist () { command -v $1 &> /dev/null }

# Launch tmux on startup
exist tmux && [[ -z "$TMUX" ]] && tmux attach-session

# Powerlevel10k prompt
[[ -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] \
  && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# Powerlever10k prompt customization
[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh" ]] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh"

# dir_colors
[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/dir_colors" ]] \
  && eval $(dircolors "${XDG_CONFIG_HOME:-$HOME/.config}/dir_colors")

# zsh options
setopt autocd nomatch nohup nonotify menu_complete
unsetopt beep extendedglob

# Plugins
[[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
  && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
  && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completion
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
_comp_options+=(globdots)

# History
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory histignorespace histignoredups histnofunctions histreduceblanks

# Vi mode
bindkey -v
export KEYTIMEOUT=1
# Fix Vi mode
bindkey -v "^?" backward-delete-char
bindkey -v "\e[3~" delete-char
bindkey -v "^[[1~" beginning-of-line
bindkey -v "^[[4~" end-of-line

# Change default behavior with flags
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -rf"
alias scp="scp -r"
alias sudo="sudo "
# Shorten commands
alias c="code"
alias d="docker"
alias dc="docker-compose"
alias f="firefox"
alias g="git"
alias k="kubectl"
alias tf="terraform"
alias v="nvim"
# Overwrite commands
exist bat && alias cat="bat -pp --theme Nord"
exist exa && alias ls="exa --group-directories-first --icons"
# Dotfiles management
alias dot='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}"/dotfiles/ --work-tree=$HOME'
