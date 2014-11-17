Plug 'nono/vim-handlebars.git'
Plug 'digitaltoad/vim-jade'
Plug 'briancollins/vim-jst'
Plug 'lepture/vim-jinja'
Plug 'django.vim'
Plug 'wavded/vim-stylus'
Plug 'groenewege/vim-less'

augroup my_html_css
    autocmd!
    autocmd FileType html,jst setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,stylus,jade,django,yaml setlocal softtabstop=2 shiftwidth=2 tabstop=2
augroup END
