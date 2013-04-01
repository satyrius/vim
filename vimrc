" No need to be compatible with old vi
set nocompatible

" VUNDLE {{{

filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" }}}

" COMMANDS {{{

" Common commads in upper case to do want I want even if the Shift button was
" pressed by accident.
:command W w
:command Q q
:command WQ wq
:command Wq wq

" }}}

" BUFFERS AND FILES {{{

" Save file content whenere we leave current buffer or close window
set autowriteall

" Use UTF-8 as the default buffer encoding
set encoding=utf-8

" File encogings list
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r

" Mark abandoned buffers as hidden instead of unload them
set hidden

" Write swap file to disk after every 50 characters
set updatecount=50

" Jump to the last known position in a file just after opening it, if the '" mark is set
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif

" }}}

" INTERFACE {{{

" Operations such as yy, D, and P work with the system clipboard.
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing#Comments
set clipboard=unnamed

" I want to see where I am
set cursorline

" Use markers to specify folds
set foldmethod=marker

" Always show status line, even for one window
set laststatus=2

" Do not wrap long lines, because it is ugly
set nowrap

" Show line numbers
set number

" Enable mouse to be able to scroll
set mouse=a

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Do not show mode, Powerline does it
set noshowmode

" Show buffer name in the window's title
set title

" Indicate a fast terminal connection
set ttyfast

" Switch between windows faster
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" }}}

" THEME AND HIGHLITING {{{

syntax enable
let python_highlight_all=1
set t_Co=256
set background=light
let g:solarized_underline=0
Bundle 'altercation/vim-colors-solarized'
colorscheme solarized

" }}}

" SEARCH AND REPLACE {{{

" All matches in a line are substituted instead of one
set gdefault

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Case insensetive search
set ignorecase

" Case sensitive search if search string contains upper case characters
set smartcase

" Set the search scan to wrap lines
set wrapscan

" Turn off highlight search
nmap  <Space> :set invhls<cr>:set hls?<cr>

" }}}

" COMMAND-LINE COMPLETION {{{

" Ignore certain types of files on completion
set wildignore+=*.swp,*.pyc,.git,.ropeproject,_generated_media*,media*

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" }}}

" FORMATTING AND EDITING {{{

" Use autoindention
set autoindent

" Allow backspacing over everything
set backspace=indent,eol,start

" Specify how keyword completion should work
set complete=.,w,b,t

" All tabs will be replaced by spaces
set expandtab

" Default syntax completion
set omnifunc=syntaxcomplete#Complete

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Use 4 spaces for inserting <Tab> or using <BS>
set softtabstop=4

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Remove trailing whitespaces before save
" Someone says its dangerous. Nah! Screw you!
autocmd BufWritePre * :%s/\s\+$//e

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" }}}

" PLUGINS {{{

" Set the <Leader>
let mapleader = ","

" Fuzzy file, buffer, mru, tag, etc finder.
Bundle 'ctrlp.vim'
let g:ctrlp_match_window_reversed = 0

" With bufexplorer, you can quickly and easily switch between buffers
Bundle 'bufexplorer.zip'
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='fullpath'
nmap <silent> <Leader>e :BufExplorer<CR>

" A tree explorer plugin for vim.
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.swp$', '\.pyc$', '\.ropeproject$', '_generated_media']
nmap <silent> <Leader>t :NERDTreeToggle<CR>

" With this plugin, your vim comes to automatically opens popup menu for
" completions when you enter characters or move the cursor in Insert mode.
Bundle 'AutoComplPop'
let g:acp_ignorecaseOption = 1

" This plugin is a front for the Perl module App::Ack. Ack can be used as a
" replacement for 99% of the uses of grep. This plugin will allow you to run
" ack from vim, and shows the results in a split window.
Bundle 'mileszs/ack.vim'

" The ultimate vim statusline utility.
Bundle 'Lokaltog/vim-powerline'

" Git wrapper.
Bundle 'tpope/vim-fugitive'

" You can use the scratch plugin to create a temporary scratch buffer to store
" and edit text that will be discarded when you quit/exit vim.
Bundle 'scratch.vim'

" SnipMate aims to be a concise vim script that implements some of
" TextMate's snippets features in Vim.
Bundle 'msanders/snipmate.vim'

" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'

" Bind pressing russian key in normal mode to toggle layout
Bundle 'evindor/vim-rusmode'

" }}}

" JAVASCRIPT, COFFEE, HTML, CSS, ETC. {{{

" CoffeeScript support for vim.
Bundle 'kchmck/vim-coffee-script'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

" PYTHON {{{

autocmd FileType python setlocal colorcolumn=80
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

Bundle 'python.vim'

" Syntax highlighting for Django templates.
Bundle 'django.vim'

" Flake8 is a wrapper around PyFlakes (static syntax checker), PEP8 (style
" checker) and Ned's MacCabe script (complexity checker).
Bundle 'nvie/vim-flake8'
let g:flake8_ignore="E501" " ignore long lines check
autocmd BufWritePost *.py call Flake8()

" Ropevim is a plugin for performing python refactorings in vim.
Bundle 'timo/rope-vim'
nmap <silent> <Leader>g :call RopeGotoDefinition()<CR>

" Activate current virtual environment
if has('python')
    python << EOF
import os, sys
ve_dir = os.environ.get('VIRTUAL_ENV')
if ve_dir:
    ve_dir in sys.path or sys.path.insert(0, ve_dir)
    activate = os.path.join(os.path.join(ve_dir, 'bin'), 'activate_this.py')
    execfile(activate, dict(__file__=activate))
EOF
endif

" }}}

" SQL {{{

nmap <silent> <Leader>r :make!<CR>
autocmd FileType sql setlocal makeprg=cat\ %\\\|./manage.py\ dbshell

" }}}
