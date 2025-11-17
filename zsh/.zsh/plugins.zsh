# Plugin loader: try common installation locations for zsh plugins.

BREW_PREFIX=""
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix 2>/dev/null || true)"
fi

# Source zsh-syntax-highlighting from the first available location
if [ -n "$BREW_PREFIX" ] && [ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Source zsh-autosuggestions from the first available location
if [ -n "$BREW_PREFIX" ] && [ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [ -f ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
