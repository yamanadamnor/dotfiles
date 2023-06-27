# Environment variables
export ZDOTDIR="$HOME/.zsh"
export ZSH="$ZDOTDIR/ohmyzsh"
export FPATH="$FPATH:$HOME/.zsh/pure"
export EDITOR=nvim
export VISUAL=nvim
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin"
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH
export DOTFILES="$HOME/dotfiles"

# Set prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color magenta
prompt pure


# Oh My ZSH
zstyle ':omz:plugins:nvm' lazy yes
plugins=(
  nvm
  git
  conda-zsh-completion
)
# ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh


# For Loading the SSH key
/usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
source $HOME/.keychain/$HOST-sh



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


# c++: Compile and run the supplied file with
# all inputs *.in in the cwd
ccc() {
    g++ -std=c++17 -O2 -g -Wall -pedantic "$@"
    for file in *.in; do
        echo "Input $file:"
        ./a.out < "$file"; echo -e
    done
}


# Duplicate tab in WSL2
keep_current_path() {
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}
precmd_functions+=(keep_current_path)


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


# Aliases
alias vim="nvim"
alias ..="cd .."
alias ls="exa"
alias ll="exa -la"
alias synk="rsync -avhP --info=progress2" # archive, verbose, human, partial
alias zconfig="nvim ~/.zshrc"
alias vimconfig="cd $DOTFILES/nvim/.config/nvim && nvim ~/.config/nvim/init.lua"
alias dotfiles="cd ~/dotfiles"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yams/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yams/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yams/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yams/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
