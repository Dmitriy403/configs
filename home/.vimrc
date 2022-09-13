syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
"incremental search
set incsearch
"игнорируем case если нет заглавных букв в шаблоне поиска
set ignorecase
set smartcase
"кодировка по умолчанию
set termencoding=utf8
"show command in statusbar
set showcmd
set autoindent
"status line config
set statusline=%<%f%h%m%r\ %4.6b\ %{&encoding}\ 0x%-3.6B\ \ %l,%c%V\ %P
set laststatus=2
"highlight cursor line
set cursorline
"отключаем бибикалку
set visualbell
set t_vb=
"disable background color erase for fix tmux 
set t_ut=
"
set nocompatible
set tags=./tags;

filetype plugin on
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
endif

"autocmd BufRead *.h,*.c,*.hpp,*.cpp set cindent
autocmd BufRead,BufNewFile *.h,*.c,*.hpp,*.cpp set filetype=c
autocmd BufRead,BufNewFile *.h,*.hpp,*.cpp set filetype=cpp
"remove trailing spaces:
"autocmd BufWritePre *.h,*.c,*.hpp,*.cpp,*.py :%s/\s\+$//e
"highlight tabs and trailing spaces:
set list listchars=tab:»·,trail:·

"fswitch
augroup fswitch-autocommands
    au BufEnter *.cpp let b:fswitchdst  = 'h,hpp'
    au BufEnter *.cpp let b:fswitchlocs = './,./include/,../include'

    au BufEnter *.h let b:fswitchdst  = 'c,cpp'
    au BufEnter *.h let b:fswitchlocs = '../src,../,./'
augroup END

"load custom config if exists
if filereadable(".vim.custom")
    so .vim.custom
endif


"MAPPINGS
"tabs
nnoremap gk  :tabnext<CR>
nnoremap gj  :tabprev<CR>
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"Nerd Tree
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <c-m> :TagbarToggle<CR>
nmap <c-x> :FSHere<CR>
nmap <F2> :%s/\s\+$//e<CR>

filetype plugin indent on

if &t_Co==256
    colorscheme wombat256mod
else
    colorscheme desert
endif

"PLUGINS
call plug#begin()

Plug 'https://github.com/tpope/vim-fugitive'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

call plug#end()
