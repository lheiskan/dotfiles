syntax on
colo pablo

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" highlight with star
set hlsearch

autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

" Control all other files
set shiftwidth=4

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

set number numberwidth=4
set matchtime=5
set shiftround
set nowrap

" completion options for insert mode completion
set completeopt=menu,preview,noinsert

" incremental search, highlight matching text as search regex is entered
set incsearch

" vim-go
let g:go_fmt_command = "goimports"    
let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>h  <Plug>(go-referrers)

