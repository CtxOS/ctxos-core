.PHONY: all help install boot bootstrap bootstrup check lint clean test update

SHELL := /bin/bash
.DEFAULT_GOAL := help

YAY_REPO ?= https://aur.archlinux.org/yay-bin.git
CTXOS_BOOTSTRAP_PKGS := base-devel git
CTXOS_DEBIAN_PKGS := git build-essential make
SUDO ?= $(shell command -v sudo 2>/dev/null || true)

all: help

help:
	@printf '%s\n' "CtxOS - Arch Linux Hyprland Dotfiles" "" "Usage: make <target>" "" "Targets:" \
		"  help          Show this help message" \
		"  boot          Boot/install from remote (fresh Arch install)" \
		"  bootstrap     Alias for boot" \
		"  bootstrup     Install all required packages then boot CtxOS" \
		"  install       Install from local repo (~/.local/share/ctxos)" \
		"  check         Run shellcheck on all shell scripts" \
		"  lint          Alias for check" \
		"  test          Run tests (if available)" \
		"  clean         Clean temporary files" \
		"  update        Update dotfiles from git"

boot:
	@if ! command -v pacman >/dev/null 2>&1; then \
		echo "CtxOS bootstrapping requires an Arch Linux system with pacman installed."; \
		echo "Current environment: $(uname -s)"; \
		exit 1; \
	fi
	@echo "Bootstrapping CtxOS repository..."
	@bash boot.sh

bootstrap: boot

bootstrup:
	@echo "Installing required bootstrap packages..."
	@if command -v pacman >/dev/null 2>&1; then \
		$(SUDO) pacman -Sy --noconfirm --needed $(CTXOS_BOOTSTRAP_PKGS); \
	elif command -v apt >/dev/null 2>&1; then \
		$(SUDO) apt-get update -y; \
		$(SUDO) apt-get install -y $(CTXOS_DEBIAN_PKGS); \
	else \
		echo "No supported package manager found (pacman/apt)."; \
		echo "Please install: git make and a build toolchain manually."; \
		exit 1; \
	fi
	@if command -v pacman >/dev/null 2>&1 && ! command -v yay >/dev/null 2>&1; then \
		echo "Installing yay from AUR..."; \
		git clone $(YAY_REPO) /tmp/yay-bin; \
		cd /tmp/yay-bin && makepkg -si --noconfirm; \
		rm -rf /tmp/yay-bin; \
	fi
	@if ! command -v pacman >/dev/null 2>&1; then \
		echo "CtxOS installation requires Arch Linux (pacman)."; \
		echo "Required packages installed, but the full CtxOS boot is Arch-only."; \
		echo "Skipping boot step on this system."; \
		true; \
	else \
		echo "Required packages installed."; \
		$(MAKE) boot; \
	fi

install:
	@echo "Installing CtxOS from local repo..."
	@bash install.sh

check:
	@echo "Running ShellCheck on shell scripts..."
	@if command -v shellcheck >/dev/null 2>&1; then \
		find . -path './.git' -prune -o -name '*.sh' -print0 | xargs -0 shellcheck; \
	else \
		echo "shellcheck not installed. Install with: sudo pacman -S shellcheck"; \
		exit 1; \
	fi

lint: check

test:
	@if command -v bats >/dev/null 2>&1; then \
		find . -path './.git' -prune -o -name '*.bats' -print0 | xargs -0 bats; \
	elif [ -d "tests" ]; then \
		echo "Running shell smoke tests..."; \
		find tests -maxdepth 1 -type f -name '*.sh' -print0 | xargs -0 -n1 bash; \
	else \
		echo "No tests found"; \
	fi

clean:
	@echo "Cleaning temporary files..."
	@find . -path './.git' -prune -o -type f \( -name '*.swp' -o -name '*.swo' -o -name '*~' \) -print -delete 2>/dev/null || true
	@rm -rf bin/*.install bin/*.install-tar docs/*.1 docs/*.5 tests/bin 2>/dev/null || true

update:
	@git pull --rebase
