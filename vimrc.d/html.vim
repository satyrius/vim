Bundle 'nono/vim-handlebars.git'
Bundle 'digitaltoad/vim-jade'
Bundle 'briancollins/vim-jst'
Bundle 'lepture/vim-jinja'
Bundle 'django.vim'
Bundle 'wavded/vim-stylus'
Bundle 'groenewege/vim-less'

augroup my_html_css
    autocmd!
    autocmd FileType html,jst setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,stylus,jade,django,yaml setlocal softtabstop=2 shiftwidth=2 tabstop=2
augroup END
