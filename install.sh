#!/bin/bash

FILES=".gitconfig .gitignore .tmux.conf .vimrc .zlogin .zprofile .zpreztorc .zshrc .inputrc"
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

mkdir ~/.vim-tmp

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +BundleInstall +qall

if [ $SPIN ]; then
  sudo apt-get install -y fzy
  sudo apt-get install silversearcher-ag


  # install YCM
  yes | sudo apt install build-essential cmake vim-nox python3-dev
  yes | sudo apt install mono-complete golang nodejs default-jdk npm
  pushd ~/.vim/bundle/YouCompleteMe
  python3 install.py --all
  popd
fi
