" No need to be compatible with old vi
set nocompatible

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" BUFFERS AND FILES
set autowriteall
set encoding=utf-8
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r
set hidden
set updatecount=50

" INTERFACE
set clipboard=unnamed " http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing#Comments
set cursorline
set foldmethod=marker
set guifont=Monaco:h14
set laststatus=2
set nowrap
set number
set mouse=a
set scrolloff=3
set showmatch
set noshowmode
set title
set ttyfast

" SEARCH AND REPLACE
set gdefault
set history=100
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" COMMAND-LINE COMPLETION
set wildignore+=*.swp,.git
set wildmenu
set wildmode=list:longest,full

" THEME AND HIGHLITING
let python_highlight_all=1
set t_Co=256
set background=dark
let g:solarized_underline=0
Bundle 'altercation/vim-colors-solarized'
silent! colorscheme solarized

" FORMATTING AND EDITING
set autoindent
set backspace=indent,eol,start
set complete=.,w,b,t
set completeopt-=preview " Docs preview are very annoying on completion
set expandtab
set omnifunc=syntaxcomplete#Complete
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Common commads in upper case to do want I want even if the Shift button was
" pressed by accident.
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq

" Switch between windows faster
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Open .vimrc to edit
nmap <silent> <Leader>v :e $MYVIMRC<CR>

" Toggle highlight search
nmap <Space> :set invhls<cr>:set hls?<cr>

" COMMON PLUGINS {{{

" Set the <Leader>
let mapleader = ","

" Fuzzy file, buffer, mru, tag, etc finder.
Bundle 'ctrlp.vim'
let g:ctrlp_match_window_reversed = 0

" With bufexplorer, you can quickly and easily switch between buffers
Bundle 'jlanzarotta/bufexplorer'
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

Bundle 'ekalinin/Dockerfile.vim'

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    execute 'source' f
endfor

" Enable plugins, indention and syntax highlighting after all pluings will be
" installed. Otherwise it will not work.
filetype plugin indent on
syntax on

augroup tricks
    autocmd!
    " Jump to the last known position in a file just after opening it, if the '" mark is set
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
    " Remove trailing whitespaces before save Someone says its dangerous. Nah! Screw you!
    autocmd BufWritePre * :%s/\s\+$//e
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
