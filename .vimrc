set nocompatible
runtime! plugin/sensible.vim
let &t_ut=''

set background=dark
let base16colorspace=256
colorscheme base16-default-dark

let mapleader = "\<Space>"

"Column indicators {{{
let &colorcolumn="80,100,".join(range(120,320),",")
" }}}

" Folding {{{
set foldmethod=syntax
set foldlevel=99
set foldnestmax=5       " max 10 depth
set foldenable          " do fold files by default on open
set foldlevelstart=10   " open most folds by default
" space open/closes folds
nnoremap <F8> za
" }}}

" Whitespace stuff {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set whichwrap+=<,>,h,l
" }}}

" Searching {{{
set hlsearch
set ignorecase
set smartcase
" }}}

" Tab completion {{{
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" }}}

" Scrolling {{{
set scrolloff=8   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" }}}

" nicer pasting {{{
set pastetoggle=<F12>
" }}}

"save as sudo trick
cmap w!! %!sudo tee > /dev/null %

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>ff :e <C-R>=expand("%:p:h") . "/" <CR>

map <Leader><Tab> :bn <CR>

" autoreload vimrc {{{
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" }}}

" gitcommit {{{
augroup git
  au!
  au FileType gitcommit setlocal spell
augroup END
" }}}

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby {{{
augroup ruby
  au!
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru} setlocal filetype=ruby
augroup END
" }}}

" add json syntax highlighting {{{
augroup json
  au!
  au BufNewFile,BufRead *.{json} setlocal filetype=javascript
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
