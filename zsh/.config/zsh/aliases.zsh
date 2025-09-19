alias vim="nvim"
alias ..="cd .."
alias ls="eza"
alias ll="eza -la"
alias lg="lazygit"
alias synk="rsync -s  --size-only -avhP --info=progress2" # archive, verbose, human, partial
alias w++17="g++ -std=c++17 -Wall -Wextra -Wpedantic -Weffc++ -Wold-style-cast"
alias checkports="sudo lsof -i -P | grep LISTEN | grep :$PORT"
alias ssh="TERM=xterm ssh"
alias dotfiles="cd $DOTFILES"
alias kittyconfig="nvim $DOTFILES/kitty/.config/kitty/kitty.conf"
alias vimconfig="cd $DOTFILES/nvim/.config/nvim && nvim $DOTFILES/nvim/.config/nvim/init.lua"
alias zconfig="nvim $DOTFILES/zsh/.zshrc"
alias sshconfig="nvim $HOME/.ssh/config"

# Colorize help output with bat
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
