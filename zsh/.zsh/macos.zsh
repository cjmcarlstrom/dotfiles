# macOS-specific wiring (stowed as ~/.zsh/macos.zsh and symlinked to ~/.zsh/os.zsh)

# Homebrew initialization for macOS (ARM and Intel)
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Add user local bin to PATH (for uv and other Python tools)
export PATH="$HOME/. local/bin:$PATH"

# NVM: prefer Homebrew-installed nvm, fallback to ~/.nvm
export NVM_DIR="$HOME/.nvm"
if command -v brew >/dev/null 2>&1; then
  NVM_HOMEBREW="$(brew --prefix nvm 2>/dev/null || true)"
  if [ -n "$NVM_HOMEBREW" ]; then
    [ -s "$NVM_HOMEBREW/nvm.sh" ] && . "$NVM_HOMEBREW/nvm.sh"
    [ -s "$NVM_HOMEBREW/etc/bash_completion.d/nvm" ] && . "$NVM_HOMEBREW/etc/bash_completion.d/nvm"
  else
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  fi
else
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# macOS clipboard passthrough (no-op aliases, keep names consistent)
alias pbcopy='pbcopy'
alias pbpaste='pbpaste'
