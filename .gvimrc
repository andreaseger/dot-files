" GUI Option to remove the Toolbar (T)
set guioptions-=T

" Sets the font and size
set guifont=Source\ Code\ Pro\ Medium\ 10
set antialias

augroup reload_gvimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost $MYVIMRC source ~/.gvimrc
  autocmd BufWritePost .gvimrc source %
augroup END " }

