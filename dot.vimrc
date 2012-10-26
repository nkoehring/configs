set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set encoding=utf-8
set textwidth=79
set colorcolumn=80
set scrolloff=5

call pathogen#runtime_append_all_bundles()
syntax on
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

" colourstuff
set t_Co=256
colorscheme wombat256mod

source ~/.vim/vimrc
" GOOGLE: listchars

