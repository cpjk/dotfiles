#!/bin/bash

FILES=".gitconfig .gitignore .tmux.conf .vimrc .zlogin .zprofile .zpreztorc .zshrc .inputrc"
VIM_COLOR_FILES="jellybeans.vim solarized.vim"
DOTFILE_DIR=$(pwd)

# make sure to install fish first

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for FILE in $FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/$FILE
done

ln -sf $DOTFILE_DIR/config.fish ~/.config/fish/config.fish

mkdir -p ~/.vim/colors

for FILE in $VIM_COLOR_FILES; do
  ln -sf $DOTFILE_DIR/$FILE ~/.vim/colors/$FILE
done

mkdir ~/.vim-tmp

# VSCode configs
ln -sf $DOTFILE_DIR/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf $DOTFILE_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +BundleInstall +qall

if [ $SPIN ]; then
  sudo apt-get install -o DPkg::Lock::Timeout=600 -y fzy
  sudo apt-get install -o DPkg::Lock::Timeout=600 -y silversearcher-ag
fi
