ln = ln -Ffvs

.PHONY: all symlinks tools defaults fonts

ICLOUD = "$(HOME)/Library/Mobile Documents/com~apple~CloudDocs"

all: symlinks tools deps defaults fonts

symlinks:
	@$(ln) $(PWD)/bash/bashrc $(HOME)/.profile
	@$(ln) $(PWD)/bash/bashrc $(HOME)/.bashrc

tools:
	go get github.com/rogpeppe/godef
	go get golang.org/x/tools/cmd/gorename
	-go get marius.ae/tools/g
	-go get sny.no/cmd/cpu
	-go get sny.no/tools/clip
	-go get sny.no/tools/f
	#-go get sny.no/tools/fmt

deps: Brewfile
	brew update >/dev/null
	brew bundle --file $< --no-lock >/dev/null

defaults:
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

fonts:
	-chmod -N ~/Library/Fonts
	$(RM) -r ~/Library/Fonts
	$(ln) $(ICLOUD)/Fonts ~/Library
