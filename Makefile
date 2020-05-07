ln = ln -Ffvs

.PHONY: all symlinks tools

all: symlinks tools

symlinks:
	@$(ln) $(PWD)/profile $(HOME)/.profile
	@$(ln) $(PWD)/env.sh $(HOME)/.bashrc
	@$(ln) $(PWD)/ssh/config $(HOME)/.ssh/config

tools:
	go install sny.no/tools/clip
	go install sny.no/tools/f
	go install github.com/rogpeppe/godef
	go install golang.org/x/tools/cmd/gorename
