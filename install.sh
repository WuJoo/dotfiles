#!/bin/bash

cd ~/dotfiles
git submodule init
git submodule update

if [ -f ~/.vimrc ]; then
  rm ~/.vimrc
fi

if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc

vim +PluginInstall +qall
