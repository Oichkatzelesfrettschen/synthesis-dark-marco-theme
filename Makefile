# Synthesis Dark Marco Theme - Makefile
# Convenience wrapper around Meson build system

PREFIX ?= /usr
DESTDIR ?=
BUILDDIR = builddir

.PHONY: all build install uninstall clean test validate help

all: build

help:
	@echo "Synthesis Dark Marco Theme Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  make build      - Build theme (configure + compile)"
	@echo "  make install    - Install theme to system"
	@echo "  make uninstall  - Remove installed theme"
	@echo "  make clean      - Clean build artifacts"
	@echo "  make test       - Run validation tests"
	@echo "  make validate   - Validate XML, CSS, and SVG files"
	@echo "  make help       - Show this help message"
	@echo ""
	@echo "Options:"
	@echo "  PREFIX=/path    - Installation prefix (default: /usr)"
	@echo "  DESTDIR=/path   - Staging directory for packaging"
	@echo ""
	@echo "Examples:"
	@echo "  make build"
	@echo "  make install PREFIX=/usr/local"
	@echo "  make DESTDIR=/tmp/pkg install"

configure:
	@if [ ! -d "$(BUILDDIR)" ]; then \
		echo "Configuring build with Meson..."; \
		meson setup $(BUILDDIR) --prefix=$(PREFIX); \
	fi

build: configure
	@echo "Building theme..."
	@meson compile -C $(BUILDDIR)

install: build
	@echo "Installing theme..."
	@meson install -C $(BUILDDIR) --destdir=$(DESTDIR)

uninstall:
	@if [ -d "$(BUILDDIR)" ]; then \
		echo "Uninstalling theme..."; \
		ninja -C $(BUILDDIR) uninstall; \
	else \
		echo "Error: Build directory not found. Run 'make build' first."; \
		exit 1; \
	fi

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILDDIR)

test: validate
	@echo "Running tests..."
	@if [ -d "$(BUILDDIR)" ]; then \
		meson test -C $(BUILDDIR) -v; \
	else \
		echo "Warning: Build directory not found. Run 'make build' first."; \
	fi

validate:
	@echo "Validating theme files..."
	@# Validate XML
	@if command -v xmllint >/dev/null 2>&1; then \
		echo "  Validating metacity XML..."; \
		xmllint --noout Synthesis-Dark-Marco/metacity-1/metacity-theme-3.xml && \
		echo "    ✓ metacity-theme-3.xml is valid"; \
	else \
		echo "  Warning: xmllint not found, skipping XML validation"; \
	fi
	@# Validate SVG files
	@if command -v xmllint >/dev/null 2>&1; then \
		echo "  Validating SVG files..."; \
		for svg in Synthesis-Dark-Marco/metacity-1/assets/*.svg Synthesis-Dark-Marco/Kvantum/SynthesisDark/*.svg; do \
			[ -f "$$svg" ] || continue; \
			xmllint --noout "$$svg" 2>/dev/null && echo "    ✓ $$(basename $$svg) is valid" || echo "    ✗ $$(basename $$svg) has errors"; \
		done; \
	fi
	@# Validate CSS
	@if command -v csslint >/dev/null 2>&1; then \
		echo "  Validating CSS..."; \
		csslint --quiet Synthesis-Dark-Marco/gtk-3.0/gtk.css 2>/dev/null && \
		echo "    ✓ gtk.css is valid" || echo "    Note: Some CSS warnings are expected"; \
	fi
	@echo "Validation complete!"

# Development helpers
dev-install: build
	@echo "Installing theme for development (user directory)..."
	@mkdir -p ~/.themes/Synthesis-Dark-Marco
	@cp -r Synthesis-Dark-Marco/* ~/.themes/Synthesis-Dark-Marco/
	@mkdir -p ~/.config/Kvantum/SynthesisDark
	@cp Synthesis-Dark-Marco/Kvantum/SynthesisDark/* ~/.config/Kvantum/SynthesisDark/
	@echo "Theme installed to ~/.themes/Synthesis-Dark-Marco"
	@echo "Kvantum theme installed to ~/.config/Kvantum/SynthesisDark"

dev-uninstall:
	@echo "Removing development installation..."
	@rm -rf ~/.themes/Synthesis-Dark-Marco
	@rm -rf ~/.config/Kvantum/SynthesisDark
	@echo "Development theme removed"
