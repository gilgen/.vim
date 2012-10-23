" Load up all of the items in bundles
call pathogen#infect()
syntax on

" Remap the leader key
let mapleader = ";"

" Indent intelligently
filetype plugin indent on

" Color scheme and font
set guifont=inconsolata:h13
colorscheme molokai

" Show line numbers
set number

" Set the right gutter to 80 characters 
if exists("&colorcolumn")
  set colorcolumn=80 
endif

" Use standard two space tabs for coffeescript files
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Close vi if nerdtree is the last remaining buffer (tab?)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open nerdtree if there wasn't a file specified
autocmd vimenter * if !argc() | NERDTree | endif

" Convenience binding to open up ~/.vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Binding to strip all trailing whitespace from file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Show invisibles
" set list
" set listchars=tab:▸\ ,eol:¬
