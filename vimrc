" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set shell=zsh
filetype off

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.cache/dein')
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-sleuth')
call dein#add('vim-scripts/lastpos.vim')
call dein#add('sjl/gundo.vim')
call dein#add('mattn/gist-vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('kien/ctrlp.vim')
call dein#add('tomtom/tlib_vim')
call dein#add('gregsexton/gitv')
call dein#add('mattn/webapi-vim')
call dein#add('bling/vim-airline')
call dein#add('vim-scripts/SearchComplete')
call dein#add('airblade/vim-rooter')
call dein#add('rizzatti/funcoo.vim')
call dein#add('rizzatti/greper.vim')
call dein#add('stephpy/vim-yaml')
call dein#add('frankier/neovim-colors-solarized-truecolor-only')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-dispatch')
call dein#add('radenling/vim-dispatch-neovim')
call dein#add('fatih/vim-go')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('Shougo/deoplete.nvim')

call dein#add('zchee/deoplete-go', {'build': 'make'})

call dein#end()

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
au BufRead,BufNewFile *.json set ai sw=4 sts=4 et " Doc strs
au BufNewFile *.py,*.pyw,*.c,*.h,*.json set fileformat=unix
au! BufRead,BufNewFile *.json setfiletype json 
au BufRead,BufNewFile *.go set filetype=go sw=2 tabstop=2 noet

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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

" Disable the macvim toolbar
set guioptions-=T

" ================ Diff =============================
set diffopt+=iwhite

" ================ Appearance =======================

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
colorscheme solarized
set background=light



" ========================================
" General vim sanity improvements
" ========================================
"
"
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","

" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

"insert a new-line after the current line by pressing Enter
nmap <S-Enter> O<Esc>
"Shift-Enter for inserting a line before the current line
nmap <CR> o<Esc>


" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
imap <silent> <D-k> _
imap <silent> <D-d> _
imap <silent> <D-K> -
imap <silent> <D-D> -

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
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

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

" Semicolon at end of line by typing ;;
inoremap ;; <C-o>A;<esc>

" Change inside various enclosures with Cmd-" and Cmd-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <D-'> f'ci'
nnoremap <D-"> f"ci"
nnoremap <D-(> f(ci(
nnoremap <D-)> f)ci)
nnoremap <D-[> f[ci[
nnoremap <D-]> f]ci]

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Zoom in and out of current window with ,gz
map <silent> ,gz <C-w>o


" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>


" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

noremap ,ve :e ~/.vimrc<CR>

noremap ,l :update<CR>
imap ,l <Esc>:update<CR>
inoremap jj <ESC>


noremap <Leader>j !python -m json.tool<CR>

" ============================
" Greeper
" ============================
nmap <silent> <leader>g :G<CR>

" ============================
" Dash
" ============================
nmap <silent> <leader>d <Plug>DashGlobalSearch

" ============================
" ConqueTerm
" ============================
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_Color = 2
let g:ConqueTerm_ReadUnfocused = 1 " update conqueterm buffer while we're not looking (for running tests)

" Open up a variety of commands in the ConqueTerm
nmap <silent> <Leader>cc :execute 'ConqueTermSplit script/console --irb=pry'<CR>
nmap <silent> <Leader>pp :execute 'ConqueTermSplit pry'<CR>

let g:ConqueTerm_SendVisKey = '<Leader>e'

" prevent auto insert mode, which is helpful when using conque
" term for running tests
"
autocmd WinEnter * stopinsert

" Cmd-Shift-R for RSpec
nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" Cmd-Shift-L for RSpec Current Line
nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" ,Cmd-R for Last conque command
nmap <silent> ,<D-R> :call RunLastConqueCommand()<CR>

" Get the current highlight group. Useful for then remapping the color
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Source current file Cmd-% (good for vim development)
map <D-%> :so %<CR>

" ,hp = html preview
map <silent> ,hp :!open -a Safari %<CR><CR>

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" ============================
" Tags
" ============================
set tags=tags;

" ============================
" CtrlP
" ============================
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlPMixed<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>

" Additional mapping for buffer search
nnoremap <silent> ,d :GoDeclsDir<cr>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CloseSingleConque<CR>:CtrlPBufTag<CR>

" ============================
" Fugitive
" ============================
" For fugitive.git, dp means :diffput. Define dg to mean :diffget
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

" ============================
" Gist
" ============================
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_get_multiplefile = 1

" ============================
" Gundo
" ============================
nmap ,u :GundoToggle<CR>
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1 
" a little wider for wider screens
let g:gundo_width = 60

" ============================
" NERDTree
" ============================
" Cmd-Shift-N for nerd tree
nmap <D-N> :NERDTreeToggle<CR>
nnoremap <silent> ,v :NERDTreeToggle<CR>

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" ,q to toggle quickfix window (where you have stuff like GitGrep)
" ,oq to open it back up (rare)
nmap <silent> ,qc :CloseSingleConque<CR>:cclose<CR>
nmap <silent> ,qo :copen<CR>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>


" ============================
" Airline
" ============================
let g:airline_powerline_fonts=1
let g:airline_section_a = ''


" ============================
" Visual Paste
" ============================
" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
"
vnoremap p "_dP



" ============================
" Surround
" ============================
" via: http://whynotwiki.com/Vim
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =


" ============================
" Soft Wrapping Text
" ============================
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

" ============================
" Rspec
" ============================
" Does not work on pending 'blocks', only single lines
"
" Given:
" it "foo bar" do
"   pending("bla bla"
"
" Produce:
" xit "foo bar" do
"
function! ChangePendingRspecToXit()
  " Find the next occurrence of pending
  while(search("pending(") > 0)
    " Delete it
    normal dd
    " Search backwards to the it block
    ?it\s
    " add an 'x' to the 'it' to make it 'xit'
    normal ix
  endwhile
endfunction

nnoremap <silent> ,rxit :call ChangePendingRspecToXit()<cr>

" insert a before { } block around a line
nnoremap <silent> \bf ^ibefore { <esc>$a }

function! CloseSingleConque()
  try
    if(exists("g:single_conque"))
      exec "bdelete " . g:single_conque.buffer_name
    endif
  catch
  endtry
endfunction

function! RunSingleConque(command)

  " Close quickfix and location windows that are in the way
  :cclose
  :lclose

  call CloseSingleConque()
  " Keep track of the last command issued.
  let g:last_conque_command = a:command
  let g:single_conque = conque_term#open(a:command, ['botright split', 'res 10'], 1)
endfunction

function! RSpecFile()
  execute "Dispatch docker-compose run test rspec " . expand("%p")

endfunction
map <leader>R :call RSpecFile() <CR>
command! RSpecFile call RSpecFile()

function! RSpecCurrent()
  execute "Dispatch docker-compose run test rspec " . expand("%p") . ":" . line(".")
endfunction
map <leader>r :call RSpecCurrent() <CR>
command! RSpecCurrent call RSpecCurrent()

function! GoT()
  execute "Dispatch docker-compose run app go test ./..."
endfunction
map <leader>G :call GoT() <CR>

function! GoTCurrent()
  execute "Dispatch docker-compose run app go test ./" . expand("%:h")
endfunction
map <leader>g :call GoTCurrent() <CR>

vnoremap <leader>bd c<c-r>=system('base64 --decode', @")<cr><esc><Paste>
vnoremap <leader>be c<c-r>=system('base64', @")<cr><esc><Paste>

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" NEOVIM
set inccommand=split

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'

