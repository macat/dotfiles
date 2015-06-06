#!/bin/sh

git submodule update --init --recursive

brew update
brew install zsh ctags git hub the_silver_searcher

cp -f $HOME/.yadr/fonts/* $HOME/Library/Fonts
ln -nfs $HOME/.yadr/git/gitconfig $HOME/.gitconfig
ln -nfs $HOME/.yadr/ctags $HOME/.ctags 
ln -nfs $HOME/.yadr/vim $HOME/.vim 
ln -nfs $HOME/.yadr/vimrc $HOME/.vimrc
ln -nfs $HOME/.yadr/zshrc $HOME/.zshrc
ln -nfs $HOME/.yadr/zsh/prezto $HOME/.zprezto
ln -nfs $HOME/.yadr/zsh/prezto-override/zpreztorc $HOME/.zpreztorc


if [ -d $HOME/Dropbox/scripts/.zsh.after ]; then
  ln -nfs $HOME/Dropbox/scripts/.zsh.after $HOME/.zsh.after
fi
if [ -d $HOME/Dropbox/scripts/.zsh.before ]; then
  ln -nfs $HOME/Dropbox/scripts/.zsh.before $HOME/.zsh.before
fi
if [ -f $HOME/Dropbox/scripts/.gitconfig.user ]; then
  ln -nfs $HOME/Dropbox/scripts/.gitconfig.user $HOME/.gitconfig.user
fi

if grep -q "/usr/local/bin/zsh" "/etc/shells"; then
  echo "zsh is already in the shells file"
else
  sudo sh -c 'echo "\n/usr/local/bin/zsh" >> /etc/shells'
fi

chsh -s /usr/local/bin/zsh

if [ ! -d $HOME/.yadr/vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/vundle.git vim/bundle/Vundle.vim
fi




