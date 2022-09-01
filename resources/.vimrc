" Don't touch these lines. This sets the directory for vim related config and
" uses variable interpolation from the Makefile.
let wdir = "++HOMEDIR++/.vim/"
"let &rtp=wdir
set rtp+=++HOMEDIR++/.vim/

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Using vim-plug as the Vim plugin package manager:
let data_dir = "++HOMEDIR++/.vim"
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source "++HOMEDIR++/.vim/.vimrc"
endif

" Run :PlugInstall after adding a line in the list below.
call plug#begin(wdir . 'plug_plugins/')

" Colorscheme:
Plug 'jacoborus/tender.vim'
" Syntax highlighting:
Plug 'sheerun/vim-polyglot'
" Amazing for jumping to symbole definitions/imports/files/etc.
Plug 'pechorin/any-jump.vim'
" File browser plugin
Plug 'preservim/nerdtree'
" Status line beautification
Plug 'vim-airline/vim-airline'
" Git integration:
Plug 'airblade/vim-gitgutter'
" Including an option for fugitive as it's very popular but my workflow doesn't
" need it.
"Plug 'tpope/vim-fugitive'
" CSV:
Plug 'chrisbra/csv.vim'


" Extra Plugins if desired (language support usually)
" Python mode:
"++SHOULD_INCLUDE_PYTHON++Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Floating terminal support:
"++SHOULD_INCLUDE_FLOATERM++Plug 'voldikss/vim-floaterm'

" Slimv support:
"++SHOULD_INCLUDE_SLIMV++Plug 'kovisoft/slimv'

call plug#end()

"
" Re-enable filetype detection:
filetype on
filetype plugin on
filetype indent on

" Turn on syntax highlighting
syntax on

" Set your leader key to Space. No config option for this as I don't believe in
" anything else for a leader key ;)
nnoremap <SPACE> <Nop>
let mapleader = " "

" Show absolute line number for the current line and relative for all others:
set number
set relativenumber

" Highlight cursor positioning:
"set cursorline
"set cursorcolumn

" Whitespace:
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set wrap
set textwidth=79
set noshiftround

" Blink cursor instead of beeping.
set visualbell

" For file stats
set ruler

" Modelines shouldn't be enabled for security purposes
" See https://www.techrepublic.com/blog/it-security/turn-off-modeline-support-in-vim/
set modelines=0

" Encoding
set encoding=utf-8

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
packadd! matchit
  
" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

set history=10000

set wildmenu
set wildmode=list:longest
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.img,*.xlsx

" Folding:
set foldmethod=indent

" Spicy remap jj in insert mode to be escape:
inoremap jj <Esc>

" Colour Scheme:
if (has("termguicolors"))
 set termguicolors
endif
colorscheme tender

let g:airline_theme = 'tender'

" Custom NerdTree mappings:
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>te :tabedit <bar> :NERDTreeToggle<CR>

" Custom GitGutter config:
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Included here as it's specifically for this feature but applies globally.
set updatetime=250
"
"
" Always close the floating terminal e.g. if you press ctrl + d
"++SHOULD_INCLUDE_FLOATERM++let g:floaterm_autoclose=2
" Leader keybind to open a floating terminal
"++SHOULD_INCLUDE_FLOATERM++ nnoremap <leader>ft :FloatermNew<CR>
