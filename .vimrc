syntax enable

set number
set ruler

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set nowrap

" Show the current file name in the titlebar
set title

" Some stuff for autocomplete
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

" For HTML tag matching
set matchpairs+=<:>

" Highlight current line
set cursorline

inoremap jk <Esc>
inoremap kj <Esc>

" Turn off search highlighting for last search
map <Space> :noh<CR>

" elite mode - arrows resize splits
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" This has some more tips for settings: https://stackoverflow.com/a/2559262/370539

" call plug#begin('~/nvim/plugged')
call plug#begin('$LOCALAPPDATA/nvim')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'mhartington/oceanic-next'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kshenoy/vim-signature'

" Plug 'OmniSharp/omnisharp-vim'

" Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OmniSharp "
" filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline "
" TODO: This doesn't seem to work properly.
" 	Should have arrow separators.
" TODO: Find a good matching theme.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" oceanic-next "
" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
" if (has("termguicolors"))
 " set termguicolors
" endif

" set background=dark

" Theme
" colorscheme OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1

colorscheme arcadia
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>

map f :Files<CR>

