export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH
export EDITOR=nvim
export VISUAL=nvim
export DOTFILES="$HOME/dotfiles"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/.zsh"
export ZSH="$ZDOTDIR/ohmyzsh"
export FPATH="$FPATH:$ZDOTDIR/pure"


# Lazygit
export LG_CONFIG_DIR="$XDG_CONFIG_HOME/lazygit"
export LG_CONFIG_FILE="$LG_CONFIG_DIR/config.yml,$LG_CONFIG_DIR/themes/macchiato/blue.yml"

# Environment variables
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$HOME/go/bin:$HOME/.local/share/fnm:$BUN_INSTALL/bin:$PYENV_ROOT/bin:$PATH"

. "$XDG_CONFIG_HOME/.zsh/aliases.zsh"
. "$XDG_CONFIG_HOME/.zsh/functions.zsh"

# History
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
# Don't add to histfile if prefixed with space
setopt HIST_IGNORE_SPACE

# homebrew completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
#
# Load and initialise completion system
autoload -Uz compinit && compinit
# Extended completion
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
# Ignore case matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Set prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color magenta
prompt pure


# Oh My ZSH
#
# ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# For Loading the SSH key
if uname -r | grep -q "microsoft"; then
    /usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
    source $HOME/.keychain/$HOST-sh
fi



# Duplicate tab in WSL2
keep_current_path() {
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}

if uname -r | grep -q "microsoft"; then
    precmd_functions+=(keep_current_path)
fi


# Search history with prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search

# Vi-mode editing
bindkey -v

# Search history with Ctrl+R
bindkey "^R" history-incremental-search-backward

# pyenv
eval "$(pyenv init -)"

# fnm
eval "`fnm env --use-on-cd`"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "/Users/yamad09/.bun/_bun"
