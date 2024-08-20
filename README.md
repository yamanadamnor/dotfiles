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
## Utilities for macOS
- [LinearMouse](https://linearmouse.app/) - Control mouse and scroll acceleration for external mice
- [Mos](https://mos.caldis.me/) - Smooth scrolling for external mice
- [BetterDisplay](https://github.com/waydabber/BetterDisplay) - Control external display with keyboard shortcuts (Volume, brightness) + force HiDPI
- [AltTab](https://alt-tab-macos.netlify.app/) - Make alt-tab feel like Windows with Vim motions
- [Raycast](https://www.raycast.com/) - Better alternative to spotlight
- [Bartender](https://www.macbartender.com/) - Control menu bar items on notched macbook
- [BetterTouchTool](https://folivora.ai/) - Customize input devices such as mouse and trackpad
- [Karabiner Elements](https://karabiner-elements.pqrs.org/) - Keyboard customizer for rebinding ctrl and fn (+more)
- [Shottr](https://shottr.cc/) - Screenshot utility to replace the builtin one


## Fixes
### Make VPN work on WSL2
https://github.com/microsoft/WSL/issues/1908

### Fix slow zsh due to NVM
https://dev.to/thraizz/fix-slow-zsh-startup-due-to-nvm-408k

### Copy to system clipboard (WSL2)
Make sure to have win32yank.exe installed and added to your path.
The easiest way is to install neovim on Windows.

