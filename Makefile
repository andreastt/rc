LN ?= ln -Ffs

ICLOUD = "$(HOME)/Library/Mobile Documents/com~apple~CloudDocs"
LIBRARY = $(HOME)/Library/Fonts $(HOME)/Library/LaunchAgents

.PHONY: all symlinks tools defaults $(LIBRARY)
all: symlinks tools deps defaults $(LIBRARY)

symlinks:
	$(LN) $(PWD)/bin $(HOME)
	$(LN) $(PWD)/lib $(HOME)
	$(LN) $(PWD)/bash/bashrc $(HOME)/.profile
	$(LN) $(PWD)/bash/bashrc $(HOME)/.bashrc
	$(LN) $(PWD)/tmux/tmux.conf $(HOME)/.tmux.conf
	-$(LN) $(PWD)/Applications/Acme.app /Applications/Acme.app

$(HOME)/Library/Fonts:
	-chmod -N $@
	$(RM) -r $@
	$(LN) $(ICLOUD)/Fonts $(dir $@)

$(HOME)/Library/LaunchAgents:
	$(RM) -r $@
	$(LN) $(PWD)/Library/LaunchAgents $(dir $@)

tools:
	go get 9fans.net/go/acme/Watch
	go get github.com/mariusae/tools/g
	go get github.com/rogpeppe/godef
	go get golang.org/x/tools/cmd/gorename
	go get sny.no/acme/font/...
	go get sny.no/cmd/cpu
	go get sny.no/tools/...
	go get sny.no/tools/edit/...

deps: Brewfile
	brew update
	brew bundle --file $< --no-lock

defaults:
	defaults write -globalDomain CGDisableCursorLocationMagnification -bool true
	defaults write com.apple.ActivityMonitor ShowCategory -int 100
	defaults write com.apple.ActivityMonitor IconType -int 6
