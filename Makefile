base = $(shell pwd)

DOTFILES = \
	ackrc \
	eclimrc \
	emacs.d \
	fvwm \
	gitconfig \
	gitignore \
	hgrc \
	pythonrc.py \
	screenrc \
	sh \
	ssh/config \
	vim \
	vimrc \
	Xmodmap \
	Xresources \
	zsh \
	zshrc

all: pre upgrade link packages

pre:
	mkdir ~/.ssh

upgrade:
	sudo apt-get update
	sudo apt-get upgrade

link: $(DOTFILES)
	ln -s $(base)/$< ~/.$^

packages:
	sudo apt-get install `cat debpkgs | uniq | tr "\n" " "`

.PHONY: pre upgrade link packages
