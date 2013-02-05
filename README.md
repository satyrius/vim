My VIM config I use for Python development

To install just run next commands in your home directory:

    git clone git://github.com/satyrius/vim.git .vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ln -s .vim/vimrc .vimrc
    vim +BundleInstall +qall

I use very few plugins and manage them using Vundle. My favourite plugins are:

* [Ctrl-P](http://www.vim.org/scripts/script.php?script_id=3736), fuzzy finder written in pure Vimscript;
* [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42), you will love it if you prefer work with buffers instead of tabs;
* [Ropevim](http://rope.sourceforge.net/ropevim.html), a very powerful refactoring (but not only) tool;
* [Flake8](https://github.com/nvie/vim-flake8), allow to run flake8 on python files;

Your vim should bu built with +ryby and +python options. And following python modules should by installed to satisfy *ropevim* and *pyflakes* requirements. You should install them for python you have used to built into vim.

    pip install ropemode
    pip install ropevim
    pip install flake8

VIM or DIE!
