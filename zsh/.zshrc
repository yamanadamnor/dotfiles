#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Set up Node Version Manager
# source /usr/share/nvm/init-nvm.sh

alias vim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
alias n="nnn"
