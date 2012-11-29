" Load up all of the items in bundles
call pathogen#infect()

" No error bells
set noeb vb t_vb=

" We're using this in a 256 colour terminal
set t_Co=256

" Make dot work in visual mode
vnoremap . :norm.<CR>

" Highlight the current line
set cursorline

" Highlight syntax
syntax on

" Get rid of that annoying underlining in html files
hi link htmlLink NONE

" Highlight search results by default
nnoremap <F3> :set invhlsearch hlsearch?<CR>

" Toggle paste mode on/off
nnoremap <F2> :set invpaste paste?<CR>

" Make things fancy
let g:Powerline_symbols = 'fancy'

" Make the nerdtree a bit wider
let g:NERDTreeWinSize = 45

" Remap the leader key
let mapleader = ";"

" No word wrap by default
set nowrap

" Indent intelligently
filetype plugin indent on

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

" Auto reload the .vimrc
autocmd! bufwritepost .vimrc source %

" Show line numbers
set number

" Put a little transparency in
" if exists("&transparency")
"   set transparency=0
" endif

" Set the right gutter to 80 characters
if exists("&colorcolumn")
  set colorcolumn=80
endif

" Use standard two space tabs for coffeescript files
" au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Open nerdtree if there wasn't a file specified
autocmd vimenter * if !argc() | NERDTree | endif

" Convenience binding to open up ~/.vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Map nerdtree to <leader>nt
nnoremap <leader>nt :NERDTreeToggle<cr>

" Binding to strip all trailing whitespace from file
nnoremap <leader>w :FixWhitespace<cr>

" Show invisibles
" set list
" set listchars=tab:▸\ ,eol:¬

" Setup tabs to be two spaces
set softtabstop=2 shiftwidth=2 expandtab
