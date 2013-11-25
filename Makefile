v.install: vundle
	vim +BundleInstall +qall

v.clean: vundle
	vim +BundleClean! +qall

v.update: vundle
	vim +BundleUpdate +qall

v.all: vundle
	vim +BundleClean! +BundleUpdate +BundleInstall +qall

vundle:
	[ ! -d bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || true

VIMRC="$(HOME)/.vimrc"

install.vimrc:
	[ -L $(VIMRC) ] && rm $(VIMRC) || true
	ln -s $(CURDIR)/vimrc $(VIMRC)

install: install.vimrc v.install
