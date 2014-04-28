" Github mirror of Go vimscripts, synced with main repository
Bundle 'jnwhiteh/vim-golang'

" Vim Plugin of nsf/gocode for use with Vundle/Pathogen
Bundle 'spf13/vim-gocode'

" This plugin adds godef support to vim.
Bundle 'dgryski/vim-godef'
let g:godef_split=0

augroup my_golang
    autocmd!
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd FileType go call SuperTabSetDefaultCompletionType('<c-x><c-o>')
augroup END
