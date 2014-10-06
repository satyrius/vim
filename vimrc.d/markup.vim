" This plugin is here to help you editing Handlebars files
Bundle 'nono/vim-handlebars.git'

" Vim Jade template engine syntax highlighting and indention
Bundle 'digitaltoad/vim-jade'

" A vim plugin for highlighting and indenting JST/EJS syntax
Bundle 'briancollins/vim-jst'

" Jinja plugins for vim
Bundle 'lepture/vim-jinja'
" Setup proper file type if you use Jinja templates
" autocmd BufNewFile,BufRead *.html set ft=jinja

" Syntax highlighting for Django templates.
Bundle 'django.vim'
" Setup proper file type if you use Django templates
" autocmd BufNewFile,BufRead *.html set ft=django

" Syntax Highlighting for Stylus
Bundle 'wavded/vim-stylus'

" VIM syntax for LESS (dynamic CSS)
Bundle 'groenewege/vim-less'

augroup my_html_css
    autocmd!
    autocmd FileType html,markdown,jst setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,stylus,jade,django,yaml setlocal softtabstop=2 shiftwidth=2 tabstop=2
augroup END
