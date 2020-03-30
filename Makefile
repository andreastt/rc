ln = ln -Fvs

rel = $(subst $(HOME)/,,$(PWD))

.PHONY: all symlinks tools

all: symlinks tools

symlinks: \
	$(HOME)/.gitconfig \
	$(HOME)/.profile \
	$(HOME)/.ssh/ \
	$(HOME)/lib/ \
	$(HOME)/bin/

$(HOME)/%:
	@$(ln) $(rel)/$(patsubst .%,%,$(notdir $@)) $@

tools:
	go install sny.no/tools/clip
	go install sny.no/tools/f
