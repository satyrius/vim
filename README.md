# My VIM config

I am *python* developer and the most of tweeks are for web development and at most for *python*, but it is easy to add support for any other languages or to configure it for any other task.

## Installation

    # Clone the Vim config repo to your home dir
	cd ~
    git clone git://github.com/satyrius/vim.git .vim  # or clone your fork
    # Install
    cd .vim && make install


## Vundle

I use [Vundle](https://github.com/gmarik/vundle) for Vim plugins management, because I found it better that other common solutions. The important thing in *Vundle* installation is to switch off filetype plugins at the begining of your *.vimrc*

	filetype off

Then you activate *Vundle* and start configuring your *.vimrc* as usual

	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()

And let *Vundle* manage *Vundle*

	Bundle 'gmarik/vundle'

Switch back filetype plugins on at the end of your *.vimrc*

	filetype plugin indent on

## .vimrc

My *.vimrc* contains basic *Vim* settings which can be applied to any language. All settings are grouped in a folded sections and has comments, so you can undestand why I use them. It also contain common plugin bundles. Navigation plugins are the most important, in my opinion, espetially when you work on the project, not a single script. My favorites are:

* [Ctrl-P](http://www.vim.org/scripts/script.php?script_id=3736) is a fuzzy finder written in pure Vimscript;
* With [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42) you can quickly and easily switch between buffers, you will love it if you prefer work with buffers instead of tabs;
* [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658) allows you to explore your filesystem and to open files and 
directories. It presents the filesystem to you in the form of a tree which you 
manipulate with the keyboard and/or mouse. It also allows you to perform 
simple filesystem operations.


## vimrc.d

I have *vimrc.d* drectory. It contains additional vim settings files. I use it to keep main *.vimrc* as small as it is possible, to make it clear and easy to undestand *Vim* configuring basics. *vimrc.d* settings are mostly for specific languages (e.g. *Python*, *JavaScript*) and tasks. I do not want to move this settings to *plugin* or *ftplugin* because they have *bundles* definition and should be in the middle of *.vimrc* (see *bundle* section for details).

### Python

As I said above, I am a *Python* developer, so the most advanced settings are for *Python* and they are in *vimrc.d/python.vim*. All major python plugins require *Vim* to be compiled with python support. Check is your *Vim* supports python

	vim --version | grep +python
	
If it does not, you should build you own *with blackjack and hookers*. ~~In fact, forget the Vim!~~ Here is [the recipe](https://gist.github.com/satyrius/1635076) how to do it under *Mac OS X*. After you get the python and vim with python, you should install a few python modules (do it for the python you use in `--with-python-config-dir`, it is usual a system wide python)

    pip install ropevim
    pip install flake8
    
My vim settings are smart enouth to undestand is your *Vim* satisfies all requerements for each python plugin, so it checks for `has('python')` and for python modules installed. It also activates the proper virtualenv for you, it helps *ropevim* to find all you python libs. The most helpful python plugins are

* [Ropevim](http://rope.sourceforge.net/ropevim.html), a very powerful refactoring (but not only) tool;
* [Flake8](https://github.com/nvie/vim-flake8) allow to run flake8 on python files;
    
## local .vimrc

You alway want to add some tiny tweeks for each you project, but cannot add them to the main *.vimrc*, because it should not affect other projects. Fortunately *Vim* allows you to use local (a.k.a per directory) settings. You can see the following at the end of my *.vimrc*

	set exrc
	set secure

Now you can create *.vimrc* in your projects root, change working dir to it, and open *Vim* with *common + local* settings.

## Conclusion

VIM or DIE!