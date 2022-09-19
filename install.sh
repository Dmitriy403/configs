#!/bin/zsh
#force exit if anything goes wrong
set -e

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

#install tmux, vim
brew install tmux
brew install nvim
# remove bad tags:
# brew uninstall ctags
# install good tags:
brew install universal-ctags

if [[ ${machine} = "Linux" ]]
then
    sudo apt install --yes -- python3-venv
    sudo apt install --yes -- clangd
else
    if [[ "$machine" != "Mac" ]] ; then
       echo "Unexpected OS type"
       exit 1
    fi
    pip3 install virtualenv
    # install llvm for clangd
    brew install llvm
fi

#if ! grep -q "403scriptMagic" ~/.bashrc; then
#    sudo cat .bashrc.patch >>  ~/.bashrc
#    echo "bashrc patched"
#fi

cp ./home/.vimrc ~/.vimrc
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
cp ./home/.vimrc ~/.config/nvim/init.vim
cp ./home/.tmux.conf ~/.tmux.conf
cp wombat256mod.vim ~/.config/nvim/colors/

#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#install plugins in nvim
nvim -c 'PlugInstall' \
     -c 'qa!'
#curl -fsSL https://deno.land/x/install/install.sh | sh
