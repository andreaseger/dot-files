set nocompatible               " be iMproved

" VIM-Plug Config {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" Basics {{{
Plug 'kien/ctrlp.vim'
  " ctrlp settings {{{
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  "ctags introgration for ctrlp
  nnoremap <leader>. :CtrlPTag<cr>

  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag --path-to-agignore=~/.agignore.global %s -l --nocolor -g ""'
  endif
  let g:ctrlp_abbrev = {
      \ 'gmode': 't',
      \ 'abbrevs': [
          \ {
          \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
          \ 'expanded': '',
          \ 'mode': 'pfrz',
          \ },
          \ ]
      \ }
  " }}}

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
  " nmap <leader>a :Ag
  let g:agprg="ag --path-to-agignore=~/.agignore.global --smart-case --literal --column" "use a more fuzzy search

Plug 'scrooloose/syntastic'
Plug 'jeetsukumaran/vim-buffergator'
  " Buffergator Config {{{
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
  "}}}

Plug 'tpope/vim-fugitive'
Plug 'bogado/file-line'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'dbakker/vim-projectroot'

" }}}

" Completions {{{
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  " deoplete Config {{{
  let g:deoplete#enable_at_startup = 1
  " }}}
else
  " Plug 'Valloric/YouCompleteMe', { 'do': 'python2 ./install.py' }
  " YouCompleteMe Config {{{
  let g:ycm_collect_identifiers_from_tags_files = 1
  " }}}
  " Plug 'Shougo/neocomplete.vim'
  " neocomplete Config {{{
  "" Disable AutoComplPop.
  "let g:acp_enableAtStartup = 0
  "" Use neocomplete.
  "let g:neocomplete#enable_at_startup = 1
  "" Use smartcase.
  "let g:neocomplete#enable_smart_case = 1
  "" Set minimum syntax keyword length.
  "let g:neocomplete#sources#syntax#min_keyword_length = 3

  "" Plugin key-mappings.
  "inoremap <expr><C-g>     neocomplete#undo_completion()
  "inoremap <expr><C-l>     neocomplete#complete_common_string()

  "" Recommended key-mappings.
  "" <CR>: close popup and save indent.
  "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  "function! s:my_cr_function()
  "  return neocomplete#close_popup() . "\<CR>"
  "  " For no inserting <CR> key.
  "  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  "endfunction
  "" <TAB>: completion.
  "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  "" <C-h>, <BS>: close popup and delete backword char.
  "inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  "inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  "inoremap <expr><C-y>  neocomplete#close_popup()
  "inoremap <expr><C-e>  neocomplete#cancel_popup()
  "" Close popup by <Space>.
  "" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
  " }}}
end

" }}}

" Syntax extentions {{{
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'kana/vim-textobj-user', {'for': 'ruby'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'skwp/vim-spec-finder', {'for': 'ruby'}
Plug 'bruno-/vim-ruby-fold', {'for': 'ruby'}

Plug 'aliva/vim-fish', {'for': 'fish'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'powerman/vim-plugin-AnsiEsc', {'for': 'elixir'}
" Plug 'nsf/gocode', {'rtp': 'vim/'}

Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'jtratner/vim-flavored-markdown', {'for': 'markdown'}
Plug 'juvenn/mustache.vim', {'for': 'mustache'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'ap/vim-css-color', {'for': 'css'}
"Plug 'tpope/vim-haml'
" }}}

" colors/style {{{
" Plug 'twerth/ir_black'
Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
  " airline settings {{{
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
  " }}}

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
" }}}

call plug#end()

runtime! plugin/sensible.vim
" }}}

" Core Config {{{
set background=light
" solarized {{{
" let g:solarized_termcolors=256
colorscheme solarized
" }}}
" " base16 {{{
" let base16colorspace=256
" colorscheme base16-default
" " }}}
set laststatus=2
set ttimeoutlen=50

"Column indicators {{{
let &colorcolumn="80,100,".join(range(120,320),",")
" }}}

" Directories for swp files {{{
set backupdir=~/.vim/backup
set directory=~/.vim/backup
" }}}

" Automatic Views {{{
set viewoptions-=options
autocmd BufWinLeave ?* mkview!
autocmd BufWinEnter ?* silent loadview
let g:skipview_files = ['*\.vim', '*\.nvim', '*.git']
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }}}

" Folding {{{
set foldmethod=syntax
set foldlevel=99
set foldnestmax=5       " max 10 depth
set foldenable          " do fold files by default on open
set foldlevelstart=10   " open most folds by default
" space open/closes folds
nnoremap <space> za
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

" open new split panes to right and bottom, which feels more natural {{{
set splitbelow
set splitright
" }}}

" backspace over autoindent, line breaks and start of insert {{{
set backspace=indent,eol,start
" }}}

" relative numbers only in command mode {{{
set relativenumber
set number
autocmd InsertEnter,WinLeave * :set nonumber norelativenumber
autocmd InsertLeave,WinEnter * :set number relativenumber
" }}}
" }}} 

" keybindings {{{
" call commands with ; instead of :
" nnoremap ; :
nnoremap ! :!

"save as sudo trick
cmap w!! %!sudo tee > /dev/null %

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" open file browser in vertical split
nmap <silent> <Leader>n :Sex! <CR>
" }}}

" autoreload vimrc {{{
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" }}}

" filetype selection and special stuff {{{

" gitcommit
augroup git
  au!
  au FileType gitcommit setlocal spell
augroup END

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
augroup ruby
  au!
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru} setlocal filetype=ruby
  au FileType ruby noremap <buffer> <leader>a :call RunTests('spec')<cr>
  au FileType ruby noremap <buffer> <leader>r :call RunTestFile()<cr>
  au FileType ruby noremap <buffer> <leader>t :call RunNearestTest()<cr>
  au FileType ruby let g:rubycomplete_buffer_loading = 1 
  au FileType ruby let g:rubycomplete_classes_in_global = 1
  " puts the caller
  au FileType ruby nnoremap <buffer> <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
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

autocmd FileType xdefaults setlocal commentstring=!\ %s
" }}}

" Ruby Test Helper {{{
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
" }}}

"{{{ autoset current directory to project root
function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

" autocmd BufEnter * call <SID>AutoProjectRootCD()
"}}}

"{{{ creating missing parent directories on save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
