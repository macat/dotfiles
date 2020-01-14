#!/bin/sh

git submodule update --init --recursive

ln -nfs $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -nfs $HOME/.dotfiles/vim $HOME/.vim 
ln -nfs $HOME/.dotfiles/vim $HOME/.config/nvim 
ln -nfs $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -nfs $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -nfs $HOME/.dotfiles/zsh/prezto $HOME/.zprezto
ln -nfs $HOME/.dotfiles/zsh/prezto-override/zpreztorc $HOME/.zpreztorc
ln -nfs $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
