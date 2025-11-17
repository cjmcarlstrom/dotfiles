#!/usr/bin/env bash
set -euo pipefail

# Usage: ./install.sh [macos|ubuntu]
DOTFILES_DIR="${DOTFILES_DIR:-$(pwd)}"
OS_ARG="${1:-}"

if [ -z "$OS_ARG" ]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="ubuntu"
  else
    echo "Unsupported OSTYPE: $OSTYPE"
    exit 1
  fi
else
  OS="$OS_ARG"
fi

echo "Installing dotfiles from $DOTFILES_DIR for OS: $OS"

# Check stow exists (warn if not)
if ! command -v stow >/dev/null 2>&1; then
  echo "Warning: stow not found. Please install stow and re-run this script."
fi

cd "$DOTFILES_DIR"

# Ensure ~/.zsh target dir exists and then stow packages
mkdir -p "$HOME/.zsh"
echo "Stowing packages: zsh starship ghostty"
if ! stow -v -t "$HOME" zsh starship ghostty; then
  echo "Error: stow failed. You may have conflicting files in your home directory."
  echo "To resolve: back up existing files and remove them, or use 'stow --adopt' to merge."
  exit 1
fi

# Create ~/.zsh/os.zsh pointing to the stowed OS fragment (e.g. ~/.zsh/macos.zsh)
TARGET_OS_FILE="$HOME/.zsh/$OS.zsh"
OS_SYMLINK="$HOME/.zsh/os.zsh"

if [ -f "$TARGET_OS_FILE" ]; then
  ln -sf "$TARGET_OS_FILE" "$OS_SYMLINK"
  echo "Created symlink: $OS_SYMLINK -> $TARGET_OS_FILE"
else
  echo "Warning: expected $TARGET_OS_FILE not found after stow. Check that zsh/$OS.zsh exists in repo."
fi

echo "Done. To install packages (optional), run: ./scripts/setup-$OS.sh"
