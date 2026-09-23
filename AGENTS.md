# CtxOS Project Context

## Overview
CtxOS is a dotfiles/OS configuration framework for Arch Linux. It transforms a fresh Arch installation into a fully-configured, beautiful Hyprland-based desktop environment optimized for web development.

## Project Structure
- `install.sh` / `boot.sh` - Main entry points for installation
- `install/` - 20+ shell scripts organized by task (yay, fonts, themes, development, desktop, etc.)
- `default/` - Default bash and hyprland configs
- `config/` - Application configs (alacritty, waybar, nvim, btop, wofi, fastfetch, etc.)
- `themes/` - 6 themes: everforest, nord, gruvbox, tokyo-night, catppuccin, kanagawa
- `migrations/` - Migration scripts (timestamped)
- `applications/` - .desktop files for app menu integration

## Tech Stack
- Shell scripting (bash) for all install/config logic
- Hyprland compositor configuration
- Arch Linux / pacman / yay package management
- Git with LFS and dual remotes (origin fork, upstream CtxOS/ctxos-core)

## Key Patterns
- Install scripts use `yay -S --noconfirm --needed` for package installation
- `install.sh` sources all scripts in `install/` directory
- Themes follow a consistent structure with CSS, TOML, and config files per app
- Configs use declarative dotfile management

## Development Notes
- All scripts use `set -e` for strict error handling
- `install.sh` has a trap for retry on failure
- `boot.sh` clones repo to `~/.local/share/ctxos/`
- Branches: `main`, `v1.0.0` (release)
- Remotes: `origin` (fork), `upstream` (upstream)

## Testing
- BATS tests exist in the project
- ShellCheck is used for linting shell scripts
- Pre-commit hooks configured

## CI/CD
- GitHub Actions configured for CI workflow
- Node.js actions used in CI pipeline
