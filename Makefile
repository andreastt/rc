LN ?= ln -Ffs

.PHONY: all symlinks tools deps
all: symlinks tools deps

symlinks:
	$(LN) $(PWD)/bin $(HOME)
	$(LN) $(PWD)/lib $(HOME)
	$(LN) $(PWD)/bash/bashrc $(HOME)/.profile
	$(LN) $(PWD)/bash/bashrc $(HOME)/.bashrc
	$(LN) $(PWD)/tmux/tmux.conf $(HOME)/.tmux.conf

tools:
	go get github.com/rogpeppe/godef
	go get golang.org/x/tools/cmd/gorename
	go get marius.ae/tools/g
	go get sny.no/tools/...
	go get sny.no/tools/edit/...

deps: Debfile
	cat Debfile | xargs sudo apt install -y
