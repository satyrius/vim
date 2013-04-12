My VIM config I use for Python and Ruby development

First, if you want to use outstanding plugins for python development your vim should be built with +python option, follow the installation [instruction](https://gist.github.com/satyrius/1635076). And following python modules should by installed to satisfy *jedi-vim*, *ropevim* and *flake8* requirements. You should install them for python you have used to built into vim.

    pip install jedi
    pip install ropemode
    pip install ropevim
    pip install flake8

To install VIM config just run next commands:

	cd ~
    git clone git://github.com/satyrius/vim.git .vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ln -s .vim/vimrc .vimrc
    vim +BundleInstall +qall

I use very few plugins and manage them using Vundle. My favourite plugins are:

* [Ctrl-P](http://www.vim.org/scripts/script.php?script_id=3736), fuzzy finder written in pure Vimscript;
* [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42), you will love it if you prefer work with buffers instead of tabs;
* [Jedi-VIM](https://github.com/davidhalter/jedi-vim), a binding to the awesome autocompletion library *Jedi*;
* [Ropevim](http://rope.sourceforge.net/ropevim.html), a very powerful refactoring (but not only) tool;
* [Flake8](https://github.com/nvie/vim-flake8), allow to run flake8 on python files;

VIM or DIE!