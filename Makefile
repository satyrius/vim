install: vimrc plugins

VIMRC="$(HOME)/.vimrc"

vimrc:
	[ -L $(VIMRC) ] && rm $(VIMRC) || true
	ln -s $(CURDIR)/vimrc $(VIMRC)

vundle:
	[ ! -d bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle || true

plugins: vundle
	vim +BundleInstall +qall

csharp: install
	command -v xbuild >/dev/null 2>&1 && cd bundle/Omnisharp/server \
		&& xbuild /p:Platform="Any CPU" \
		|| { echo "Cannot build Omnisharp. You should install Mono for xbuild util and try again 'make plugins'"; exit 1; }

clean: vundle
	vim +BundleClean! +qall

update: vundle
	vim +BundleUpdate +qall

all: vundle
	vim +BundleClean! +BundleUpdate +BundleInstall +qall
