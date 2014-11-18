Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/JavaScript-syntax'

augroup my_javascript
    autocmd!
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd FileType javascript,coffee setlocal softtabstop=2 shiftwidth=2 tabstop=2 colorcolumn=80
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END
