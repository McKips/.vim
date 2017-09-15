" vim:fdm=marker
" vim configuration
set nocompatible
filetype plugin indent on
" GUI options {{{
set number
syntax enable
set background=dark
colorscheme solarized 
set laststatus=2

" Set sensible colors.
"
" Additions are green
highlight DiffAdd ctermbg=2
"Deletions are red
highlight DiffDelete ctermbg=1
" MOdifications are black
highlight DiffChange ctermbg=0
" }}}

" Formatting and indentation {{{
" Use spaces instead of tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set ts=2 sw=2 expandtab smarttab
filetype indent plugin on
set autoindent
" }}}

"Editing and text display {{{
set backspace=indent,eol,start
" Always show at least one line above/below the cursor
set scrolloff=1
set sidescrolloff=5
set display+=lastline
" Make whitespace visable
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

"Timeout options for commands
set ttimeout
set ttimeoutlen=0

set formatoptions+=j
set cursorline
set ruler
" }}}

" Searching {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" ag is much faster than grep, and reads .gitignore
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column\ $*
  set grepformat=%f:%l:%c:%m"
  " If this is a git directory, use git's grep
elseif !empty(system("git rev-parse --show-toplevel"))
  set grepprg=git\ grep\ --line-number\ $*
endif
" }}}

" Autocomplete {{{
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
" }}}

" Swap files {{{
set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files
set shortmess+=A
set backupskip=/tmp/*,/private/tmp/*
"}}}

" Undo {{{
set undolevels=10000
set undodir=~/.vim/undo
set undofile
"}}}

" Miscellaneous {{{
" set clipboard+=unnamed
" Include - as part of a word definition. For example, viw will select the
" entier word of 'this-is-hyphened'
set iskeyword+=-

" Recursively add all files and folders to the path
set path+=**

" Display all matching files when we tab complete
set wildmenu
" }}}

" Keyboard Mappings {{{
nnoremap ,<space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap gv `[v`]
inoremap jk <ESC>
nnoremap ,s :mksession<CR>
noremap K;SuperMan <word><CR>
set mouse=a
" }}}

" Syntax Help {{{
let mapleader=","
let g:nerdtree_tabs_open_on_console_startup=0
let g:airline_detect_paste=1
let g:airline#extensions#tablien#enabled=1
let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='^'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors=1
let delimitMate_expand_cr=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_show_diagnostics_ui=0
" }}}

" Nerdtree mapping {{{ 
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>b :TagBarToggle<CR>
" }}}

" auto reloads changes to vimrc when saved {{{
augroup reload_vimrc 
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" }}}
