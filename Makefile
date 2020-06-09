ln = ln -Ffvs

.PHONY: all symlinks tools

all: symlinks tools

symlinks:
	@$(ln) $(PWD)/bashrc $(HOME)/.profile
	@$(ln) $(PWD)/bashrc $(HOME)/.bashrc
	@$(ln) $(PWD)/xsessionrc $(HOME)/.xsessionrc

tools:
	go get github.com/rogpeppe/godef
	go get golang.org/x/tools/cmd/gorename
	go get marius.ae/tools/g
	go get sny.no/cmd/cpu
	go get sny.no/tools/clip
	go get sny.no/tools/f
	go get sny.no/tools/fmt
