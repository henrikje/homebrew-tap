# Homebrew Tap

Homebrew formulae for [Arborist](https://github.com/henrikje/arborist) — a workspace manager for multi-repo projects built on Git worktrees.

## Install

```bash
brew install henrikje/tap/arb
```

## Shell integration

After installing, add to your shell profile:

```bash
# zsh (~/.zshrc)
source "$(brew --prefix)/share/arb/arb.zsh"

# bash (~/.bashrc)
source "$(brew --prefix)/share/arb/arb.bash"
```

This enables the arb cd shell function and tab completion.
