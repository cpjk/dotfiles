autocmd FileType go setlocal noexpandtab softtabstop=4 shiftwidth=4 tabstop=4 nolist " Set tab indentation for golang
set expandtab
set softtabstop=2
set shiftwidth=2
set noswapfile " do not keep swapfiles
set smarttab

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
" set cursorline " highlight current line
hi ColorColumn ctermbg=2 guibg=lightgrey
set colorcolumn=121 " Add a vertical stripe on line 121
" hi ColorColumn ctermbg=lightgrey

" set statusline+=%{gutentags#statusline()} " Show in status bar when gutentags is generating tags

" Colorscheme configuration
set t_Co=256 " set the number of terminal colours
syntax enable
set background=light
colorscheme solarized

" Enable copying to OSX clipboard via yank commands
set clipboard=unnamed

" Treat wrapped lines like separate lines when moving in normal mode
map j gj
map k gk

nmap K m'a<CR><Esc>`'
" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

" allow ctrlp to index all files
" let g:ctrlp_max_files=0

" add ctrlp cache_dir
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" use ag for ctrlp
" if executable('ag')
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif"

" allow jsx in js and jsx files
let g:jsx_ext_required = 0


" FZY ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("ag . -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . -l -g ''", ":sp")<cr>
" /FZY ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let g:ctrlp_custom_ignore = 'node_modules/*'

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1

" tag completion
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" copy the full path to the current file to the clipboard
let @*=expand('%:p')


" Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Bundle 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Bundle 'tpope/vim-rhubarb'
Plugin 'altercation/vim-colors-solarized'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'digitaltoad/vim-jade'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-haml'
Bundle 'roman/golden-ratio'
Bundle 'Valloric/YouCompleteMe'
Plugin 'jparise/vim-graphql'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'cloudhead/neovim-fuzzy'

call vundle#end()            " required
filetype plugin indent on    " required

" /Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
