" No need to be compatible with old vi
set nocompatible

" VUNDLE {{{

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" }}}

" COMMANDS {{{

" Common commads in upper case to do want I want even if the Shift button was
" pressed by accident.
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq

" Enter command mode faster
nnoremap ; :

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
augroup jump_to_the_line
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END

" }}}

" INTERFACE {{{

" Operations such as yy, D, and P work with the system clipboard.
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing#Comments
set clipboard=unnamed

" I want to see where I am
set cursorline

" Use markers to specify folds
set foldmethod=marker

" Setup fonsize for MacVim
set guifont=Monaco:h14

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

let python_highlight_all=1
set t_Co=256
set background=dark
let g:solarized_underline=0
Bundle 'altercation/vim-colors-solarized'
silent! colorscheme solarized

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
set wildignore+=*.swp,.git

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

" Docs preview are very annoying on completion
set completeopt-=preview

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
augroup trip_lines
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" }}}

" COMMON PLUGINS {{{

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
let NERDTreeIgnore=['\.swp$']
nmap <silent> <Leader>t :NERDTreeToggle<CR>

" Supertab is a vim plugin which allows you to use <Tab> for all your insert
" completion needs
Bundle 'ervandew/supertab'

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

" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'

" Bind pressing russian key in normal mode to toggle layout
Bundle 'evindor/vim-rusmode'

" }}}

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    execute 'source' f
endfor

" Enable plugins, indention and syntax highlighting after all pluings will be
" installed. Otherwise it will not work.
filetype plugin indent on
syntax on

" Open .vimrc to edit and source it after save
nmap <silent> <Leader>v :e $MYVIMRC<CR>
augroup reload_vimrc
    autocmd!
    " Souce my .vimrc file every time it was saved.
    " Use *vimrc pattern because ~/.vimrc is a symlink to ~/.vim/vimrc in my
    " case so I want a clever file detection.
    autocmd BufWritePost *vimrc source $MYVIMRC
augroup END

" Enables the reading of .vimrc, .exrc and .gvimrc indent the current
" directory.  If you switch this option on you should also  consider
" setting the 'secure' option.  Using a  local .exrc, .vimrc or .gvimrc
" is a potential security leak, use with   care!
set exrc
set secure
