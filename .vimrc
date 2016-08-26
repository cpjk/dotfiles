set expandtab
set softtabstop=2
set shiftwidth=2
set noswapfile " do not keep swapfiles

" was supposed to allow my shell to behave like and interactive shell
":set shellcmdflag=-ic


":set shell=zsh

" search for tags file starting from current directory and recursing down
" parent directories until one is found
set tags=./tags;/

" keep backups in the given backup directory
set backup
set backupdir=~/.vim-tmp
set writebackup " write a backup before overwriting a file

set noerrorbells visualbell t_vb= " disable beeping and window flashing on errors
set nu " add line numbers
set numberwidth=1
set list listchars=tab:»→,trail:␣
set scrolloff=10 " scroll up or down when the cursor less than 10 lines away from the top or bottom of the window
set timeoutlen=1000 ttimeoutlen=0 " remove timeout after pressing escape
set hlsearch " highlight search matches
set showcmd " show command in bottom bar
set cursorline " highlight current line

" Colorscheme configuration
set t_Co=256 " set the number of terminal colours
syntax enable
set background=dark
colorscheme solarized

" Treat wrapped lines like separate lines when moving in normal mode
map j gj
map k gk

" restrict jsx to only .jsx files
let g:jsx_pragma_required = 1

" allow ctrlp to index all files
let g:ctrlp_max_files=0

" add ctrlp cache_dir
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" use ag for ctrlp
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:ctrlp_custom_ignore = 'node_modules/*'

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1


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
Bundle 'mxw/vim-jsx'
Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required

" /Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
