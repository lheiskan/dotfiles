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

" set working directory to the dir of the actieve buffer automatically
set autochdir

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

autocmd FileType go nnoremap <leader>h  <Plug>(go-referrers)


" lsp support for python (todo: check if pylsp is available)
packadd lsp
call LspAddServer([#{name: 'pylsp',
                 \   filetype: 'python',
                 \   path: '/usr/local/bin/pylsp',
                 \   args: []
                 \ }])
autocmd FileType python nmap gd :LspGotoDefinition<CR>

" quick edit|source .vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" quick exit insert mode
:inoremap jk <esc>
:inoremap <esc> <nop>

"disable arrow keys
:nnoremap <left> <nop>
:nnoremap <right> <nop>
:nnoremap <up> <nop>
:nnoremap <down> <nop>

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" asyncomplete setup
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <c-space> <Plug>(asyncomplete_force_refresh)


