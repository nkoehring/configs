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
Plug 'majutsushi/tagbar'

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
