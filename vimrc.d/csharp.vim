Plug 'tpope/vim-dispatch'
Plug 'nosami/Omnisharp'

set wildignore+=*.meta

augroup my_csharp
    autocmd!
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    autocmd FileType cs call SuperTabSetDefaultCompletionType('<c-x><c-o>')
augroup END
