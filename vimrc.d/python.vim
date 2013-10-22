autocmd FileType python setlocal colorcolumn=80

Bundle 'python.vim'

" Enhanced version of the python syntax highlighting script
Bundle 'satyrius/python-syntax.vim'

if has('python')

function! HasPythonModule(name)
python << EOF
import vim
try:
    __import__(vim.eval('a:name'))
    vim.command('return 1')
except ImportError:
    vim.command('return 0')
EOF
endfunction

" Flake8 is a wrapper around PyFlakes (static syntax checker), PEP8 (style
" checker) and Ned's MacCabe script (complexity checker).
"
" `pyflakes` python module is required:
"
"     pip install pyflakes
"
if HasPythonModule('pyflakes')
    Bundle 'nvie/vim-flake8'
    let g:flake8_ignore="E501" " ignore long lines check
    autocmd BufWritePost *.py call Flake8()
endif

" Ropevim is a plugin for performing python refactorings in vim.
"
" `ropevim` python module is required:
"
"     pip install ropevim
"
if HasPythonModule('ropevim')
    Bundle 'timo/rope-vim'
    nmap <silent> <Leader>g :call RopeGotoDefinition()<CR>
endif

" Activate current virtual environment
    python << EOF
import os, sys
ve_dir = os.environ.get('VIRTUAL_ENV')
if ve_dir:
    ve_dir in sys.path or sys.path.insert(0, ve_dir)
    activate = os.path.join(ve_dir, 'bin', 'activate_this.py')
    execfile(activate, dict(__file__=activate))
EOF

endif