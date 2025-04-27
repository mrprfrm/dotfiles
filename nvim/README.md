# Neovim

A Lua‑powered setup built on **lazy.nvim**.

## Requirements

- Neovim ≥ 0.10
- `ripgrep`, `fd`, `stylua` (fmt)

## Included plugins (partial)

| Plugin           | Purpose           |
| ---------------- | ----------------- |
| `nvim‑tree`      | File explorer     |
| `telescope`      | Fuzzy finder      |
| `lualine`        | Status line       |
| `nvim‑lspconfig` | LSP glue          |
| `mason.nvim`     | LSP/DAP installer |
| `treesitter`     | Syntax & folds    |

## First‑time setup

```vim
:Lazy sync     " installs plugins
:checkhealth   " verify deps
```

LSP servers auto‑install on first open of a filetype (via Mason).
