require("nvim-treesitter.configs").setup {
  highlight = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
  autotag = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    "html", "css", "scss", "javascript", "lua", "python", "toml", "yaml", "json", "comment"
  }
}
