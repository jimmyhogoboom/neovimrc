
" TODO: Take some pointers from https://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html

syntax enable

set number
set ruler

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

set nowrap

" Show the current file name in the titlebar
set title

" For HTML tag matching
set matchpairs+=<:>

" Highlight current line
set cursorline

inoremap jk <Esc>
inoremap kj <Esc>

" Disable :wq because I only ever hit it by accident
cabbrev wq w

" Turn off search highlighting for last search
map <Space> :noh<CR>

" elite mode - arrows resize splits
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Auto-reload .vimrc on save
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"if has('gui_running')
"    set guifont=Fira\ Code:cANSI
"    set guifont=Consolas:h11:cANSI
"endif

" This has some more tips for settings: https://stackoverflow.com/a/2559262/370539


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and Plugin setup "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugin list "

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Plugin 'mhartington/oceanic-next'
Plugin 'tomasiser/vim-code-dark'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'kshenoy/vim-signature'

" Bundle 'OmniSharp/omnisharp-vim'

" JavaScript and React plugins
" (https://drivy.engineering/setting-up-vim-for-react/)
" Syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

" JSX tag expansion (e.g. typeing 'p.description<Tab>' expands to
" <p className="description"></p>
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<Tab>'
"let g:user_emmet_settings = { 'javascript.jsx' : { 'extends' : 'jsx' } }

" Syntax checking
Plugin 'w0rp/ale'

" Autoformatting async
Plugin 'skywind3000/asyncrun.vim'

" Autocomplete
" Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" Automatically close scratch window after complete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible()? "\<c-p>" : "\<tab>"

" tern TODO: get working, see https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
" Plugin 'ternjs/tern_for_vim', { 'do': 'npm install' }
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif

" TODO: Fix
" Plug 'ryanoasis/vim-devicons'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OmniSharp "
function! _configureOmnisharp()
    filetype plugin on
    set completeopt=longest,menuone,preview
    let g:ale_linters = { 'cs': ['OmniSharp'] }

    augroup omnisharp_commands
        autocmd!

        " When Syntastic is available but not ALE, automatic syntax check on events
        " (TextChanged requires Vim 7.4)
        " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

        " Show type information automatically when the cursor stops moving
        autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

        " The following commands are contextual, based on the cursor position.
        autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

        " Finds members in the current buffer
        autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

        autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
        autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
        autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


        " Navigate up and down by method/property/field
        autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
        autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    augroup END

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    nnoremap <Leader>nm :OmniSharpRename<CR>
    nnoremap <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    nnoremap <Leader>ss :OmniSharpStartServer<CR>
    nnoremap <Leader>sp :OmniSharpStopServer<CR>

    " Add syntax highlighting for types and interfaces
    nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

endfunction

" call _configureOmnisharp()

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

colorscheme codedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline "
" TODO: This doesn't seem to work properly.
" 	Should have arrow separators.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='distinguished'
" let g:airline_powerline_fonts = 1

" let g:airline_right_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep= ''
" let g:airline_left_sep = ''

" TODO: ensure the following two settings work properly
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeMinimalUI = v:true

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically run Prettier on .js files
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

