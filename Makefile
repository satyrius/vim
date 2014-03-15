install: vimrc plugins

VIMRC="$(HOME)/.vimrc"

vimrc:
	[ -L $(VIMRC) ] && rm $(VIMRC) || true
	ln -s $(CURDIR)/vimrc $(VIMRC)

vundle:
	[ ! -d bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || true

plugins: vundle
	vim +BundleInstall +qall
	cd bundle/Omnisharp/server && xbuild /p:Platform="Any CPU"

clean: vundle
	vim +BundleClean! +qall

update: vundle
	vim +BundleUpdate +qall

all: vundle
	vim +BundleClean! +BundleUpdate +BundleInstall +qall
