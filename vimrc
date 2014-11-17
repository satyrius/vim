set nocompatible
let mapleader = ","

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
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" SEARCH AND REPLACE
set gdefault
set history=100
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
nmap <Space> :set invhls<cr>:set hls?<cr>

" COMMAND-LINE COMPLETION
set wildignore+=*.swp,.git
set wildmenu
set wildmode=list:longest,full

" CODE COMPLETE
set complete=.,w,b,t
set completeopt-=preview " Docs preview are very annoying on completion
set omnifunc=syntaxcomplete#Complete

" FORMATTING AND EDITING
set autoindent
set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
vnoremap < <gv
vnoremap > >gv

" THEME AND HIGHLITING
let python_highlight_all=1
set t_Co=256
set background=dark
let g:solarized_underline=0
Bundle 'altercation/vim-colors-solarized'
silent! colorscheme solarized

" COMMON PLUGINS

Bundle 'ctrlp.vim'
let g:ctrlp_match_window_reversed = 0

Bundle 'jlanzarotta/bufexplorer'
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='fullpath'
nmap <silent> <Leader>e :BufExplorer<CR>

Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.swp$']
nmap <silent> <Leader>t :NERDTreeToggle<CR>

Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'scratch.vim'
Bundle 'scrooloose/nerdcommenter'

Bundle 'ekalinin/Dockerfile.vim'

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    execute 'source' f
endfor

" Enable plugins, indention and syntax highlighting after all pluings will be
" installed. Otherwise it will not work.
filetype plugin indent on
syntax on

" Common commads in upper case to do want I want even if the Shift button was
" pressed by accident.
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq

nmap <silent> <Leader>v :e $MYVIMRC<CR>
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
