Plug 'fatih/vim-go', { 'tag': 'v1.0.5' }

augroup my_golang
    autocmd!
    autocmd FileType go call SuperTabSetDefaultCompletionType('<c-x><c-o>')
augroup END
