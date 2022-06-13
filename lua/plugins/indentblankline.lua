vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}

require("indent_blankline").setup {
  show_current_context = true,
}
