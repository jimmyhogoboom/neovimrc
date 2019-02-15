Installing on windows:

install with chocolatey

create init.vim in AppData/Local/nvim
```
set runtimepath^=./vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/neovimrc/.vimrc
```

create autoload/ in AppData/Local/nvim, Download vim-plug there

change `call plug#begin('~/nvim/plugged')` to 
`call plug#begin('$LOCALAPPDATA/nvim')`


To add a right-click shortcut:
https://www.howtogeek.com/107965/how-to-add-any-application-shortcut-to-windows-explorers-context-menu/
use `path\to\nvim-qt.exe -- -- %1` for files and `path\to\nvim-qt.exe` for directories.
