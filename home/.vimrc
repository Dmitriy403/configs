set tabstop=4
set shiftwidth=4
set expandtab
set number
autocmd BufRead *.h,*.c,*.hpp,*.cpp set cindent
"remove trailing spaces:
autocmd BufWritePre *.h,*.c,*.hpp,*.cpp,*.py :%s/\s\+$//e

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

