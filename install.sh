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

if [ -f ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

vim +PluginInstall +qall
