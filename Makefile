update:
	vim +BundleInstall +qall

install.vundle:
	[ ! -d bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || true

VIMRC="$(HOME)/.vimrc"

install.vimrc:
	[ -L $(VIMRC) ] && rm $(VIMRC) || true
	ln -s $(CURDIR)/vimrc $(VIMRC)

install: install.vundle install.vimrc update
