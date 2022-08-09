#force exit if anything goes wrong
set -e
#install tmux, vim
brew install tmux
brew install nvim
# remove bad tags:
# brew uninstall ctags
# install good tags:
brew install universal-ctags
apt install --yes -- python3-venv

#if ! grep -q "403scriptMagic" ~/.bashrc; then
#    sudo cat .bashrc.patch >>  ~/.bashrc
#    echo "bashrc patched"
#fi

cp ./home/.vimrc ~/.vimrc
cp ./home/.tmux.conf ~/.tmux.conf


#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#install coq_nvim

#if [ -d ~/.vim/ ]; then
#    [ -d ~/.vim/colors/ ] || mkdir ~/.vim/colors/
#    cp ./wombat256mod.vim ~/.vim/colors/
#fi

#if [ ! -d ~/.tmux/plugins/tpm/ ]; then
#    echo "clone tpm"
#    git clone git@github.com:tmux-plugins/tpm.git  ~/.tmux/plugins/tpm
#fi

#install deps for vim/nvim plugins

#curl -fsSL https://deno.land/x/install/install.sh | sh
