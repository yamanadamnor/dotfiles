export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$HOME/go/bin:$HOME/.local/share/fnm:$BUN_INSTALL/bin:$PYENV_ROOT/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH
export EDITOR=nvim
export VISUAL=nvim
export DOTFILES="$HOME/dotfiles"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
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
source $ZDOTDIR/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Search history with prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search
# macOS workaround
bindkey "ç" fzf-cd-widget

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


# Pyenv
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. "$ZDOTDIR/aliases.zsh"
. "$ZDOTDIR/functions.zsh"

# Navigate results using hjkl
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# History
HISTFILE=$ZDOTDIR/.zsh_history
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
source $ZDOTDIR/completion/init.zsh
source $ZDOTDIR/fzf/init.zsh

autoload -U bashcompinit && bashcompinit
source $HOME/Projects/getlab/getlab-completion.bash
