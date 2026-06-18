# Minimal, clean .zshrc that stays the same on all machines.
# It sources modular files placed in ~/.zsh/ by the stowed package.

# Source OS-specific wiring (created by installer as a symlink)
[ -f ~/.zsh/os.zsh ] && source ~/.zsh/os.zsh

# Source common things (prompt, common functions, aliases)
[ -f ~/.zsh/common.zsh ] && source ~/.zsh/common.zsh

# Source plugin loader (tries multiple locations)
[ -f ~/.zsh/plugins.zsh ] && source ~/.zsh/plugins.zsh

# Source any custom config files (custom.*.zsh pattern)
for custom_config in ~/.zsh/custom.*.zsh(N); do
  source "$custom_config"
done
