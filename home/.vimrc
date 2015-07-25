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

"UltiSnips
let g:UltiSnipsSnippetDirectories=["MyUltiSnips"]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
"Nerd Tree
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <c-\> :TagbarToggle<CR>
nmap <c-x> :FSHere<CR>
nmap <Leader>se :UltiSnipsEdit<CR>
nmap <F2> :%s/\s\+$//e<CR>

"VUNDLE
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'Colour-Sampler-Pack'
if &t_Co==256
    colorscheme wombat256
else
    colorscheme desert
endif
Bundle 'SirVer/ultisnips'
Bundle 'majutsushi/tagbar'
Bundle 'derekwyatt/vim-fswitch'

