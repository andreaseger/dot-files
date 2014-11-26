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
" Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'tpope/vim-fugitive'

" Completions
" Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'

" Syntax extentions
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'thoughtbot/vim-rspec'
Bundle 'aliva/vim-fish'
Bundle 'elixir-lang/vim-elixir'
"Bundle 'tpope/vim-haml'
" Bundle 'nsf/gocode', {'rtp': 'vim/'}

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
set number
autocmd InsertEnter,WinLeave * :set norelativenumber nonumber
autocmd InsertLeave,WinEnter * :set relativenumber number

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" nicer pasting
set pastetoggle=<F12>

" call commands with ; instead of :
" nnoremap ; :
nnoremap ! :!

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
  au FileType ruby noremap <buffer> <leader>a :call RunTests('spec')<cr>
  au FileType ruby noremap <buffer> <leader>r :call RunTestFile()<cr>
  au FileType ruby noremap <buffer> <leader>t :call RunNearestTest()<cr>
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
" au FileType go setlocal noexpandtab softtabstop=0

augroup elixir
  au!
  au FileType elixir noremap <buffer> <leader>t :!mix test<cr>
augroup END

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
" map <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" toggle NerdTree on <Leader>n with the current directory
nmap <silent> <Leader>n :NERDTreeToggle <CR>

" change buffergator keymap
let g:buffergator_suppress_keymaps=1
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>
" nnoremap <silent> <Leader>t :BuffergatorTabsOpen<CR>
" nnoremap <silent> <Leader>T :BuffergatorTabsClose<CR>

" buffergator mru_switching_keymaps
nnoremap <silent> <M-b> :BuffergatorMruCyclePrev<CR>
nnoremap <silent> <M-S-b> :BuffergatorMruCycleNext<CR>
nnoremap <silent> [b :BuffergatorMruCyclePrev<CR>
nnoremap <silent> ]b :BuffergatorMruCycleNext<CR>
" buffergator mru_switch_into_splits_keymaps
nnoremap <silent> <Leader><LEFT> :BuffergatorMruCyclePrev leftabove vert sbuffer<CR>
nnoremap <silent> <Leader><UP> :BuffergatorMruCyclePrev leftabove sbuffer<CR>
nnoremap <silent> <Leader><RIGHT> :BuffergatorMruCyclePrev rightbelow vert sbuffer<CR>
nnoremap <silent> <Leader><DOWN> :BuffergatorMruCyclePrev rightbelow sbuffer<CR>
nnoremap <silent> <Leader><S-LEFT> :BuffergatorMruCycleNext leftabove vert sbuffer<CR>
nnoremap <silent> <Leader><S-UP> :BuffergatorMruCycleNext leftabove sbuffer<CR>
nnoremap <silent> <Leader><S-RIGHT> :BuffergatorMruCycleNext rightbelow vert sbuffer<CR>
nnoremap <silent> <Leader><S-DOWN> :BuffergatorMruCycleNext rightbelow sbuffer<CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
" let g:syntastic_quiet_warnings=1

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
  let &colorcolumn="80,100,".join(range(120,320),",")
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
" nmap <leader>a :Ack
" let g:ackprg = 'ag --nogroup --column'

" Fix Cursor in TMUX
" if exists('$TMUX')
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" fix YouCompleteMe + UltiSnips
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" extend UltiSnips search path
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" enable project specific vimrc's
set exrc
set secure

"ctags introgration for ctrlp
nnoremap <leader>. :CtrlPTag<cr>

" Test helpers from Gary Bernhardt's screen cast:
" https://www.destroyallsoftware.com/screencasts/catalog/file-navigation-in-vim
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!time bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction
