TMP ?= /tmp

curl = curl -fsSL
ln = ln -Fvs

rel = $(subst $(HOME)/,,$(PWD))

.PHONY: all symlinks tools brew bootstrap

all: symlinks tools brew

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

brew: Brewfile
	brew update >/dev/null
	brew bundle --file $< --no-lock >/dev/null

bootstrap:
	chsh -s /bin/bash $(USER)
	$(curl) https://raw.githubusercontent.com/Homebrew/install/master/install.sh >$(TMP)/brew.sh
	bash $(TMP)/brew.sh
