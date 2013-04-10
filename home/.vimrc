set tabstop=4
set shiftwidth=4
set expandtab
set number
autocmd BufRead *.h,*.c,*.cpp set cindent
"remove trailing spaces:
autocmd BufWritePre *.h,*.c,*.cpp :%s/\s\+$//e

"Nerd Tree
nmap <silent> <c-n> :NERDTreeToggle<CR>

"for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'Colour-Sampler-Pack'
if &t_Co==256
    colorscheme wombat256
else
    colorscheme desert
endif

""set tags+=~/decrypter/shared_tags
"set tags+=~/decrypter/tags

""Omni
"set nocp
"filetype plugin on
"set completeopt=menu,menuone
"let OmniCpp_NamespaceSearch=2
"let OmniCpp_ShowPrototypeInAbbr=1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_SelectFirstItem = 2
"let OmniCpp_LocalSearchDecl = 1
"
"
"function! CompleteTab()
"    let prec = strpart( getline('.'), 0, col('.')-1 )
"    if prec =~ '^\s*$' || prec =~ '\s$'
"        return "\<tab>"
"    else
"        return "\<c-x>\<c-o>"
"    endif
"endfunction
"
"inoremap <tab> <c-r>=CompleteTab()<cr>
