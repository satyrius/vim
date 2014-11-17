Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

augroup my_ruby
    autocmd!
    autocmd FileType ruby,eruby setlocal softtabstop=2 shiftwidth=2 tabstop=2
augroup END
