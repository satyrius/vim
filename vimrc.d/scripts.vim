" CoffeeScript support for vim.
Bundle 'kchmck/vim-coffee-script'

" Better JavaScrirpt syntax support
Bundle 'vim-scripts/JavaScript-syntax'

autocmd BufNewFile,BufRead *.json set ft=javascript

" JS code should fit 80 columns. Make it sexy.
autocmd FileType javascript,coffee setlocal colorcolumn=80
autocmd FileType coffee setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Custom completion for each file type
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
