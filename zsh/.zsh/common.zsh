# Common runtime config for all OSes.

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # don't record duplicate consecutive commands
setopt HIST_IGNORE_SPACE      # don't record commands prefixed with a space
setopt SHARE_HISTORY          # share history across sessions

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

# git
alias g='git'
alias gs='git status'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'

# navigation
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

# misc
alias reload='source ~/.zshrc'
