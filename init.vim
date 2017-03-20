set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#begin('$HOME/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

" Yet Another JS Syntax file
Plugin 'othree/yajs.vim'

" HTML5 + inline SVG omnicomplete, indent and syntax
Plugin 'othree/html5.vim'

" JSX support
Plugin 'mxw/vim-jsx'

" JsDoc
Plugin 'heavenshell/vim-jsdoc'

" NeoMake build tool (for linting too)
Plugin 'benekastah/neomake'

" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Tmuxline
Plugin 'edkolev/tmuxline.vim'

Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

map ; :
let mapleader=","
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" Quick ESC
imap jj <ESC>

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" Display
set showcmd
set number
set laststatus=2
filetype indent on
set ruler
set autoindent
set nowrap
set path=.,,**
set nohlsearch

" Searching
set ignorecase

" Shortcuts
nmap <C-s> :w<CR>

" Tabs
" Open a new tab with the current buffer's path
noremap <Leader>te :tabedit <C-r>=expand("%:p:h")<CR>/
noremap <Leader>tn :tabnew<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>tn :tabn<CR>
noremap <Leader>tp :tabp<CR>

" Panes
noremap <Leader><Down> <C-W>j
noremap <Leader><Up> <C-W>k
noremap <Leader><Left> <C-W>h
noremap <Leader><Right> <C-W>l

" Buffers
noremap <Leader>e :edit
noremap <Leader>d :bd<CR>
noremap <Leader>w :enew<CR>
noremap <Leader>s :buffers<Space>
noremap <Leader>a :bfirst<CR>
noremap <Leader>l :blast<CR>
noremap <Leader>n :bnext<CR>
noremap <Leader>p :bprevious<CR>

" Ctrl P
let g:ctrlp_custom_ignore='node_modules\|git'
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme= 'molokai'

" Tmuxline
let g:tmuxline_theme = 'molokai'

" Autocmds
autocmd! BufWritePost,BufEnter *.js Neomake

" ESlint
let g:neomake_javascript_enabled_markers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
nmap <Leader><Space>o :lopen<CR>												" open location window
nmap <Leader><Space>c :lclose<CR>												" close location window
nmap <Leader><Space>, :ll<CR>														" go to current error/warning
nmap <Leader><Space>n :lnext<CR>												" next error/warning
nmap <Leader><Space>p :lprev<CR>												" previous error/warning
