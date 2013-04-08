" Load up all of the items in bundles
call pathogen#infect()

" Make the ruby textobject stuff work
runtime macros/matchit.vim

" No error bells
set noeb vb t_vb=

" We're using this in a 256 colour terminal
set t_Co=256

" Make dot work in visual mode
vnoremap . :norm.<CR>

" Highlight the current line
set cursorline

" Don't show the scrollbars
set guioptions-=L

" Highlight syntax
syntax on

if has("autocmd")

  " Nginx highlighting
  au BufNewFile,BufRead nginx.conf set filetype=nginx

  " Indent intelligently
  filetype plugin indent on

  " Auto reload the .vimrc
  autocmd! bufwritepost .vimrc source %

  " Open nerdtree if there wasn't a file specified
  autocmd vimenter * if !argc() | NERDTree | endif

endif

" Don't close if nerdtree is the last thing
" let nerdtree_tabs_autoclose=0

" Get rid of that annoying underlining in html files
hi link htmlLink NONE

" Highlight search results by default
nnoremap <F3> :set invhlsearch hlsearch?<CR>

" Insert a newline
nnoremap <leader>o o<ESC>k

" Toggle paste mode on/off
nnoremap <F2> :set invpaste paste?<CR>

" Make things fancy
set nocompatible
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme="default"
let g:Powerline_colorscheme="default"

" Make powerline show up in single windows
set laststatus=2

" Make the nerdtree a bit wider
let g:NERDTreeWinSize = 45

" Remap the leader key
let mapleader = ";"

" No word wrap by default
set nowrap

" Color scheme and font
set guifont=Inconsolata-dz\ For\ Powerline:h11
colorscheme jellybeans

" Conditionals upon if a gui is running
if has('gui_running')
  let titlestring=system('pwd | sed "s/.*\///"')
  execute "set titlestring=".titlestring
else
  set mouse=a
endif

" Show line numbers
set number

" Put a little transparency in
if exists("&transparency")
  set transparency=3
endif

" Set the right gutter to 80 characters
if exists("&colorcolumn")
  set colorcolumn=80
endif

" Convenience binding to open up ~/.vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Map nerdtree to <leader>nt
nnoremap <leader>nt :NERDTreeToggle<cr> :NERDTreeMirror<CR>

" Binding to strip all trailing whitespace from file
nnoremap <leader>w :FixWhitespace<cr>

" Setup tabs to be two spaces
set softtabstop=2 shiftwidth=2 expandtab
