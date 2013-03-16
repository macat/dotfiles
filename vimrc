" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set shell=bash
filetype off


" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Vundle Initialization ===============

set rtp+=~/.vim/bundle/gmarik-vundle/
call vundle#rc()

Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'vim-scripts/lastpos.vim'
Bundle 'sjl/gundo.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'mattn/gist-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tlib_vim.git'
Bundle 'skwp/vim-conque'
Bundle 'gregsexton/gitv'
Bundle 'mattn/webapi-vim.git'
Bundle 'skwp/vim-powerline.git'
Bundle 'vim-scripts/SearchComplete.git'
Bundle 'skammer/vim-css-color'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'airblade/vim-rooter.git'
Bundle 'epmatsw/ag.vim.git'
Bundle 'vim-scripts/TagHighlight.git'
Bundle 'slim-template/vim-slim.git'
Bundle 'aaronjensen/vim-sass-status.git'
Bundle 'SirVer/ultisnips.git'
Bundle 'slim-template/vim-slim.git'
Bundle 'skwp/vim-colors-solarized'
Bundle 'tpope/vim-rvm.git'
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'digitaltoad/vim-jade.git'

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

au BufRead,BufNewFile *.py  set ai sw=4 sts=4 et " Doc strs
au BufRead,BufNewFile *.js  set ai sw=2 sts=2 et " Doc strs
au BufRead,BufNewFile *.html set ai sw=2 sts=2 et " Doc strs
au BufRead,BufNewFile *.json set ai sw=4 sts=4 et " Doc strs
au BufNewFile *.py,*.pyw,*.c,*.h,*.json set fileformat=unix
au! BufRead,BufNewFile *.json setfiletype json 

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=node_modules/**
set wildignore+=public/assets/**

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Window ===========================
" Long lines
set wrap
set textwidth=79
set formatoptions=qn1

" ================ Diff =============================
set diffopt+=iwhite
