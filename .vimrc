syntax enable

set number
set ruler

inoremap jk <Esc>
inoremap kj <Esc>

" call plug#begin('~/nvim/plugged')
call plug#begin('$LOCALAPPDATA/nvim')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'mhartington/oceanic-next'

" Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" vim-airline "
" TODO: This doesn't seem to work properly.
" 	Should have arrow separators.
" TODO: Find a good matching theme.
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" oceanic-next "
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>

map <Space> :noh<CR>

map f :Files<CR>
