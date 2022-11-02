" Load up all of the items in bundles
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

call pathogen#infect()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Highlight syntax
syntax on

" Indent intelligently
filetype plugin indent on

" Automatically read changed files
set autoread

" Setup Python
" set pythonhome=/Users/jgilgen/opt/anaconda3/envs/ansible37
" set pythondll=$HOME/.pyenv/versions/2.7.11/lib/libpython2.7.dylib
" set pythonthreehome=/Users/jgilgen/opt/anaconda3/bin
" set pythonthreedll=/Users/jgilgen/opt/anaconda3/lib/libpython3.7m.dylib

" For some reason, dracula italics causes a gross background color on some
" constants
" let g:dracula_italic = 0

" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
" cnoremap <C-h> <Left>
" cnoremap <C-j> <Down>
" cnoremap <C-k> <Up>
" cnoremap <C-l> <Right>

" Color scheme and font
" set guifont=Inconsolata-dz\ for\ Powerline:h15
" set guifont=Menlo\ for\ Powerline:h15
" set guifont=Cousine\ for\ Powerline:h15
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15
set guifont=SF\ Mono\ Powerline:h15
let g:Powerline_symbols = 'fancy'

" set encoding=utf-8
set t_Co=256

" set term=xterm-256color
" set termencoding=utf-8
" colorscheme dracula
colorscheme onedark

" Script to copy all matches
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Script to copy all matches
function! PowerlineReload()
  execute 'py powerline.reload()'
endfunction
command! -register PowerlineReload call PowerlineReload()

" Make the ruby textobject stuff work
runtime macros/matchit.vim

" shortcut for copying link to GH
" let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

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
" set t_Co=256

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
  set fillchars+=vert:\  
else
  " set mouse-=a
  set mouse=a
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

  " Make the vertical split more attractive
  set fillchars+=vert:\  

endif

" Show line numbers
set number

" Put a little transparency in
" if exists("&transparency")
"   set transparency=2
" endif

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

" Open file under cursor in new split at line
nnoremap <leader>o <C-w>F


" For some reason this is needed for arduino .ino auto indenting
set smartindent


" Function to pull the current arduino port with the arduino-cli command
function! GetArduinoUSBPort()
  return system("arduino-cli board list | grep USB | awk '{print $1}'")
endfunction
command! -register GetArduinoUSBPort call GetArduinoUSBPort()

" Compile current arduino sketch
function! CompileArduinoCurrentDir()
  :! arduino-cli compile --fqbn arduino:avr:uno
endfunction
command! -register CompileArduinoCurrentDir call CompileArduinoCurrentDir()

" Upload current arduino sketch
function! UploadArduinoCurrentDir()
  let port = GetArduinoUSBPort()
  let cmd = "arduino-cli upload --fqbn arduino:avr:uno -p ".port
  execute ':! '.cmd
endfunction
command! -register UploadArduinoCurrentDir call UploadArduinoCurrentDir()

" Compile and upload arduino
function! CompileAndUploadArduinoCurrentDir()
  execute CompileArduinoCurrentDir()
  execute UploadArduinoCurrentDir()
endfunction
command! -register CompileAndUploadArduinoCurrentDir call CompileAndUploadArduinoCurrentDir()

nnoremap <leader>ac :CompileArduinoCurrentDir<cr>
nnoremap <leader>au :UploadArduinoCurrentDir<cr>
nnoremap <leader>aa :CompileAndUploadArduinoCurrentDir<cr>

" Setup tabs to be two spaces
set softtabstop=2 shiftwidth=2 tabstop=2 expandtab

" Ignore stuff in ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/dist/*

" Set the nerdtree folder colour
hi Directory guifg=#7697d6 ctermfg=blue

" Disable code folding
set nofoldenable

" Fix the background transparency
" hi Normal ctermbg=none
" hi NonText ctermbg=none

map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

imap jk <Esc>

" Disable markdown folding
au FileType mkd setlocal nofoldenable

" Open nerdtree in new tabs
autocmd BufWinEnter * NERDTreeMirror

" Close tab when nerdtree only thing left
autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif
