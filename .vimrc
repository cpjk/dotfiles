autocmd FileType go setlocal noexpandtab softtabstop=4 shiftwidth=4 tabstop=4 nolist " Set tab indentation for golang
set expandtab
set softtabstop=2
set shiftwidth=2
set noswapfile " do not keep swapfiles
set smarttab

" Remove banner at top of netrw directory listing
let g:netrw_banner = 0
" Use tree-style directory listing in netrw
let g:netrw_liststyle = 3

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
" let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
" " Auto-generate tags on new
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1 " generate tags on file open if no tags file is found for current project
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0
" " Generate more info for each tag
" let g:gutentags_ctags_extra_args = [ '--tag-relative=yes', '--fields=+ailmnS' ]
" let g:gutentags_ctags_exclude = [
"       \ '.git', '.svg', '.hg', '/tests/', 'build', 'dist', 'sites//files/', 'bin', 'node_modules', 'bower_components',
"       \ 'cache', 'compiled', 'docs', 'example', 'bundle', 'vendor', '.md', '-lock.json', '.lock', 'bundle.js', 'build.js',
"       \ '.rc', '.json', '.min.', '.map', '.bak', '.zip', '.pyc', '.class', '.sln', '.Master', '.csproj', '.tmp',
"       \ '.csproj.user', '.cache', '.pdb', 'tags', 'cscope.', '.css', '.less', '.scss', '.exe', '.dll', '.mp3', '.ogg',
"       \ '.flac', '.swp', '.swo', '.bmp', '.gif', '.ico', '.jpg', '.png', '.rar', '.zip', '.tar', '.tar.gz', '.tar.xz',
"       \ '.tar.bz2', '.pdf', '.doc', '.docx', '.ppt', '.pptx',
"       \ ]
" set tags='/Users/cpjk/.cache/vim/ctags'

" Colorscheme configuration
set t_Co=256 " set the number of terminal colours
syntax enable

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

" vim ruby customization
:let g:ruby_indent_hanging_elements = 0
:let g:ruby_indent_assignment_style = 'variable'
:let g:ruby_indent_block_style = 'expression'


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

nnoremap <leader>e :call FzyCommand("ag . -l -g '' --ignore '*.rbi' --ignore '*.mrb'", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . -l -g '' --ignore '*.rbi' --ignore '*.mrb'", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . -l -g '' --ignore '*.rbi' --ignore '*.mrb'", ":sp")<cr>
" /FZY ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let g:ctrlp_custom_ignore = 'node_modules/*'

" tag completion
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" copy the full path to the current file to the clipboard
" let @*=expand('%:p')


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
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-haml'
Bundle 'roman/golden-ratio'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'jparise/vim-graphql'
Plugin 'cloudhead/neovim-fuzzy'
Plugin 'fatih/vim-go'
Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()            " required
filetype plugin indent on    " required

" /Vundle ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

:silent! colorscheme dracula
set background=light
