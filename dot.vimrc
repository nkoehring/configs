set nocompatible               " be iMproved
filetype off                   " required!

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Bundles here:
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-sleuth'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'spolu/dwm.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'sunaku/xoria256.vim'
Plugin 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus.git'
Plugin 'wting/rust.vim'

call vundle#end()
filetype plugin indent on     " required! 

let g:ackprg = 'ag --nogroup --nocolor --column'

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set encoding=utf-8
set textwidth=79
set colorcolumn=80
set scrolloff=5
set laststatus=2
set number
set wildmenu
set wildmode=list:longest,full
set cryptmethod=blowfish
set t_Co=256
colorscheme xoria256
syn on

" rust stuff
set hidden
let g:racer_cmd = "/usr/bin/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"
