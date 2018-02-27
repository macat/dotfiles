#!/bin/sh

git submodule update --init --recursive
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y zsh ctags awscli neovim python3-pip curl wget
 
sudo pip3 install isort flake8

ln -nfs $HOME/.yadr/git/gitconfig $HOME/.gitconfig
ln -nfs $HOME/.yadr/ctags $HOME/.ctags 
ln -nfs $HOME/.yadr/vim $HOME/.vim 
ln -nfs $HOME/.yadr/vim $HOME/.config/nvim 
ln -nfs $HOME/.yadr/vimrc $HOME/.vimrc
ln -nfs $HOME/.yadr/zshrc $HOME/.zshrc
ln -nfs $HOME/.yadr/zsh/prezto $HOME/.zprezto
ln -nfs $HOME/.yadr/zsh/prezto-override/zpreztorc $HOME/.zpreztorc
ln -nfs $HOME/.yadr/tmux/tmux.conf $HOME/.tmux.conf


if [ -d $HOME/Dropbox/scripts/.zsh.after ]; then
  ln -nfs $HOME/Dropbox/scripts/.zsh.after $HOME/.zsh.after
fi
if [ -d $HOME/Dropbox/scripts/.zsh.before ]; then
  ln -nfs $HOME/Dropbox/scripts/.zsh.before $HOME/.zsh.before
fi
if [ -f $HOME/Dropbox/scripts/.gitconfig.user ]; then
  ln -nfs $HOME/Dropbox/scripts/.gitconfig.user $HOME/.gitconfig.user
fi

chsh -s $(which zsh)
