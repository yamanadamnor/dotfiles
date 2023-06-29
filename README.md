# dotfiles
contains various personal dotfiles and a script 
that symlinks dotfiles and installs packages

remember to init submodules. clone with:
```console
$ git clone --recurse-submodules git@github.com:voidiz/dotfiles

```

or after cloning:
```console
$ git submodule update --init --recursive
```

## script usage
`./setup.sh i3` - symlinks i3 config dots  
`./setup.sh xfce` - symlinks xfce config dots  
`./setup.sh packages` - installs arch base/community packages  
`./setup.sh aur` - installs aur packages (and yay)  

## Fixes
### Make VPN work on WSL2
https://github.com/microsoft/WSL/issues/1908

### Fix slow zsh due to NVM
https://dev.to/thraizz/fix-slow-zsh-startup-due-to-nvm-408k

### Copy to system clipboard (WSL2)
Make sure to have win32yank.exe installed and added to your path.
The easiest way is to install neovim on Windows.

