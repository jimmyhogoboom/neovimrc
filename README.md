To use this setup, install Neovim and Vundle.

---

#### Installing on windows:

install with chocolatey

create init.vim in AppData/Local/nvim
```
set runtimepath^=./vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/neovimrc/.vimrc
```

If you get an error with the OmniSharp plugin "`Error: OmniSharp requires Vim compiled with +python or +python3`", you need to run `pip3 install --user --upgrade neovim`.

To add a right-click shortcut:
https://www.howtogeek.com/107965/how-to-add-any-application-shortcut-to-windows-explorers-context-menu/
use `path\to\nvim-qt.exe -- -- %1` for files and `path\to\nvim-qt.exe` for directories.
