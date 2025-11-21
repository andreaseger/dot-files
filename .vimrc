" =============================================================================
" Basic Configuration
" =============================================================================

" Disable Vi compatibility (use Vim features)
set nocompatible

" Load sensible.vim plugin for sane defaults
runtime! plugin/sensible.vim

" Fix background color erase in some terminals
let &t_ut=''

" Set leader key to space for easier mappings
let mapleader = "\<Space>"

" =============================================================================
" Visual Settings
" =============================================================================

"Column indicators {{{
" Show vertical lines at common text width limits
" 80 and 100 characters are common limits, 120+ are warning zones
let &colorcolumn="80,100,".join(range(120,320),",")
" }}}

"Folding {{{
" Enable code folding based on syntax
set foldmethod=syntax
" Don't fold anything initially (high starting level)
set foldlevel=99
" Maximum fold depth to prevent excessive nesting
set foldnestmax=5
" Enable folding for all files
set foldenable
" Start with most folds open (level 10 means most things visible)
set foldlevelstart=10
" Use F8 to toggle fold under cursor
nnoremap <F8> za
" }}}

" =============================================================================
" Text Editing
" =============================================================================

"Whitespace configuration {{{
" Don't wrap long lines
set nowrap
" Number of spaces tabs count for
set tabstop=2
" Number of spaces for auto-indent
set shiftwidth=2
" Number of spaces for tab key when editing
set softtabstop=2
" Use spaces instead of tabs
set expandtab
" Allow cursor to move to next/previous line with arrow keys at line boundaries
set whichwrap+=<,>,h,l
" }}}

" =============================================================================
" Search Configuration
" =============================================================================

"Searching settings {{{
" Highlight all matches of the current search pattern
set hlsearch
" Ignore case when searching lowercase
set ignorecase
" Override ignorecase if pattern contains uppercase characters
set smartcase
" }}}

" =============================================================================
" Command Line & Completion
" =============================================================================

"Tab completion settings {{{
" Command line completion behavior: show list, complete longest common, then show full
set wildmode=list:longest,list:full
" Files to ignore in tab completion (build artifacts, version control, etc.)
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" }}}

" =============================================================================
" Scrolling & Display
" =============================================================================

"Scrolling behavior {{{
" Minimum number of lines to show above/below cursor (overriding sensible.vim default of 1)
set scrolloff=8
" Minimum number of columns to show left/right of cursor (overriding sensible.vim default of 2)
set sidescrolloff=15
" Note: sidescroll=1 is handled by sensible.vim
" }}}

" Nicer pasting {{{
" Toggle paste mode with F12 to avoid formatting issues when pasting code
set pastetoggle=<F12>
" }}}

" =============================================================================
" Custom Mappings & Commands
" =============================================================================

"Save as sudo trick {{{
" Type :w!! in command mode to save file with sudo privileges
cmap w!! %!sudo tee > /dev/null %
" }}}

"File navigation mappings {{{
" Open file explorer in current file's directory with Leader+ff
map <Leader>ff :e <C-R>=expand("%:p:h") . "/" <CR>
" }}}

"Buffer navigation {{{
" Switch to next buffer with Leader+Tab
map <Leader><Tab> :bn <CR>
" }}}

" =============================================================================
" Autocommands
" =============================================================================

"Auto-reload vimrc when saved {{{
" Automatically reload .vimrc when it's saved to apply changes immediately
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" }}}

"Git commit spell checking {{{
" Enable spell checking in git commit messages to catch typos
augroup git
  au!
  au FileType gitcommit setlocal spell
augroup END
" }}}

"Ruby file type detection {{{
" Set Ruby file type for common Ruby configuration files
augroup ruby
  au!
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru} setlocal filetype=ruby
augroup END
" }}}

"JSON syntax highlighting {{{
" Use JavaScript syntax highlighting for JSON files
augroup json
  au!
  au BufNewFile,BufRead *.{json} setlocal filetype=javascript
augroup END
" }}}

" =============================================================================
" Color Scheme
" =============================================================================

"Set colorscheme {{{
" Color scheme and appearance (if terminal supports it)

if &t_Co >= 256 || has("gui_running")
    set background=dark
    try
      colorscheme slate
    catch
    endtry
endif
" }}}

" =============================================================================
" TMUX aware Navigation
" =============================================================================

" Manual tmux navigation {{{
" Smart navigation between Vim splits and tmux panes
function! TmuxNavigator(dir)
  let l:current = winnr()
  execute "wincmd " . a:dir
  
  " If window didn't change, we're at the edge - tell tmux to switch panes
  if winnr() == l:current
    " Map vim directions to tmux direction flags
    let l:tmux_flag = a:dir == 'h' ? '-L' :
                     \ a:dir == 'j' ? '-D' :
                     \ a:dir == 'k' ? '-U' :
                     \ a:dir == 'l' ? '-R' : ''
    
    if !empty(l:tmux_flag)
      silent call system("tmux select-pane " . l:tmux_flag)
    endif
  endif
endfunction

" Normal mode mappings
nnoremap <silent> <C-h> :call TmuxNavigator('h')<CR>
nnoremap <silent> <C-j> :call TmuxNavigator('j')<CR>
nnoremap <silent> <C-k> :call TmuxNavigator('k')<CR>
nnoremap <silent> <C-l> :call TmuxNavigator('l')<CR>

" " Optional: Insert mode (uses Ctrl-o to temporarily enter normal mode)
" inoremap <silent> <C-h> <C-o>:call TmuxNavigator('h')<CR>
" inoremap <silent> <C-j> <C-o>:call TmuxNavigator('j')<CR>
" inoremap <silent> <C-k> <C-o>:call TmuxNavigator('k')<CR>
" inoremap <silent> <C-l> <C-o>:call TmuxNavigator('l')<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
