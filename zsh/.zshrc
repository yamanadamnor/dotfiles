export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$HOME/go/bin:$HOME/.local/share/fnm:$BUN_INSTALL/bin:$PYENV_ROOT/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH
export EDITOR=nvim
export VISUAL=nvim
export DOTFILES="$HOME/dotfiles"
export LC_ALL="en_US.UTF-8"

# zsh
export ZDOTDIR="$HOME"
export FPATH="$FPATH:$ZDOTDIR/pure"
export PNPM_HOME="$HOME/Library/pnpm"

# Starshop
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

# mac only: Prevent homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1

# Enable vim mode
function zvm_config() {
  # Always starting with insert mode for each command line
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_INIT_MODE=sourcing
}

# Search history with prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search

# PNPM
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# fnm
eval "$(fnm env --use-on-cd)"

# Lazygit
export LG_CONFIG_DIR="$XDG_CONFIG_HOME/lazygit"
export LG_CONFIG_FILE="$LG_CONFIG_DIR/config.yml,$LG_CONFIG_DIR/themes/macchiato/blue.yml"


. "$XDG_CONFIG_HOME/zsh/aliases.zsh"
. "$XDG_CONFIG_HOME/zsh/functions.zsh"

# Navigate results using hjkl
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char


# History
HISTFILE=$XDG_CONFIG_HOME/.zsh_history
HISTSIZE=3000
SAVEHIST=3000
setopt autocd extendedglob
# Don't add to histfile if prefixed with space
setopt HIST_IGNORE_SPACE
setopt share_history
setopt inc_append_history

# homebrew completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="${FPATH}:$(brew --prefix)/share/zsh/site-functions"
fi

eval "$(starship init zsh)"
source $XDG_CONFIG_HOME/zsh/completion/init.zsh
source $XDG_CONFIG_HOME/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $XDG_CONFIG_HOME/zsh/fzf/init.zsh

# macOS workaround for fzf
bindkey "^F" fzf-cd-widget
