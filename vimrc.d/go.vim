Plug 'fatih/vim-go'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

augroup my_golang
    autocmd!
    autocmd FileType go call SuperTabSetDefaultCompletionType('<c-x><c-o>')
augroup END
