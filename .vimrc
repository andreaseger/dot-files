set shell=/usr/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

Bundle 'ervandew/supertab'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'taq/vim-rspec'

" maybe later
" Bundle 'Lokaltog/vim-easymotion'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'honza/vim-snippets'
Bundle 'jeetsukumaran/vim-buffergator'

Bundle 'ap/vim-css-color'
Bundle 'wgibbs/vim-irblack'

" golang
Bundle 'nsf/gocode', {'rtp': 'vim/'}

"fish
Bundle 'aliva/vim-fish'

filetype plugin indent on

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" highlight unwanted whitespace
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Remember last location in file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" not for commit msg
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" golang specific settings
au FileType go setlocal noexpandtab softtabstop=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" source:  http://stackoverflow.com/questions/4387210/vim-how-to-map-two-tasks-under-one-shortcut-key
let g:relativenumber = 0
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

" eliminate delay on ESC
set timeoutlen=1000 ttimeoutlen=10

" powerline
" set rtp+=~/.powerline/powerline/bindings/vim
set laststatus=2

" colorschema
color ir_black

cmap w!! %!sudo tee > /dev/null %

" nicer pasting
set pastetoggle=<F12>

" call commands with ; instead of :
nnoremap ; :

if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;red\x7"
    silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ "^xterm"
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
