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
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'cometsong/statline.vim'
"Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'

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

" detect vimrc as vim file
au BufRead,BufNewFile {.vimrc} set ft=vim

" add json syntax highlighting
au BufNewFile,BufRead *.{json} set ft=javascript

au BufRead,BufNewFile *.{txt} call s:setupWrapping()

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

set laststatus=2

" colorschema
color ir_black

" solarized
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

"save as sudo trick
cmap w!! %!sudo tee > /dev/null %

" nicer pasting
set pastetoggle=<F12>

" call commands with ; instead of :
nnoremap ; :

" enable basic mouse support
"set mouse=a

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
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=1
" set second section to filename
let g:airline_section_b="%f"
" empty third sections
let g:airline_section_c=""

