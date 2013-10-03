set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'

" Basics
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'jeetsukumaran/vim-buffergator'

" Syntax extentions
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'thoughtbot/vim-rspec'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'aliva/vim-fish'
Bundle 'elixir-lang/vim-elixir'
"Bundle 'tpope/vim-haml'

" colors/style
Bundle 'ap/vim-css-color'
" Bundle 'twerth/ir_black'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'christoomey/vim-tmux-navigator'

" disabled
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'honza/vim-snippets'

" load sensible defaults
runtime! plugin/sensible.vim

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set whichwrap+=<,>,h,l

" Searching
set hlsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Scrolling
set scrolloff=8   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" lower vims updatetime (default=4000)
set updatetime=750

" solarized
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" relative numbers only in command mode
set relativenumber
autocmd InsertEnter,WinLeave * :set norelativenumber
autocmd InsertLeave,WinEnter * :set relativenumber

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" nicer pasting
set pastetoggle=<F12>

" call commands with ; instead of :
nnoremap ; :

" enable basic mouse support
"set mouse=a

" autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" record and load last view
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" not for commit msg
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
augroup ruby
  au!
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru} setlocal filetype=ruby
augroup END

" md, markdown, and mk are markdown and define buffer-local preview
"au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
augroup markdown
  au!
  au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mdkn} setlocal filetype=ghmarkdown
augroup END

" detect vimrc as vim file
augroup vimrc
  au!
  au BufRead,BufNewFile {.vimrc,.gvimrc} setlocal filetype=vim
augroup END

" add json syntax highlighting
augroup json
  au!
  au BufNewFile,BufRead *.{json} setlocal filetype=javascript
augroup END

" mustache syntax highlighting
augroup mustache
  au!
  au BufNewFile,BufRead *.{mustache} setlocal filetype=mustache
augroup END

au BufRead,BufNewFile *.{txt} call s:setupWrapping()

" golang specific settings
au FileType go setlocal noexpandtab softtabstop=0

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" toggle NerdTree on <Leader>n with the current directory
nmap <silent> <Leader>n :NERDTreeToggle <CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" source:  http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
let g:relativenumber = 1
function! ToogleRelativeNumber()
  if g:relativenumber == 0
    let g:relativenumber = 1
    set norelativenumber
    set number
  elseif g:relativenumber == 1
    let g:relativenumber = 0
    set nonumber
    set relativenumber
  endif
endfunction
map <F9> :call ToogleRelativeNumber()<cr>
" call it for the first time to initialize it
call ToogleRelativeNumber()

"save as sudo trick
cmap w!! %!sudo tee > /dev/null %

" show a column indicator at textwidth
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" highlight the 80th column
"
" In Vim >= 7.3, also highlight columns 120+
if exists('+colorcolumn')
  " (I picked 120-320 because you have to provide an upper bound and 320 just
  "  covers a 1080p GVim window in Ubuntu Mono 11 font.)
  let &colorcolumn="80,".join(range(120,320),",")
else
  " fallback for Vim < v7.3
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
" remove unused modes
let g:airline_enable_branch=0
let g:airline_enable_syntastic=1
" set second section to filename
let g:airline_section_b="%f"
" empty third sections
let g:airline_section_c=""

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ZOMG the_silver_searcher is so much faster than ack"
nmap <leader>a :Ack
let g:ackprg = 'ag --nogroup --column'

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif



