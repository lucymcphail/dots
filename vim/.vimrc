filetype plugin indent on

set hidden

set number
set list
set lazyredraw

set wildcharm=<C-z>
set wildignorecase
set wildmenu

set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround

set autoindent
set breakindent
set linebreak

if has('persistent_undo')
  set undodir=$HOME/.vim/undo
  set undofile
endif

set hlsearch
set incsearch
set ignorecase
set smartcase

augroup autoSourceVimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END

" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'nanotech/jellybeans.vim'

Plug 'ludovicchabant/vim-gutentags'

Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmsvg/pear-tree'
Plug 'tommcdo/vim-lion'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'

call plug#end()

" Colours
let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\}

color jellybeans
set background=dark
set termguicolors

" Status line
set laststatus=2
set statusline=
set statusline+=[%n]
set statusline+=\ %<%f
set statusline+=\ %h%w%m
set statusline+=%=
set statusline+=%y
set statusline+=\ %l:%c
set statusline+=\ %P

" Key bindings
let mapleader="\<Space>"
let maplocalleader="\<Bslash>"

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>g :G<CR>
nnoremap <leader>m :make<CR>

" Pear tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" LaTeX
let g:tex_flavor = "latex"
let g:tex_no_error=1
if has('macunix')
    let g:vimtex_view_method = 'skim'
else
    let g:vimtex_view_method = 'zathura'
endif
