" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'vim-scripts/lastpos.vim'
Bundle 'sjl/gundo.vim'
Bundle 'mattn/gist-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'skwp/vim-conque'
Bundle 'gregsexton/gitv'
Bundle 'mattn/webapi-vim'
Bundle 'Lokaltog/powerline'
Bundle 'vim-scripts/SearchComplete'
Bundle 'ap/vim-css-color'
Bundle 'airblade/vim-rooter'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/greper.vim'
Bundle 'vim-scripts/TagHighlight'
Bundle 'slim-template/vim-slim'
Bundle 'aaronjensen/vim-sass-status'
Bundle 'SirVer/ultisnips'
Bundle 'slim-template/vim-slim'
Bundle 'skwp/vim-colors-solarized'
Bundle 'tpope/vim-rvm'
Bundle 'digitaltoad/vim-jade'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-vividchalk'

" Customization
" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.vundles.local"))
  source ~/.yadr/vim/.vundles.local
endif

"Filetype plugin indent on is required by vundle
filetype plugin indent on
