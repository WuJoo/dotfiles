#!/bin/bash

cd ~/dotfiles
git pull origin master

if [ -d ~/dotfiles/.vim/bundle/Vundle.vim ]; then
  cd ~/dotfiles/.vim/bundle/Vundle.vim
  git pull origin master
else
  cd ~/dotfiles/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git
fi

if [ -d ~/dotfiles/.tmux-themepack ]; then
  cd ~/dotfiles/tmux-themepack
  git pull origin master
else
  cd ~/dotfiles
  git clone https://github.com/jimeh/tmux-themepack.git
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

if [ -f ~/.tmux-themepack ]; then
  rm ~/.tmux-themepack
fi

if [ -f ~/.pryrc ]; then
  rm ~/.pryrc
fi

if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux-themepack ~/.tmux-themepack
ln -s ~/dotfiles/.pryrc ~/.pryrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

vim +BundleInstall! +BundleClean +qall
