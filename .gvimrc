" GUI Option to remove the Toolbar (T)
set guioptions-=T
" menu
" set guioptions-=m
" scrollbars
set guioptions-=r
set guioptions-=L

" Sets the font and size
" set guifont=Source\ Code\ Pro\ Medium\ 10
set guifont=Consolas\ 12
set antialias

augroup reload_gvimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost $MYVIMRC source ~/.gvimrc
  autocmd BufWritePost .gvimrc source %
augroup END " }

function! NumberOfWindows()
  let i = 1
  while winbufnr(i) != -1
  let i = i+1
  endwhile
  return i - 1
endfunction


function! DonotQuitLastWindow()
  if NumberOfWindows() != 1
    let v:errmsg = ""
    silent! quit
    if v:errmsg != ""
        "echohl ErrorMsg | echomsg v:errmsg | echohl NONE
        "echoerr v:errmsg
        echohl ErrorMsg | echo v:errmsg | echohl NONE
    endif
  else
     echohl Error | echo "Can't quit the last window..." | echohl None
  endif
endfunction

cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'call DonotQuitLastWindow()' : 'q'
cnoreabbrev <expr> qa getcmdtype() == ":" && getcmdline() == 'qa' ? 'call DonotQuitLastWindow()' : 'qa'
