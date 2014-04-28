" Vim/Ruby Configuration Files
Bundle 'vim-ruby/vim-ruby'

" Ruby on Rails power tools
Bundle 'tpope/vim-rails'

augroup my_ruby
    autocmd!
    autocmd FileType ruby,eruby setlocal softtabstop=2 shiftwidth=2 tabstop=2
augroup END
