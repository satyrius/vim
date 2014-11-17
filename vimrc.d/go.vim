Plug 'jnwhiteh/vim-golang'
Plug 'spf13/vim-gocode'
Plug 'dgryski/vim-godef'

let g:godef_split=0

augroup my_golang
    autocmd!
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd FileType go call SuperTabSetDefaultCompletionType('<c-x><c-o>')
augroup END
