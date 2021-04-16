# XDG Base Directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDF_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg/"

# Default programs
export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESSHISTFILE=-
export SHELL=zsh

# Home directory cleanup
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export ZDOTDIR="$HOME/.config/zsh"
