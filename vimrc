" No need to be compatible with old vi
set nocompatible

"
" PATHOGEN
"
" http://www.vim.org/scripts/script.php?script_id=2332
"
" {{{
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
" }}}

"
" COMMON SETTINGS
"
" {{{

" Save file content whenere we leave current buffer or close window
set autowriteall

" Use UTF-8 as the default buffer encoding
set encoding=utf-8

" File encogings list
set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Fix russian keys input
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Set the tags files to be the following
set tags=./tags,tags

" Write swap file to disk after every 50 characters
set updatecount=50

" }}}

"
" INTERFACE (LINES, FOLDING, RULER, etc.)
"
" {{{

" Use markers to specify folds
set foldmethod=marker

" Always show status line, even for one window
set laststatus=2

" Do not wrap long lines, because it is ugly
set nowrap

" Show line numbers
set number

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Show buffer name in the window's title
set title

" Show PEP8 line length border
autocmd FileType python setlocal colorcolumn=80

" }}}

"
" SEARCH OPTIONS
"
" {{{

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Case insensetive search
set ignorecase

" Case sensitive search if search string contains upper case characters
set smartcase

" set the search scan to wrap lines
set wrapscan

" }}}

"
" COMMAND-LINE COMPLETION
"
" {{{

" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" }}}

"
" FORMATTING AND EDITING
"
" {{{

" Allow backspacing over everything
set backspace=indent,eol,start

" C-style indention by default
set cindent

" All tabs will be replaced by spaces
set expandtab

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Remove trailing whitespaces before save
autocmd BufWritePre * :%s/\s\+$//e

" Change indention for python scripts
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" }}}

"
" THEME AND HIGHLITING
"
" {{{

syntax enable
let python_highlight_all=1
set t_Co=256
set background=dark
colorscheme railscasts

" }}}

"
" OMNI COMPLETION
"
" {{{

" Default syntax completion
set omnifunc=syntaxcomplete#Complete

" Completion depends on filetype
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

"
" A FEW SUGGESTIONS BY DAREK WYATT
"
" http://www.derekwyatt.org/vim/the-vimrc-file/
"
" {{{

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Turn off that stupid highlight search
nmap  <Space> :set invhls<cr>:set hls?<cr>

" }}}

"
" A FEW TRICS BY ANDREY ZMIEVSKI
"
" https://github.com/andreiz/vim-settings
"
" {{{

" use CTRL-F for omni completion
imap <C-F> 

" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" open filename under cursor in a new window (use current file's working
" directory)
nmap gf :new %:p:h/<cfile><CR>

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" Set up cscope options
if has("cscope")
	set csprg=cscope
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" }}}

"
" MAPPINGS
"
" {{{

" Set the <Leader> for combo commands
let mapleader = ","

" Switch between windows faster
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Save session
nmap <F2> :mks! .vimses<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Map F4 to re-build tags file
nmap <silent> <F4> :!ctags -f ./tags -R --totals=yes --tag-relative=yes --python-kinds=-iv<CR>

" Nerd tree toggle
nmap <silent> <Leader>r :NERDTreeToggle<CR>

" Buffer explorer open
nmap <silent> <Leader>e :BufExplorer<CR>

" Open tag list hotkey
nnoremap <silent> <Leader>l :TlistOpen<CR>

" }}}

