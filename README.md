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

## Optional: Bitwarden SSH Agent

If you use Bitwarden to manage your SSH keys, you can configure your shell to use Bitwarden as your SSH agent.

### Prerequisites

**Macos** / **Ubuntu**

Download and install BitWarden.

### Enable SSH Agent in Bitwarden

1. Open Bitwarden Desktop app
2. Go to Settings → Options
3. Enable "SSH agent" option
4. This creates the socket at `~/.bitwarden-ssh-agent.sock`

### Configure Your Shell

The dotfiles automatically source any `custom.*.zsh` files from `~/.zsh/`, so you can add custom configurations without modifying managed files:

**Create the custom Bitwarden config file:**

Edit the `/.zsh/custom.bitwarden.zsh`

```bash
# Bitwarden SSH Agent
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
```

**That's it!** The file will be automatically sourced on your next shell session.

**Why this pattern?**
- Automatically sourced by `.zshrc` - no manual setup needed
- Keeps your customizations separate from managed dotfiles
- `custom.*.zsh` files are gitignored
- Easy to track what you've added: `ls ~/.zsh/custom.*.zsh`
- Extensible for other customizations: `custom.work.zsh`, `custom.ai-tools.zsh`, etc.
- Won't be overwritten when you update the dotfiles repo

### Reload and Verify

Reload your shell:
```bash
source ~/.zshrc
```

Verify SSH agent is working:
```bash
# Check that SSH_AUTH_SOCK is set
echo $SSH_AUTH_SOCK

# List keys available through the agent
ssh-add -l
```
