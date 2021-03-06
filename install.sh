#!/bin/bash

FILES=".gitconfig .gitignore .tmux.conf .vimrc .zlogin .zprofile .zpreztorc .zshrc"
DOTFILE_DIR=$(pwd)

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
