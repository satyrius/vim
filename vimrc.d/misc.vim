Plug 'evanmiller/nginx-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'hashivim/vim-terraform'
Plug 'm-kat/aws-vim'

augroup my_misc
    autocmd!
    autocmd BufRead,BufNewFile Dockerfile set ft=Dockerfile
augroup END
