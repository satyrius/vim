Plug 'fatih/vim-go'

augroup my_golang
    autocmd!
    autocmd FileType go call SuperTabSetDefaultCompletionType('<c-x><c-o>')
augroup END
