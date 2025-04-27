<img src="https://github.com/user-attachments/assets/fa9e8019-a9ff-4567-9441-4a840c2a65c7" alt="Alt Text" max-height="794">

# dotfiles

A **stow‑ready** collection of dot‑configs that converts a blank macOS/Linux install into my daily dev workstation.

## Features

- **Idempotent bootstrap** – one script handles Homebrew, Stow and symlinking.
- **Polyglot toolchain** – Neovim + LSP, Oh‑My‑Zsh, tmux, direnv, Ghostty.
- **Self‑documenting** – Every component ships its own README.

## Quick start

```bash
# clone + bootstrap
git clone --depth=1 https://github.com/mrprfrm/dotfiles ~/.dotfiles
cd ~/.dotfiles && ./setup.sh   # new consolidated helper
```

> Re‑run setup.sh any time – it safely updates packages & links.

## Directory layout

```
.
├── Brewfile        # GUI/CLI apps for macOS
├── setup.sh        # combined bootstrap
├── zsh/            # shell config
├── tmux/           # terminal multiplexer
├── nvim/           # Neovim (Lua)
├── direnv/         # .env loader
└── ghostty/        # GPU terminal
```

## setup.sh

Combined helper that:

1. Checks OS; installs Homebrew on macOS if missing.
2. Runs `brew bundle`.
3. Ensures `stow` is present; then symlinks **all** modules by default (pass args to limit).
4. Installs Oh‑My‑Zsh + nvm only if `$ZSH` or `$NVM_DIR` not found.

Re‑run safe: script exits if everything up‑to‑date.
