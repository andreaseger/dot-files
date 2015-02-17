call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-sensible'

" Basics
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-fugitive'

" Completions
" Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'

" Syntax extentions
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'thoughtbot/vim-rspec'
Plug 'aliva/vim-fish'
Plug 'elixir-lang/vim-elixir'
"Plug 'tpope/vim-haml'
" Plug 'nsf/gocode', {'rtp': 'vim/'}

" colors/style
Plug 'ap/vim-css-color'
" Plug 'twerth/ir_black'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

runtime! plugin/sensible.vim

" solarized
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set laststatus=2
set ttimeoutlen=50

"Column indicators
let &colorcolumn="80,100,".join(range(120,320),",")

" Directories for swp files
set backupdir=~/.nvim/backup
set directory=~/.nvim/backup

" record and load last view
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
" but not for commit msg
" au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

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

" nicer pasting
set pastetoggle=<F12>

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" relative numbers only in command mode
 set relativenumber
set number
autocmd InsertEnter,WinLeave * :set nonumber norelativenumber
autocmd InsertLeave,WinEnter * :set number relativenumber

" call commands with ; instead of :
" nnoremap ; :
nnoremap ! :!

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle NerdTree on <Leader>n with the current directory
nmap <silent> <Leader>n :NERDTreeToggle <CR>

" change buffergator keymap
let g:buffergator_suppress_keymaps=1
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>

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

"save as sudo trick
cmap w!! %!sudo tee > /dev/null %

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"ctags introgration for ctrlp
nnoremap <leader>. :CtrlPTag<cr>


" ZOMG the_silver_searcher is so much faster than ack"
nmap <leader>a :Ack
let g:ackprg = 'ag --nogroup --column'


" autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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

" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
" change extenstions
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" set second section to filename
let g:airline_section_b="%f"
" empty third sections
let g:airline_section_c=""

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