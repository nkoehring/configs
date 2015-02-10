call plug#begin('~/.nvim/plugged')

Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-speeddating'
Plug 'kien/ctrlp.vim'
Plug 'spolu/dwm.vim'
Plug 'mileszs/ack.vim'
Plug 'sunaku/xoria256.vim'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'wting/rust.vim'
Plug 'farseer90718/vim-taskwarrior'

call plug#end()

let g:ackprg = 'ag --nogroup --nocolor --column'
colorscheme xoria256

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
"set cryptmethod=blowfish
set t_Co=256
