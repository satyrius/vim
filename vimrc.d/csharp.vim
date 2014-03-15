" Asynchronous build and test dispatcher
Bundle 'tpope/vim-dispatch'

" OmniSharp is a plugin for Vim to provide IDE like abilities for C#.
Bundle 'nosami/Omnisharp'

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType cs call SuperTabSetDefaultCompletionType('<c-x><c-o>')

" Do not suggest and no now show in the tree some file types
set wildignore+=*.meta
let NERDTreeIgnore+=['\.meta$']
