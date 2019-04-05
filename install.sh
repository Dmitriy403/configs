#install tmux, vim
sudo apt-get install tmux
sudo apt-get install vim

if ! grep -q "403scriptMagic" ~/.bashrc; then
    sudo cat .bashrc.patch >>  ~/.bashrc
    echo "bashrc patched"
fi

cp ./home/.vimrc ~/.vimrc
cp ./home/.tmux.conf ~/.tmux.conf

if [ -d ~/.vim/ ]; then
    [ -d ~/.vim/colors/ ] || mkdir ~/.vim/colors/
    cp ./wombat256mod.vim ~/.vim/colors/
fi

if [ ! -d ~/.tmux/plugins/tpm/ ]; then
    echo "clone tpm"
    git clone git@github.com:tmux-plugins/tpm.git  ~/.tmux/plugins/tpm
fi

