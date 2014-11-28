Plug 'evanmiller/nginx-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'

augroup my_misc
    autocmd!
    autocmd BufRead,BufNewFile Dockerfile set ft=Dockerfile
augroup END
