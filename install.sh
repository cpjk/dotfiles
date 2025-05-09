#!/bin/bash

FILES=".gitconfig .gitignore .tmux.conf .vimrc .zlogin .zprofile .zpreztorc .zshrc .inputrc .ideavimrc"
VIM_COLOR_FILES="jellybeans.vim solarized.vim"
DOTFILE_DIR=$(pwd)

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done

ln -sf $DOTFILE_DIR/ghostty_config ~/Library/Application\ Support/com.mitchellh.ghostty/config

mkdir -p ~/.vim/colors

for FILE in $VIM_COLOR_FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/.vim/colors/$FILE
done

mkdir ~/.vim-tmp

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +BundleInstall +qall
