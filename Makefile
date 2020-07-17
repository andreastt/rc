LN = ln -Ffs

.PHONY: all symlinks tools defaults $(LIBRARY)

ICLOUD = "$(HOME)/Library/Mobile Documents/com~apple~CloudDocs"
LIBRARY += $(HOME)/Library/Fonts $(HOME)/Library/LaunchAgents

ifeq ($(shell uname -s),Darwin)
all: symlinks tools deps defaults $(LIBRARY)
else
all: symlinks tools
endif

symlinks:
	$(LN) $(PWD)/bash/bashrc $(HOME)/.profile
	$(LN) $(PWD)/bash/bashrc $(HOME)/.bashrc

$(HOME)/Library/Fonts:
	-chmod -N $@
	$(RM) -r $@
	$(LN) $(ICLOUD)/Fonts $(dir $@)

$(HOME)/Library/LaunchAgents:
	$(RM) -r $@
	$(LN) $(PWD)/Library/LaunchAgents $(dir $@)

tools:
	go get github.com/rogpeppe/godef
	go get golang.org/x/tools/cmd/gorename
	-go get marius.ae/tools/g
	-go get sny.no/cmd/cpu
	-go get sny.no/tools/clip
	-go get sny.no/tools/edit/...
	-go get sny.no/tools/f
	#-go get sny.no/tools/fmt

deps: Brewfile
	brew update
	brew bundle --file $< --no-lock

defaults:
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
