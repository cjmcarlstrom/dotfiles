# Ubuntu-specific wiring (stowed as ~/.zsh/ubuntu.zsh and symlinked to ~/.zsh/os.zsh)

# Add user local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# If Linuxbrew is installed, initialize it
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# NVM typical installation (official installer location)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" || true
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" || true
