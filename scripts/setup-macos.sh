#!/usr/bin/env bash
set -euo pipefail

# macOS helper: optional. Review before running.

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# Core tools
brew install git zsh stow

# Utilities used in dotfiles
brew install starship zoxide
brew install zsh-syntax-highlighting zsh-autosuggestions || true

# Ghostty may be a cask; if not available, install manually.
brew install --cask ghostty || echo "ghostty cask not available via Homebrew; install manually."

echo "macOS helper done. Run: ./install.sh macos"
