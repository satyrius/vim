set nocompatible
let mapleader = ","

call plug#begin('~/.vim/bundle')

" BUFFERS AND FILES
set autowriteall
set encoding=utf-8
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r
set hidden
set noswapfile
set updatecount=50

" INTERFACE
set clipboard=unnamed " http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing#Comments
set cursorline
set foldmethod=marker
set guifont=Monaco:h14
set laststatus=2
set nowrap
set number
set modeline
set modelines=5
set mouse=a
set scrolloff=3
set showmatch
set noshowmode
set title
set ttyfast
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

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
set t_Co=256
set background=dark
Plug 'altercation/vim-colors-solarized'
let g:solarized_underline=0

" COMMON PLUGINS

Plug 'kien/ctrlp.vim', { 'tag': '1.79' }
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](env|pyenv|node_modules|bower_components)$',
    \ }

Plug 'jlanzarotta/bufexplorer', { 'tag': 'v7.4.6' }
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='fullpath'
nmap <silent> <Leader>e :BufExplorer<CR>

Plug 'scrooloose/nerdtree', { 'tag': '4.2.0' }
let NERDTreeIgnore=[]
nmap <silent> <Leader>t :NERDTreeToggle<CR>

Plug 'ervandew/supertab', { 'tag': '2.1' }
Plug 'mileszs/ack.vim', { 'tag': '1.0.8' }
Plug 'Lokaltog/powerline', { 'tag': '1.2' }
Plug 'tpope/vim-fugitive', { 'tag': 'v2.1' }
Plug 'kana/vim-scratch', { 'tag': '0.1.1' }
Plug 'scrooloose/nerdcommenter', { 'tag': '2.3.0' }

for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    execute 'source' f
endfor

call plug#end()
silent! colorscheme solarized

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
