PREFIX ?= /usr/local

install:
	@cp bin/codify $(PREFIX)/bin/codify
	@chmod +x $(PREFIX)/bin/codify
	@echo "Installed codify to $(PREFIX)/bin/codify"

uninstall:
	@rm -f $(PREFIX)/bin/codify
	@echo "Removed codify from $(PREFIX)/bin/codify"

.PHONY: install uninstall
