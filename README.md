My VIM config I use for Python and PHP (depricated) development

To install just enter next commands:

    cd ~
    git clone git://github.com/satyrius/vim.git .vim
    ln -s .vim/vimrc .vimrc
    cd .vim
    git submodule init
    git submodule update
    cd bundle/command-t
    rake make

I use very few plugins and manage them using Pathogen. I prefer git submodules to be up-to-date with my plugins. My favourite plugins are:

* [Command-T](http://www.vim.org/scripts/script.php?script_id=3025), the most helpful navigation plugin I ever seen. It requires vim configured with +ruby option, [make it](https://github.com/satyrius/homebrew/blob/master/Library/Formula/vim-ruby.rb) if you don't have it.
* [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42), you will love it if you prefer work with buffers instead of tabs.

VIM or DIE!
