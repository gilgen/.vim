" Load up all of the items in bundles
call pathogen#infect()

" Highlight syntax
syntax on

" Indent intelligently
filetype plugin indent on

" Color scheme and font
set guifont=Inconsolata-dz\ For\ Powerline:h15
colorscheme jellybeans

" Make the ruby textobject stuff work
runtime macros/matchit.vim

" Get rid of that annoying underlining in html files
hi link htmlLink NONE

" Some handy stuff for autocmd
if has("autocmd")
  " Nginx highlighting
  au BufNewFile,BufRead nginx.conf set filetype=nginx

  " Auto reload the .vimrc
  autocmd! bufwritepost .vimrc source %

  " Open nerdtree if there wasn't a file specified
  autocmd vimenter * if !argc() | NERDTree | endif
endif

" Some handy auto-completes for handlebars files
let g:mustache_abbreviations = 1

" Don't lose buffer histoy when changing
set hidden

" Don't create swap and backup files
set noswapfile
set nobackup

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
set guioptions-=r

" Don't close if nerdtree is the last thing
" let nerdtree_tabs_autoclose=0

" Highlight search results by default
nnoremap <F3> :set invhlsearch hlsearch?<CR>

" Insert a newline
nnoremap <leader>o o<ESC>k

" Toggle paste mode on/off
nnoremap <F2> :set invpaste paste?<CR>

" Make things fancy
set nocompatible
let g:Powerline_symbols='fancy'
let g:Powerline_theme="default"
let g:Powerline_colorscheme="default"

" Make powerline show up in single windows
set laststatus=2

" Make the nerdtree a bit wider
let g:NERDTreeWinSize = 45

" Nerdtree doesn't have to show tmp
let NERDTreeIgnore=['tmp', 'node_modules', 'bower_components']

" Remap the leader key
let mapleader = ";"

" No word wrap by default
set nowrap

" Conditionals upon if a gui is running
if has('gui_running')
  let titlestring=system('pwd | sed "s/.*\///"')
  execute "set titlestring=".titlestring

  " Always show the tab bar in macvim
  set showtabline=2
else
  set mouse-=a
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Show line numbers
set number

" Put a little transparency in
if exists("&transparency")
  set transparency=5
endif

" Ignore stuff in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Set the right gutter to 80 characters
if exists("&colorcolumn")
  set colorcolumn=80
endif

" Convenience binding to open up ~/.vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Map nerdtree to <leader>nt
nnoremap <leader>nt :NERDTreeToggle<cr> :NERDTreeMirror<cr>

" Binding to strip all trailing whitespace from file
nnoremap <leader>w :FixWhitespace<cr>

" Quicker global search
nnoremap <leader>gs :Gsearch  .<left><left>

" Setup tabs to be two spaces
set softtabstop=2 shiftwidth=2 expandtab

" Ignore stuff in ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/dist/*

" Set the nerdtree folder colour
hi Directory guifg=#7697d6 ctermfg=blue

" Disable code folding
set nofoldenable

" Fix the background transparency
hi Normal ctermbg=none
hi NonText ctermbg=none

map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>
