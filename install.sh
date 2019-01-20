#!/bin/bash

if [ -d ~/dotfiles/.vim/bundle/Vundle.vim ]; then
  cd ~/dotfiles/.vim/bundle/Vundle.vim
  git pull origin master
else
  git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
fi

if [ -f ~/.vimrc ]; then
  rm ~/.vimrc
fi

if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi

if [ -f ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi

if [ -f ~/.pryrc ]; then
  rm ~/.pryrc
fi

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.pryrc ~/.pryrc

vim +BundleInstall! +BundleClean +qall
