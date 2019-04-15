" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set shell=zsh
filetype off

if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/lastpos.vim'
Plug 'sjl/gundo.vim'
Plug 'mattn/gist-vim'
Plug 'tomtom/tlib_vim'
Plug 'mattn/webapi-vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-rooter'
Plug 'rizzatti/funcoo.vim'

Plug 'stephpy/vim-yaml'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'peterhoeg/vim-qml'

Plug 'icymind/NeoSolarized'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-yarp'
Plug 'sgur/vim-editorconfig'
Plug 'leafgarland/typescript-vim'

call plug#end()

filetype plugin indent on
syntax enable

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
"au BufRead,BufNewFile *.js  set ai sw=2 sts=2 et " Doc strs
au BufRead,BufNewFile *.html set ai sw=2 sts=2 et " Doc strs
au BufRead,BufNewFile *.json set ai sw=2 sts=2 et " Doc strs
au BufNewFile *.py,*.pyw,*.c,*.h,*.json set fileformat=unix
au! BufRead,BufNewFile *.json setfiletype json 
au BufRead,BufNewFile *.go set filetype=go sw=2 tabstop=2 noet

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set ff=unix

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

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

set diffopt+=iwhite

set colorcolumn=80
set cursorline


" Make it beautiful - colors and fonts
if has("gui_running")
  "set guifont=Inconsolata\ XL:h16,Inconsolata:h20,Monaco:h17
  "set guifont=Inconsolata:h18,Monaco:h17
  "set guifont=Source\ Code\ Pro\ Medium:h18
  set guifont=Inconsolata\ for\ Powerline:h20,Monaco:h17
endif

set termguicolors
colorscheme NeoSolarized
set background=light



" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","

"make Y consistent with C and D
nnoremap Y y$

"insert a new-line after the current line by pressing Enter
nmap <S-Enter> O<Esc>

" ," Surround a word with "quotes"
nmap ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
nmap ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
nmap ,( ysiw(
nmap ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" Semicolon at end of line by typing ;;
inoremap ;; <C-o>A;<esc>

" Window/Tab/Split Manipulation
" =============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

noremap ,l :update<CR>
imap ,l <Esc>:update<CR>
inoremap jj <ESC>

nmap ; :

" Dash
" ====
nmap <silent> <leader>d <Plug>DashSearch

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"

" FZF
" ===
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <silent> ,t :Files<CR>
nnoremap <silent> ,b :Buffers<cr>

" Fugitive
" ========
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

" Gist
" ====
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_get_multiplefile = 1

" Gundo
" =====
nmap ,u :GundoToggle<CR>
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1 
" a little wider for wider screens
let g:gundo_width = 60

" NERDTree
" ========

" Cmd-Shift-N for nerd tree
nmap <D-N> :NERDTreeToggle<CR>
nnoremap <silent> ,v :NERDTreeToggle<CR>

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" NERDCommenter
" =============

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ,q to toggle quickfix window (where you have stuff like GitGrep)
" ,oq to open it back up (rare)
nmap <silent> ,qc :CloseSingleConque<CR>:cclose<CR>
nmap <silent> ,qo :copen<CR>
nmap <silent> ,j :cn<CR>
nmap <silent> ,k :cp<CR>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>


" Airline
" =======
let g:airline_powerline_fonts=1
let g:airline_section_a = ''
let g:airline#extensions#ale#enabled = 1


" Visual Paste
" ============

" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
"
vnoremap p "_dP

" Soft Wrapping Text
" ==================
" http://vimcasts.org/episodes/soft-wrapping-text/
function! SetupWrapping()
  set wrap linebreak nolist
  set showbreak=…
endfunction

" TODO: this should happen automatically for certain file types (e.g. markdown)
command! -nargs=* Wrap :call SetupWrapping()<CR>

vmap <D-j> gj
vmap <D-k> gk
vmap <D-$> g$
vmap <D-^> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-$> g$
nmap <D-^> g^
nmap <D-0> g^


" ============================
" Strip Trailing Whitespaces
" ============================
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" ============================
" neosnippet
" ============================
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

vnoremap <leader>bd c<c-r>=system('base64 --decode', @")<cr><esc><Paste>
vnoremap <leader>be c<c-r>=system('base64', @")<cr><esc><Paste>

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" NEOVIM
set inccommand=split

" ALE
" ===

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_echo_cursor = 0
let g:ale_lint_on_enter = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'c': [],
\   'cpp': [],
\   'cmake': ['cmakelint'],
\   'typescript': ['tslint'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'sh': ['shellcheck']
\}

let g:ale_fixers = {
\   'python': ['yapf', 'isort'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'json': ['jq'],
\   'cmake': ['cmakeformat'],
\   'typescript': ['tslint'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'terraform': ['terraform'],
\}

let g:ale_python_mypy_options = '--disallow-untyped-decorators --follow-imports silent --ignore-missing-imports --show-column-numbers --strict-optional --warn-no-return --warn-redundant-casts --warn-return-any --warn-unused-configs --warn-unused-ignores'

let g:ale_typescript_tslint_use_global = 1
let g:ale_typescript_tslint_executable = 'tslint'
let g:ale_typescript_tslint_config_path = '~/.tslint.json'

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

set grepprg=rg\ --vimgrep
nnoremap <Leader>K :Find <C-R><C-W><CR>

" For conceal markers.
if has('conceal')
  set conceallevel=0
endif

" NCM2
" ====
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LSP
" ===

if executable('pyls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python'],
      \ })
endif

nnoremap <leader>fd :LspDefinition<CR>

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')


" Editorconfig
" ============

let g:editorconfig_blacklist = {
    \ 'filetype': ['git.*', 'fugitive'],
    \ 'pattern': ['\.un~$']}

let g:terraform_align=1

