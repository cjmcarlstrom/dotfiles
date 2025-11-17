# dotfiles

Managed packages:
- zsh (modular: common, plugins, os fragment)
- starship (~/.config/starship.toml)
- ghostty (~/.config/ghostty/config)

Overview of files:
```text
.
├── .gitignore
├── ghostty
│   └── .config
│       └── ghostty
│           └── config
├── install.sh
├── README.md
├── scripts
│   ├── setup-macos.sh
│   └── setup-ubuntu.sh
├── starship
│   └── .config
│       └── starship.toml
└── zsh
    ├── .zsh
    │   ├── common.zsh
    │   ├── macos.zsh
    │   ├── plugins.zsh
    │   └── ubuntu.zsh
    └── .zshrc

9 directories, 12 files
```

## Prerequisites

### Macos
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install tools
brew install stow starship
brew install --cask ghostty
```

### Ubuntu
```bash
# Install basics
sudo apt update && sudo apt upgrade -y
sudo apt install -y git zsh stow

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Install Ghostty
# Follow installation instructions at: https://ghostty.org/docs/install/build
# Or use the setup script: ./scripts/setup-ubuntu.sh
```

## Installation

```bash
git clone https://github.com/cjmcarlstrom/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Set zsh as default shell

If zsh is not already your default shell:
```bash
chsh -s $(which zsh)
```
Then log out and log back in for the change to take effect.

## Optional: Helper Scripts

For fresh installs, use the helper scripts:
```bash
# macOS
./scripts/setup-macos.sh

# Ubuntu
./scripts/setup-ubuntu.sh
```
