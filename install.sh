#!/bin/bash

FILES=".gitconfig .gitignore .tmux.conf .vimrc .zlogin .zprofile .zpreztorc .zshrc"
VIM_COLOR_FILES="jellybeans.vim solarized.vim"
DOTFILE_DIR=$(pwd)

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done

mkdir -p ~/.vim/colors

for FILE in $VIM_COLOR_FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/.vim/colors/$FILE
done

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
