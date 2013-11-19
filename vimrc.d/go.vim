" Github mirror of Go vimscripts, synced with main repository
Bundle 'jnwhiteh/vim-golang'
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Vim Plugin of nsf/gocode for use with Vundle/Pathogen
Bundle 'spf13/vim-gocode'
autocmd FileType go call SuperTabSetDefaultCompletionType('<c-x><c-o>')

" This plugin adds godef support to vim.
Bundle 'dgryski/vim-godef'
let g:godef_split=0
