set expandtab
set softtabstop=2
set shiftwidth=2
set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set nu
set numberwidth=1
set list listchars=tab:»→,trail:␣
set scrolloff=10
set timeoutlen=1000 ttimeoutlen=0 " Remove timeout after pressing escape
set hlsearch

" Colorscheme configuration
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

" Treat wrapped lines like separate lines when moving in normal mode
map j gj
map k gk

" Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ctrlp_custom_ignore = 'node_modules/*'

" Plugins
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Bundle 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'digitaltoad/vim-jade'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required

" /Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
