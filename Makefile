TMP ?= /tmp

curl = curl -fsSL
ln = ln -Fvs

rel = $(subst $(HOME)/,,$(PWD))

.PHONY: all symlinks tools deps bootstrap defaults brew

all: symlinks tools deps
bootstrap: defaults brew

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

deps: Brewfile
	brew update >/dev/null
	brew bundle --file $< --no-lock >/dev/null

brew:
	$(curl) https://raw.githubusercontent.com/Homebrew/install/master/install.sh >$(TMP)/brew.sh
	bash -e $(TMP)/brew.sh </dev/null >/dev/null

defaults:
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
