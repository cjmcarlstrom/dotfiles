#!/usr/bin/env bash
set -euo pipefail

# Ubuntu helper: optional. Review before running.

sudo apt update
sudo apt install -y git zsh stow curl build-essential xclip

# Change default shell to zsh if not already
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to zsh..."
  chsh -s "$(which zsh)"
  echo "Please log out and log back in for the shell change to take effect."
fi

# Install starship
if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install zoxide
if ! command -v zoxide >/dev/null 2>&1; then
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# Clone zsh plugins into ~/.local/share so plugins.zsh can find them
mkdir -p ~/.local/share
if [ ! -d ~/.local/share/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/zsh-syntax-highlighting || true
fi
if [ ! -d ~/.local/share/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/share/zsh-autosuggestions || true
fi

echo "Ubuntu helper done. Run: ./install.sh ubuntu"
