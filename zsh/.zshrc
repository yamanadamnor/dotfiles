# Environment variables
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.local/share/fnm"
# zsh
export ZDOTDIR="$HOME/.config/.zsh"
export ZSH="$ZDOTDIR/ohmyzsh"
export FPATH="$FPATH:$ZDOTDIR/pure"

export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH

export EDITOR=nvim
export VISUAL=nvim
export DOTFILES="$HOME/dotfiles"

# Lazygit
export LG_CONFIG_DIR="$HOME/.config/lazygit"
export LG_CONFIG_FILE="$LG_CONFIG_DIR/config.yml,$LG_CONFIG_DIR/themes/macchiato/blue.yml"

# Set prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color magenta
prompt pure


# Oh My ZSH
plugins=(
  git
  fnm
)
# ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh


# Aliases
alias vim="nvim"
alias ..="cd .."
alias ls="exa"
alias ll="exa -la"
alias synk="rsync -avhP --info=progress2" # archive, verbose, human, partial
alias w++17="g++ -std=c++17 -Wall -Wextra -Wpedantic -Weffc++ -Wold-style-cast"
alias checkports="sudo lsof -i -P | grep LISTEN | grep :$PORT"
alias ssh="TERM=xterm ssh"
alias dotfiles="cd $DOTFILES"
alias kittyconfig="nvim $DOTFILES/kitty/.config/kitty/kitty.conf"
alias vimconfig="cd $DOTFILES/nvim/.config/nvim && nvim $DOTFILES/nvim/.config/nvim/init.lua"
alias zconfig="nvim $DOTFILES/zsh/.zshrc"


# For Loading the SSH key
if uname -r | grep -q "microsoft"; then
    /usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
    source $HOME/.keychain/$HOST-sh
fi
# nnn configuration (use n instead of nnn)
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}


# Duplicate tab in WSL2
keep_current_path() {
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}

if uname -r | grep -q "microsoft"; then
    precmd_functions+=(keep_current_path)
fi

# History
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob

# Don't add to histfile if prefixed with space
setopt HIST_IGNORE_SPACE

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

# Extended completion
zstyle :compinstall filename "$HOME/.zsh/.zshrc"
autoload -Uz compinit; compinit
# Ignore case matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# fnm
eval "`fnm env --use-on-cd`"
