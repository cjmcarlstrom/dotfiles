# Common runtime config for all OSes.

# starship (prompt) and zoxide initialization if installed.
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# GO user bin
[ -d "$HOME/go/bin" ] && PATH="$PATH:$HOME/go/bin"
export PATH

# Global alias requested: g -> git
alias g='git'

# Useful common aliases
alias ll='ls -lah'
alias gs='git status'
