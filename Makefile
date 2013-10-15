all: upgrade link-dotfiles install-packages

upgrade:
	sudo apt-get update
	sudo apt-get upgrade

link-dotfiles:
	@true

install-packages:
	sudo apt-get install `cat debpkgs | uniq | tr "\n" " "`

.PHONY: upgrade link-dotfiles install-packages
