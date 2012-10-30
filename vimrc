" Load up all of the items in bundles
call pathogen#infect()

" We're using this in a 256 colour terminal
set t_Co=256

" Highlight the current line
set cursorline

" Highlight syntax
syntax on

" Highlight search results by default
nnoremap <F3> :set invhlsearch hlsearch?<CR>

" Toggle paste mode on/off
nnoremap <F2> :set invpaste paste?<CR>

" Make the nerdtree a bit wider
let g:NERDTreeWinSize = 45

" Remap the leader key
let mapleader = ";"

" No word wrap by default
set nowrap

" Indent intelligently
filetype plugin indent on

" Color scheme and font
set guifont=monaco:h11
if has('gui_running')
  colorscheme jellybeans
else
  colorscheme jellybeans
endif

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
nnoremap <leader>evr :so $MYVIMRC<cr>

" Map nerdtree to <leader>nt
nnoremap <leader>nt :NERDTreeToggle<cr>

" Binding to strip all trailing whitespace from file
nnoremap <leader>w :FixWhitespace<cr>

" Show invisibles
" set list
" set listchars=tab:▸\ ,eol:¬

" Setup tabs to be two spaces
set softtabstop=2 shiftwidth=2 expandtab
