git submodule update --init --recursive
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp .bashrc ~/.bashrc
cp .bash_profile ~/
cp ./home/.vimrc ~/.vimrc
cp ./home/.tmux.conf ~/.tmux.conf
cp -r ./home/.vim ~/
vim +BundleInstall +qall
