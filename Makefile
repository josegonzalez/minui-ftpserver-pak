PAK_NAME := $(shell jq -r .label config.json)

ARCHITECTURES := arm arm64
PLATFORMS := rg35xxplus tg5040

FTPSERVER_VERSION := 0.14.0
JQ_VERSION ?= 1.7.1
MINUI_LIST_VERSION := 0.6.1
MINUI_PRESENTER_VERSION := 0.3.1

clean:
	rm -f bin/*/ftpserver || true
	rm -f bin/*/jq || true
	rm -f bin/*/minui-list || true
	rm -f bin/*/minui-presenter || true

build: $(foreach platform,$(PLATFORMS),bin/$(platform)/minui-list bin/$(platform)/minui-presenter) $(foreach arch,$(ARCHITECTURES),bin/$(arch)/ftpserver bin/$(arch)/jq)

bin/arm/ftpserver:
	mkdir -p bin/arm
	curl -f -o bin/arm/ftpserver -sSL https://github.com/fclairamb/ftpserver/releases/download/v$(FTPSERVER_VERSION)/ftpserver_$(FTPSERVER_VERSION)_linux_armv7.tar.gz
	chmod +x bin/arm/ftpserver
	curl -sSL -o bin/arm/ftpserver.LICENSE "https://raw.githubusercontent.com/fclairamb/ftpserver/refs/heads/$(FTPSERVER_VERSION)/LICENSE"

bin/arm64/ftpserver:
	mkdir -p bin/arm64
	curl -f -o bin/arm64/ftpserver -sSL https://github.com/fclairamb/ftpserver/releases/download/v$(FTPSERVER_VERSION)/ftpserver_$(FTPSERVER_VERSION)_linux_arm64.tar.gz
	chmod +x bin/arm64/ftpserver
	curl -sSL -o bin/arm64/ftpserver.LICENSE "https://raw.githubusercontent.com/fclairamb/ftpserver/refs/heads/$(FTPSERVER_VERSION)/LICENSE"
bin/arm/jq:
	mkdir -p bin/arm
	curl -f -o bin/arm/jq -sSL https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)/jq-linux-armhf
	curl -sSL -o bin/arm/jq.LICENSE "https://raw.githubusercontent.com/jqlang/jq/refs/heads/$(JQ_VERSION)/COPYING"

bin/arm64/jq:
	mkdir -p bin/arm64
	curl -f -o bin/arm64/jq -sSL https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)/jq-linux-arm64
	curl -sSL -o bin/arm64/jq.LICENSE "https://raw.githubusercontent.com/jqlang/jq/refs/heads/$(JQ_VERSION)/COPYING"

bin/%/minui-list:
	mkdir -p bin/$*
	curl -f -o bin/$*/minui-list -sSL https://github.com/josegonzalez/minui-list/releases/download/$(MINUI_LIST_VERSION)/minui-list-$*
	chmod +x bin/$*/minui-list

bin/%/minui-presenter:
	mkdir -p bin/$*
	curl -f -o bin/$*/minui-presenter -sSL https://github.com/josegonzalez/minui-presenter/releases/download/$(MINUI_PRESENTER_VERSION)/minui-presenter-$*
	chmod +x bin/$*/minui-presenter

release: build
	mkdir -p dist
	git archive --format=zip --output "dist/$(PAK_NAME).pak.zip" HEAD
	while IFS= read -r file; do zip -r "dist/$(PAK_NAME).pak.zip" "$$file"; done < .gitarchiveinclude
	ls -lah dist
