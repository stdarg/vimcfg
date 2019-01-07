" Begin Vundle Setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-scripts repos
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'stdarg/ir_black_mod'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'stdarg/vim-javascript-syntax'
Plugin 'stdarg/vim-distinguished'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'stdarg/vim-solarized-powerline'
Plugin 'Vimjas/vim-python-pep8-indent'

call vundle#end()
filetype plugin indent on " required!
syntax on " Syntax highlighting
"
" fugitive help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
"
" End of Vundle setup

" Syntastic setup
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" Set up syntastic checkers here
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonval']
let g:syntastic_python_checkers = ['flake8']

highlight SyntasticWarningSign ctermfg=white ctermbg=black
highlight SyntasticErrorLine ctermbg=red ctermbg=black
highlight SyntasticWarningLine ctermbg=yellow ctermbg=black
highlight SyntasticStyleWarningLine ctermbg=yellow ctermfg=black
highlight SyntasticStyleErrorLine ctermbg=red ctermfg=black

" Powerline Setup
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='solarized256_dark'
set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif


" Misc setup
"
" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set eol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Respect modeline in files
" modelines allow you to set variables specific to a file. By default, the
" first and last five lines are read by vim for variable settings. For
" example, if you put the following in the last line of a C program, you would
" get a textwidth of 60 chars when editing that file:
" /* vim: tw=60 ts=2: */
"
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable syntax highlighting
syntax on

" Highlight current line with an underline
set cursorline
set colorcolumn=80

" :set list displays whitespace, while :set nolist displays normally. It is
" convenient to use :set list! to toggle the option on, so that you can later
" press : followed by the up arrow to repeat the previous command, to toggle
" 'list' off.
set list

" Highlight searches
set hlsearch
" super sexy searching
set incsearch

" Ignore case of searches
"set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=v

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Enable line numbers
set number
set relativenumber

" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif

" Toggle function to switch between relative and absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    "set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" Automatically set abs numbering when inserting
autocmd InsertEnter * :set number

" Automatically go to relative numbering when leaving insert mode
autocmd InsertLeave * :set relativenumber

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

filetype plugin indent on
" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" To use omni completion, type <C-X><C-O> while open in Insert mode. If
" matching names are found, a pop-up menu opens which can be navigated using
" the <C-N> and <C-P> keys."
set omnifunc=syntaxcomplete#Complete


" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_

" I like 4 space indents
set sw=4
set ts=4
set softtabstop=4
set expandtab

set nofoldenable
set background=dark
set pastetoggle=<F2>

" Show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

highlight MixedTabsAndSpaces ctermbg=darkgray guibg=darkgray
match MixedTabsAndSpaces /^[ \t]+[^\s]+/
autocmd BufWinEnter * match MixedTabsAndSpaces /^[ \t]+[^\s]+/
autocmd InsertEnter * match MixedTabsAndSpaces /^[ \t]+[^\s]+\%#\@<!$/
autocmd InsertLeave * match MixedTabsAndSpaces /^[ \t]+[^\s]+/
autocmd BufWinLeave * call clearmatches()

highlight MatchParen cterm=bold ctermfg=white ctermbg=black

set history=50 " keep 50 lines of command line history
set showcmd " display incomplete commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

set t_Co=256

" Set a color scheme!
"colorscheme mango " Too fruity
"colorscheme ir_black_mod " Too dark!
colorscheme distinguished " Just right!

" Set color for comments
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Auto text wrap
if has('autocmd')
  au BufRead,BufNewFile *.txt set wm=2 tw=80
  au BufRead,BufNewFile *.md set wm=2 tw=80
endif

" For JSON FIles
au BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" For YAML FIles
au BufRead,BufNewFile *.yaml set filetype=yaml
au BufRead,BufNewFile *.yml set filetype=yaml
augroup yaml
  autocmd!
  autocmd FileType yaml set autoindent
  autocmd FileType yaml set formatoptions=tcq2l
  autocmd FileType yaml set textwidth=78 shiftwidth=4
  autocmd FileType yaml set softtabstop=4 tabstop=4
  autocmd FileType yaml set expandtab
  autocmd FileType yaml set foldmethod=syntax
augroup END

"
" Key Remaps
"
nnoremap <silent> <F3> :SyntasticToggleMode<CR>  " Syntastic toggle mode w/ F3
nnoremap <silent> <F4> :SyntasticCheck<CR>  " Syntastic check with F4
" remove trailing spaces with F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" F8 activates the tag bar, reading ctags
map <F8> :TagbarToggle<CR>
nnoremap <C-n> :call NumberToggle()<cr>

vmap <C-C> "+y

" Alt+leftarrow will go one window left, etc.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"
" Use Ctrl-h,j,k,l to move about windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Change mapleader
let mapleader=","

noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Don't use Ex mode, use Q for formatting
map Q gq
