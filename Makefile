LN = ln -Ffs

.PHONY: all symlinks tools defaults $(HOME)/Library/Fonts

ICLOUD = "$(HOME)/Library/Mobile Documents/com~apple~CloudDocs"

all: symlinks tools deps defaults

symlinks: $(HOME)/Library/Fonts
	$(LN) $(PWD)/bash/bashrc $(HOME)/.profile
	$(LN) $(PWD)/bash/bashrc $(HOME)/.bashrc

$(HOME)/Library/Fonts:
	-chmod -N $@
	$(RM) -r $@
	$(LN) $(ICLOUD)/Fonts $(dir $@)

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
