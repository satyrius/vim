Plug 'nginx.vim'

augroup my_nginx
    autocmd!
    autocmd BufNewFile,BufRead *etc/nginx* set ft=nginx
augroup END
