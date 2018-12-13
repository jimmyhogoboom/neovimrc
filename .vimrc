set number
set ruler

inoremap jk <Esc>
inoremap kj <Esc>

call plug#begin('~/nvim/plugged')

Plug 'scrooloose/nerdtree'

call plug#end()

map <C-n> :NERDTreeToggle<CR>

