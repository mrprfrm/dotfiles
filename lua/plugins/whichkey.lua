local which_key = require("which-key")

which_key.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local mappings = {
  ["a"] = { "<cmd>Alpha<CR>", "Alpha" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>bd!<CR>", "Close buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No highlight" },

  e = {
    name = "Explorer",
    e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
    f = { "<cmd>NvimTreeFindFile<cr>", "Find current file" },
  },
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<CR>", "Find files" },
    s = { "<cmd>Telescope live_grep<CR>", "Find text" },
    p = { "<cmd>Telescope projects<CR>", "Find projects" },
    h = { "<cmd>Telescope help_tags<CR>", "Help" },
    r = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
    c = { "<cmd>Telescope commands<CR>", "Find commands" },
  },
  g = {
    name = "Git",
    g = { "<cmd>lua LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    o = { "<cmd>Telescope git_status<CR>", "Local changes" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Unstage hunk" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
  },
  l = {
    name = "LSP",
    r = { "<cmd>Telescope lsp_references<CR>", "References" },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
    o = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Objects" }
  },
  t = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
    v = { "<cmd>ToggleTerm size=70 direction=vertical<CR>", "Vertical" },
    x = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horisontal" },
  },
}

local options = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,

}

which_key.register(mappings, options)
