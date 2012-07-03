set nocompatible
set encoding=utf-8
set tabstop=4
set expandtab
set fileformat=unix
set nobomb
set ff=unix
set ambiwidth=double
set shiftwidth=4
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,enc-jp,latin1
syntax on
filetype plugin on
set  completeopt=preview 
colorscheme lucius
set mouse=r
set backspace=2
set nu
set hls

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=79

autocmd BufNewFile *.py 0r ~/.vim/template/simple.py
set incsearch
set wildmenu

filetype indent on
set noignorecase
colorscheme default
set nonumber
set nobackup

set nofoldenable

let g:pydiction_location = '/Users/james/.vim/pydiction-1.2/complete-dict'

