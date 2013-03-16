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
  call RunSingleConque("bin/rspec " . expand("%p"))
endfunction
map <leader>R :call RSpecFile() <CR>
command! RSpecFile call RSpecFile()

function! RSpecCurrent()
  call RunSingleConque("bin/rspec " . expand("%p") . ":" . line("."))
endfunction
map <leader>r :call RSpecCurrent() <CR>
command! RSpecCurrent call RSpecCurrent()
