call plug#begin()
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'github/copilot.vim'

" Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

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


if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" quick edit|source .vimrc
":nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>ev :e! $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" quick exit insert mode
:inoremap kj <esc>
:inoremap jk  <esc>



"disable arrow keys
:nnoremap <left> <nop>
:nnoremap <right> <nop>
:nnoremap <up> <nop>
:nnoremap <down> <nop>

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

