nmap <silent> <Leader>r :make!<CR>
autocmd FileType sql setlocal makeprg=cat\ %\\\|./manage.py\ dbshell
