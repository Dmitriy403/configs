git submodule update --init --recursive
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp .bashrc ~/.bashrc
cp ./home/.vimrc ~/.vimrc
cp -r ./home/.vim ~/
vim +BundleInstall +qall
