call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-speeddating'
Plug 'kien/ctrlp.vim'
Plug 'spolu/dwm.vim'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'freitass/todo.txt-vim'
Plug 'jnurmine/zenburn'
Plug 'sheerun/vim-polyglot'
Plug 'jimmyhchan/dustjs.vim'

call plug#end()

nnoremap <silent> <F12> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 35
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_indent = 2
let g:tagbar_show_linenumbers = 1
let g:tagbar_iconchars = ['►', '▼']
let g:ackprg = 'ag --nogroup --nocolor --column'
let mapleader=' '
let maplocalleader=' '
colorscheme zenburn

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set encoding=utf-8
set textwidth=79
set colorcolumn=80
set scrolloff=5
set laststatus=2
set number
set wildmenu
set wildmode=list:longest,full
set hlsearch
"set cryptmethod=blowfish
"set t_Co=256
