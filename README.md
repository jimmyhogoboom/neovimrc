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
