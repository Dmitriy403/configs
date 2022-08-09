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
if [ "$machine" == "Linux" ]; then
    sudo apt install --yes -- python3-venv
else
    if ["$machine" != "Mac"]; then
       echo "Unexpected OS type"
       exit 1
    fi
    pip3 install virtualenv
fi

#if ! grep -q "403scriptMagic" ~/.bashrc; then
#    sudo cat .bashrc.patch >>  ~/.bashrc
#    echo "bashrc patched"
#fi

cp ./home/.vimrc ~/.vimrc
cp ./home/.tmux.conf ~/.tmux.conf


#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#curl -fsSL https://deno.land/x/install/install.sh | sh
